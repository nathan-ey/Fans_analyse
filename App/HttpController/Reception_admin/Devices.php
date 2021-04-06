<?php
/**
 * @Author WangYi
 * @Date 2021/4/5 18:43
 * @Version 1.0
 */


namespace App\HttpController\Reception_admin;


use App\HttpController\IndexBase;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use EasySwoole\ORM\Exception\Exception;

class Devices extends IndexBase
{


    #添加  获取设备 类型
    function get_devices()
    {
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();
                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['status'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }
                $model = DevicesTypeModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
                $list = $model->all(['status' => $data['status']]);
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


            #POST 修改 删除 添加
            $data = $this->request()->getParsedBody();
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                $res = DevicesTypeModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], '删除失败!');
                    return false;
                }
                $this->writeJson(200, [], '删除成功');
                return false;
            }


            if (!isset($data['name'])) {
                $this->writeJson(-101, [], '添加/修改失败,非法参数');
                return false;
            }


            #修改
            if (isset($data['action']) && $data['action'] == "update" && isset($data['id']) && isset($data['status'])) {
                $res = DevicesTypeModel::create()->where(['id' => $data['id']])->update(['name' => $data['name'], 'status' => $data['status'], 'updated_at' => time()]);

                if (!$res) {
                    $this->writeJson(-101, [], '删除失败!');
                    return false;
                }
                $this->writeJson(200, [], '删除成功');
                return false;
            }


            # 添加

            #判断 设备类型 是否重复
            $two = DevicesTypeModel::create()->get(['name' => $data['name']]);
            if ($two) {
                $this->writeJson(-101, [], '设备类型不要重复添加');
                return false;
            }


            $in = [
                'name' => $data['name'],
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = DevicesTypeModel::create()->data($in)->save();
            if (!$res) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }

            $this->writeJson(200, [], '添加成功');
            return false;

        } catch (\Throwable $e) {

            $this->writeJson(-1, [], '异常:' . $e->getMessage());
            return false;

        }
    }


    #添加设备 获取修改设备详情
    function get_devices_detail()
    {
        try {
            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['status']) || !isset($data['type'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }
                $model = DevicesModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');


                if (isset($data['action']) && $data['action'] == "all") {
                    $list = $model->all(['status' => $data['status']]);
                } else {
                    $list = $model->all(['status' => $data['status'], 'type' => $data['type']]);
                }

                foreach ($list as $k => $va) {
                    $res = DevicesTypeModel::create()->get(['id' => $va['type']]);
                    if ($res) {
                        $list[$k]['type']=$res['name'];
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

            #POST 修改 删除 添加
            $data = $this->request()->getParsedBody();
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                $res = DevicesModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], '删除失败!');
                    return false;
                }
                $this->writeJson(200, [], '删除成功');
                return false;
            }

            if (!isset($data['remark']) || !isset($data['status']) || !isset($data['type'])) {
                $this->writeJson(-101, [], '添加/修改失败,非法参数');
                return false;
            }

            #修改
            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                $res = DevicesModel::create()->where(['id' => $data['id']])->update(['remark' => $data['id'], 'status' => $data['status'], 'type' => $data['type'], 'updated_at' => time()]);
                if (!$res) {
                    $this->writeJson(-101, [], '删除失败!');
                    return false;
                }
                $this->writeJson(200, [], '删除成功');
                return false;
            }

            # 添加


            #判断 设备 是否重复
            $two = DevicesModel::create()->get(['remark' => $data['remark'], 'type' => $data['type']]);
            if ($two) {
                $this->writeJson(-101, [], '设备不要重复添加');
                return false;
            }
            $in = [
                'remark' => $data['remark'],
                'type' => $data['type'],
                'updated_at' => time(),
                'created_at' => time()
            ];

            $res = DevicesModel::create()->data($in)->save();
            if (!$res) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }
            $this->writeJson(200, [], '添加成功');
            return false;
        } catch (\Throwable $e) {

            $this->writeJson(-1, [], '异常:' . $e->getMessage());
            return false;

        }
    }


}