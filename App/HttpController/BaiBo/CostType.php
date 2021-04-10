<?php
/**
 * @Author WangYi
 * @Date 2021/4/10 16:13
 * @Version 1.0
 */


namespace App\HttpController\BaiBo;


use App\HttpController\IndexBase;
use App\Log\LogHandel;
use App\Model\ConsumptionModel;
use App\Model\CostTypeModel;

/**
 * Class CostType
 * @package App\HttpController\BaiBo
 * 消费类型
 */
class CostType extends IndexBase
{


    #  获取 消费类型
    function get_costType()
    {
        $log = new LogHandel();
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['status'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = CostTypeModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');

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
                $res = CostTypeModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }


            if (!isset($data['name'])) {
                $this->writeJson(-101, [], '添加/修改失败');
                return false;
            }


            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                #修改
                $update = [
                    'name' => $data['name'],
                    'updated_at' => time(),
                ];

                #首先获取数据
                $one = CostTypeModel::create()->get(['name' => $data['name']]);
                if ($one) {
                    $this->writeJson(-101, [], "修改失败");
                    return false;
                }

                $res = CostTypeModel::create()->where(['id' => $data['id']])->update($update);
                if (!$res) {
                    $this->writeJson(-101, [], "修改失败");
                    return false;
                }

                $this->writeJson(200, [], "修改成功");
                return false;
            }


            #添加的  管理员是否重复
            $server = CostTypeModel::create()->get(['name' => $data['name']]);
            if ($server) {
                $this->writeJson(-101, [], '添加失败,您添加的账号已经存在');
                return false;
            }


            $IN_DATA = [
                'name' => $data['name'],
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = CostTypeModel::create()->data($IN_DATA)->save();
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


    # 获取  修改 创建开销
    function get_consumption()
    {
        $log = new LogHandel();
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page']) ||!isset($data['date']) || !isset($data['action'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = ConsumptionModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                if ($data['action']=="today") {
                    $list = $model->all(['date' => $data['date']]);
                } else {
                    $list = $model->all(['date',$data['date'],"!="]);
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




            #POST 请求 添加 管理员
            $data = $this->request()->getParsedBody();
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除
                $res = ConsumptionModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }




            if (!isset($data['money']) || !isset($data['date'])  || !isset($data['cost_type_id'])) {
                $this->writeJson(-101, [], '添加/修改失败');
                return false;
            }


            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                #修改
                $update = [
                    'money' => $data['money'],
                    'date' => $data['date'],
                    'cost_type_id' => $data['cost_type_id'],
                    'updated_at' => time(),
                ];

                #首先获取数据

                $res = ConsumptionModel::create()->where(['id' => $data['id']])->update($update);
                if (!$res) {
                    $this->writeJson(-101, [], "修改失败");
                    return false;
                }

                $this->writeJson(200, [], "修改成功");
                return false;
            }



            $IN_DATA = [
                'money' => $data['money'],
                'date' => $data['date'],
                'cost_type_id' => $data['cost_type_id'],
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = ConsumptionModel::create()->data($IN_DATA)->save();
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


}