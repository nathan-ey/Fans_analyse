<?php
/**
 * @Author WangYi
 * @Date 2021/4/7 14:11
 * @Version 1.0
 */

namespace App\HttpController\Realization_admin;


use App\HttpController\IndexBase;
use App\Log\LogHandel;
use App\Model\AdminTypeModel;
use App\Model\ChannelModel;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use App\Model\ProjectModel;
use App\Model\RealizationTaskModel;
use App\Model\TaskOrdersModel;
use App\Model\UserModel;
use EasySwoole\ORM\Exception\Exception;
use EasySwoole\RedisPool\RedisPool;

class Project extends IndexBase
{


    # 创建  获取变现项目
    function get_project()
    {

        $log = new LogHandel();
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();
                if (!isset($data['limit']) || !isset($data['page'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = ProjectModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                #获取普通用户 接待成員
                $list = $model->all();
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


            #POST 请求 添加 管理员
            $data = $this->request()->getParsedBody();

            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除
                $res = ProjectModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }
            if (!isset($data['remark']) || !isset($data['name'])) {
                $this->writeJson(-101, [], '添加/修改失败');
                return false;
            }

            if (isset($data['action']) && $data['action'] == "update" && isset($data['id']) && isset($data['status'])) {
                #修改
                $update = [
                    'name' => $data['name'],
                    'status' => $data['status'],
                    'remark' => $data['remark'],
                    'updated_at' => time(),
                ];

                $res = ProjectModel::create()->where(['id' => $data['id']])->update($update);
                return $this->isOk($res, '修改');

            }


            #添加的  管理员是否重复
            $server = ProjectModel::create()->get(['name' => $data['name']]);
            if ($server) {
                $this->writeJson(-101, [], '不要重复添加项目');
                return false;
            }


            $token = $this->Set_Token(36);
            $IN_DATA = [
                'name' => $data['name'],
                'remark' => $data['remark'],
                'status' => 1,
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = ProjectModel::create()->data($IN_DATA)->save();
            if (!$res) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }


            $this->writeJson(200, [], '添加成功');
            return false;

        } catch (\Throwable $e) {
            var_dump($e->getMessage());
            $this->writeJson(-1, [], $e->getMessage());
            $log->log('add_admins 异常:' . $e->getMessage());
            return false;
        }


    }


    # 提交获取 任务
    function get_task()
    {


        $log = new LogHandel();
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = RealizationTaskModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                #获取普通用户 接待成員
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
                $this->response()->write(json_encode($return_data));
                return true;
            }


            #POST 请求 添加 管理员
            $data = $this->request()->getParsedBody();


            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除
                $res = RealizationTaskModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }


            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                #修改
                $update = [
                    'nums' => $data['nums'],
                    'project_id' => $data['project_id'],
                    'remark' => $data['remark'],
                    'updated_at' => time(),
                ];

