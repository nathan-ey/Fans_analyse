<?php
/**
 * @Author WangYi
 * @Date 2021/4/5 19:27
 * @Version 1.0
 */


namespace App\HttpController\Shop_admin;


use App\HttpController\IndexBase;
use App\Model\ChannelModel;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use App\Model\ShopOrdersModel;

class ShopOrders extends IndexBase
{


    #获取  修改 购买  记录
    function get_shop_orders()
    {

        try {

            $Method_type = $this->request()->getServerParams()['request_method'];
            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }

                $model = ShopOrdersModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');


                #设备类型
                if (isset($data['type'])) {
                    $model = $model->where(['type' => $data['type']]);
                }

                #设备名字
                if (isset($data['device_id'])) {
                    $model = $model->where(['device_id' => $data['device_id']]);
                }


                #渠道类型
                if (isset($data['channel_id'])) {
                    $model = $model->where(['channel_id' => $data['channel_id']]);
                }


                #备注
                if (isset($data['remark'])) {
                    $model = $model->where(['remark' => $data['remark']]);
                }


                $list = $model->all();

                foreach ($list as $k => $value) {
                    $res = ChannelModel::create()->get(['id' => $value['channel_id']]);
                    $one = DevicesTypeModel::create()->get(['id' => $value['type']]);
                    $two = DevicesModel::create()->get(['id' => $value['device_id']]);
                    if ($res && $one && $two) {
                        $list[$k]['channel_id'] = $res['name'];
                        $list[$k]['type'] = $one['name'];
                        $list[$k]['device_id'] = $two['remark'];
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


            #post 修改 添加 删除


            $data = $this->request()->getParsedBody();
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除
                $res = ShopOrdersModel::create()->destroy(['id' => $data['id']]);
                return $this->isOk($res, '删除');
            }


            if (!isset($data['channel_id']) || !isset($data['money']) || !isset($data['remark']) || !isset($data['type']) || !isset($data['device_id'])) {
                $this->writeJson(-101, [], '添加/修改失败');
                return false;
            }

            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                #修改
                $up = [
                    'channel_id' => $data['channel_id'],
                    'money' => $data['money'],
                    'remark' => $data['remark'],
                    'num' => $data['num'],
                    'type' => $data['type'],
                    'device_id' => $data['device_id'],
                    'updated_at' => time()
                ];
                $res = ShopOrdersModel::create()->where(['id' => $data['id']])->update($up);
                return $this->isOk($res, '修改');
            }


            #插入
            $add = [
                'channel_id' => $data['channel_id'],
                'money' => $data['money'],
                'remark' => $data['remark'],
                'type' => $data['type'],
                'device_id' => $data['device_id'],
                'updated_at' => time(),
                'created_at' => time(),
                'num' => $data['num']
            ];
            $res = ShopOrdersModel::create()->data($add)->save();
            return $this->isOk($res, '插入');
        } catch (\Throwable $exception) {
            $this->writeJson(-1, [], $exception->getMessage());
            return false;
        }

    }





}