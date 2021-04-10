<?php
/**
 * @Author WangYi
 * @Date 2021/4/6 18:34
 * @Version 1.0
 */


namespace App\HttpController\Reception_admin;


use App\HttpController\IndexBase;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use App\Model\ProjectModel;
use App\Model\ReceptionListModel;
use App\Model\ReceptionOrdersModel;
use App\Model\UserModel;
use EasySwoole\ORM\Exception\Exception;
use EasySwoole\Validate\Functions\IsFloat;

class Task extends IndexBase
{


    #  接待管理員 獲取 成員的 任務
    function get_task()
    {

        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                # 用戶每日 獲取自己的  訂單列表
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = ReceptionOrdersModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');


                if (isset($data['user_id'])) {
                    $model = $model->where(['user_id' => $data['user_id']]);
                }


                # 獲取今日  提交的數據


                if (isset($data['reception_list_id']) && isset($data['project_id'])) {
                    $model = $model->where(['reception_list_id' => 0, 'project_id' => $data['project_id']]);
                }

                $list = $model->all();
                foreach ($list as $k => $value) {
                    $res = DevicesTypeModel::create()->get(['id' => $value['devices_type_id']]);
                    $one = DevicesModel::create()->get(['id' => $value['devices_id']]);
                    $two = UserModel::create()->get(['id' => $value['user_id']]);
                    $there = ProjectModel::create()->get(['id' => $value['project_id']]);
                    if ($res && $one) {
                        $list[$k]['devices_type_id'] = $res['name'];
                        $list[$k]['devices_id'] = $one['remark'];
                        $list[$k]['user_id'] = $two['remark'];
                        $list[$k]['project_id'] = $there['name'];
                    }

                }


                $result = $model->lastQueryResult();
                $total = $result->getTotalCount();
                $return_data = [
                    "code" => 0,
                    "msg" => '',
                    'count' => $total,
                    'data' => $list
                ];
                // $this->writeJson(200, $return_data, '获取成功');
                $this->response()->write(json_encode($return_data));
                return true;
            }


            #POST  修改任務
            $data = $this->request()->getParsedBody();

            #删除任务
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除
                $res = ReceptionOrdersModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }


            if (!isset($data['user_id']) || !isset($data['devices_id']) || !isset($data['doing_nums']) || !isset($data['remark']) || !isset($data['id']) || !isset($data['project_id']) || !isset($data['devices_type_id']) || !isset($data['date'])) {
                $this->writeJson(-101, [], '添加參數非法');
                return false;
            }


            $add = [
                'date' => $data['date'],
                'devices_type_id' => $data['devices_type_id'],
                'devices_id' => $data['devices_id'],
                'doing_nums' => $data['doing_nums'],
                'project_id' => $data['project_id'],
                'remark' => $data['remark'],
                'updated_at' => time()
            ];

            $res = ReceptionOrdersModel::create()->where(['id' => $data['id']])->update($add);
            return $this->isOk($res, '添加');

        } catch (\Throwable $exception) {
            $this->writeJson(-1, [], '異常:' . $exception->getMessage());
            return false;
        }


    }


    #  管理員 提交到可樂那邊 的接口
    function submit_kele()
    {
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                # 用戶每日 獲取自己的  訂單列表
                $data = $this->request()->getQueryParams();
                if (!isset($data['limit']) || !isset($data['page'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }
                $model = ReceptionListModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                $list = $model->all();
                foreach ($list as $k => $value) {
                    $there = ProjectModel::create()->get(['id' => $value['project_id']]);
                    if ($there) {
                        $list[$k]['project_id'] = $there['name'];
                    }
                }
                $result = $model->lastQueryResult();
                $total = $result->getTotalCount();
                $return_data = [
                    "code" => 0,
                    "msg" => '',
                    'count' => $total,
                    'data' => $list
                ];
                // $this->writeJson(200, $return_data, '获取成功');
                $this->response()->write(json_encode($return_data));
                return true;
            }


            #POST 提交


            $data = $this->request()->getParsedBody();

            if (!isset($data['id']) || !isset($data['remark']) || !isset($data['nums']) || !isset($data['project_id'])) {
                $this->writeJson(-101, [], '參數不合法');
                return false;
            }


            #删除


            $id_array = explode(",", $data['id']);
            $add = [
                'nums' => $data['nums'],
//                'devices_type_id' => $data['devices_type_id'],
                'remark' => $data['remark'],
                'updated_at' => time(),
                'created_at' => time(),
                'project_id' => $data['project_id'],
                'date' => $data['date']
            ];


            $one = ReceptionListModel::create()->data($add)->save();
            if ($one) {
                foreach ($id_array as $value) {
                    ReceptionOrdersModel::create()->where(['id' => $value])->update(['updated_at' => time(), 'reception_list_id' => $one]);
                }
            }

            $this->writeJson(200, [], '添加成功');

        } catch (\Throwable $e) {
            $this->writeJson(-1, [], "異常:" . $e->getMessage());
            return false;
        }


    }


}