                RealizationTaskModel::create()->where(['id' => $data['id']])->update($update);
                $this->writeJson(200, [], "修改成功");
                return false;
            }


            $IN_DATA = [
                'project_id' => $data['project_id'],
                'nums' => $data['nums'],
                'date' => $data['date'],
                'remark' => $data['remark'],
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = RealizationTaskModel::create()->data($IN_DATA)->save();
            if (!$res) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }


            $this->writeJson(200, [], '添加成功');
            return false;

        } catch (\Throwable $e) {
            var_dump($e->getMessage());
            $this->writeJson(-1, [], $e->getMessage());
            $log->log('get_task 异常:' . $e->getMessage());
            return false;
        }


    }


    function get_task_orders()
    {
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();
                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['action'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = TaskOrdersModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');


                #获取變現 訂單
                if ($data['action'] == "realizationAdmin") {
                    if (isset($data['realization_status'])) {
                        $model = $model->where(['realization_status' => $data['realization_status']]);
                    }
                }

                #獲取購物的 訂單
                if ($data['action'] == "shopAdmin") {
                    if (isset($data['shop_status'])) {
                        $model = $model->where(['shop_status' => $data['shop_status']]);
                    }
                }
                #接待的狀態
                if ($data['action'] == "receptionAdmin") {
                    if (isset($data['reception_status'])) {
                        $model = $model->where(['reception_status' => $data['reception_status']]);
                    }
                }

                $list = $model->all();
                foreach ($list as $k => $value) {
                    if ($value['project_id']) {
                        $there = ProjectModel::create()->get(['id' => $value['project_id']]);
                        $list[$k]['project_id'] = $there['name'];
                    }
                    if ($value['channel_id']) {
                        $one = ChannelModel::create()->get(['id' => $value['channel_id']]);
                        $list[$k]['channel_id'] = $one['name'];
                    }
                    if ($value['devices_id']) {
                        $two = DevicesModel::create()->get(['id' => $value['devices_id']]);
                        $list[$k]['devices_id'] = $two['remark'];
                    }

                    if ($value['devices_type_id']) {
                        $fiv = DevicesTypeModel::create()->get(['id' => $value['devices_type_id']]);
                        $list[$k]['devices_type_id'] = $fiv['name'];
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
                $this->response()->write(json_encode($return_data));
                return true;
            }

            #POST

            $data = $this->request()->getParsedBody();


            #刪除
            if (isset($data['action']) && $data['action'] == "delete" && $data['id']) {
                $Res = TaskOrdersModel::create()->destroy(['id' => $data['id']]);
                return $this->isOk($Res, '添加');

            }


            # 修改

            if (isset($data['action']) && $data['action'] == "update" && $data['id']) {
                #提現管理員
                if ($data['action1'] == "realizationAdmin") {
                    if (isset($data['realization_money'])) {

                        $update = [
                            'realization_status' => $data['realization_status'],
                            'realization_nums' => $data['realization_nums'],
                            'realization_money' => $data['realization_money'],
                            'updated_at' => time()
                        ];
                    } else {
                        $update = [
                            'realization_status' => $data['realization_status'],
                            'realization_nums' => $data['realization_nums'],
                            'updated_at' => time()
                        ];
                    }

                    $Res = TaskOrdersModel::create()->where(['id' => $data['id']])->update($update);
                    return $this->isOk($Res, '修改');
                }

                # 購物管理員
                if ($data['action1'] == "shopAdmin") {
                    $update = [
                        'shop_status' => $data['shop_status'],
                        'devices_type_id' => $data['devices_type_id'],
                        'devices_id' => $data['devices_id'],  #channel_id
                        'channel_id' => $data['channel_id'],
                        'channel_money' => $data['channel_money'],
                        'updated_at' => time()
                    ];

                    $Res = TaskOrdersModel::create()->where(['id' => $data['id']])->update($update);
                    return $this->isOk($Res, '修改');
                }


                #接待管理員
                if ($data['action1'] == "receptionAdmin") {
                    $update = [
                        'reception_status' => $data['reception_status'],
                        'reception_nums' => $data['reception_nums'],
                        'updated_at' => time()
                    ];
                    $Res = TaskOrdersModel::create()->where(['id' => $data['id']])->update($update);
                    return $this->isOk($Res, '修改');
                }


            }


            # 添加 任務
            if (isset($data['action']) && $data['action'] == "add" && isset($data['project_id']) && isset($data['date']) && isset($data['remark'])) {
                $add = [
                    'project_id' => $data['project_id'],
                    'remark' => $data['remark'],
                    'updated_at' => time(),
                    'created_at' => time(),
                    'date' => $data['date']
                ];
                $Res = TaskOrdersModel::create()->data($add)->save();
                return $this->isOk($Res, '添加');
            }


        } catch (\Throwable $e) {
            $this->writeJson(-1, [], '異常:' . $e->getMessage());
        }


    }


}