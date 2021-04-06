<?php
/**
 * @Author WangYi
 * @Date 2021/4/5 17:31
 * @Version 1.0
 */


namespace App\HttpController\Shop_admin;

use App\HttpController\IndexBase;
use App\Model\ChannelModel;

class Channel extends IndexBase
{

    #获取 添加渠道
    function get_channel()
    {
        try {

            $Method_type = $this->request()->getServerParams()['request_method'];

            if ($Method_type == "GET") {
                $data = $this->request()->getQueryParams();

                if (!isset($data['limit']) || !isset($data['page']) || !isset($data['status'])) {
                    $this->writeJson(-101, [], '参数异常');
                    return false;
                }
                $model = ChannelModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');

                $list = $model->all(['status' => $data['status']]);
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


            #POST 添加或者修改参数
            $data = $this->request()->getParsedBody();
            if (isset($data['action']) && $data['action'] == "delete" && isset($data['id'])) {
                #删除

                $one = ChannelModel::create()->destroy(['id' => $data['id']]);

                if (!$one) {
                    $this->writeJson(-101, [], '删除失败');
                    return false;
                }

                $this->writeJson(200, [], '删除成功');
                $this->mysql_log("购物管理严删除了渠道", $this->who['user'], 'notice');
                return false;
            }

            if (!isset($data['name']) ) {
                $this->writeJson(-101, [], '参数异常');
                return false;
            }



            #判断 渠道是否重复
            $two = ChannelModel::create()->get(['name' => $data['name']]);
            if ($two) {
                $this->writeJson(-101, [], '渠道不要重复添加');
                return false;
            }

            $In_data = [
                'name' => $data['name'],
                'status' => 1,
                'updated_at' => time(),
                'created_at' => time()
            ];


            $one = ChannelModel::create()->data($In_data)->save();
            if (!$one) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }

            $this->writeJson(200, [], '添加成功');
            $this->mysql_log("购物管理严添加了渠道", $this->who['user'], 'notice');
            return false;
        } catch (\Throwable $e) {
            $this->writeJson(-1, [], '异常:' . $e->getMessage());
            $this->mysql_log($e->getMessage(), $this->who['user'], 'Throwable');
            return false;
        }
    }

}