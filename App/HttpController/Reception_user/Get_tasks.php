<?php
/**
 * @Author WangYi
 * @Date 2021/4/6 17:17
 * @Version 1.0
 */


namespace App\HttpController\Reception_user;

use App\HttpController\IndexBase;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use App\Model\ProjectModel;
use App\Model\ReceptionOrdersModel;


/**
 * Class Get_tasks
 *  接待  成員提交任務
 */
class Get_tasks extends IndexBase
{


    # 接待成員提交每日 任務
    function submit_task()
    {

        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                # 用戶每日 獲取自己的  訂單列表
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['user_id'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }
                $model = ReceptionOrdersModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                $list = $model->all(['user_id' => $data['user_id']]);


                foreach ($list as $k => $value) {

                    $res = DevicesTypeModel::create()->get(['id' => $value['devices_type_id']]);
                    $one = DevicesModel::create()->get(['id' => $value['devices_id']]);
                    $there=ProjectModel::create()->get(['id'=>$value['project_id']]);
                    if ($res && $one) {
                        $list[$k]['devices_type_id'] = $res['name'];
                        $list[$k]['devices_id'] = $one['remark'];
                        $list[$k]['project_id']=$there['name'];
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


            #POST 添加數據
            $data = $this->request()->getParsedBody();

            if (!isset($data['user_id']) || !isset($data['devices_id']) || !isset($data['doing_nums']) || !isset($data['remark']) || !isset($data['devices_type_id']) || !isset($data['project_id'])) {
                $this->writeJson(-101, [], '添加參數非法');
                return false;
            }


            $add = [
                'user_id' => $data['user_id'],
                'devices_id' => $data['devices_id'],
                'devices_type_id' => $data['devices_type_id'],
                'doing_nums' => $data['doing_nums'],
                'remark' => $data['remark'],
                'project_id' => $data['project_id'],
                'created_at' => time(),
                'updated_at' => time(),
                'date'=>$data['date']
            ];

            $res = ReceptionOrdersModel::create()->data($add)->save();
            return $this->isOk($res, '添加');

        } catch (\Throwable $exception) {
            $this->writeJson(-1, [], '異常:' . $exception->getMessage());
            return false;
        }


    }


}