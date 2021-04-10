<?php
/**
 * @Author WangYi
 * @Date 2021/4/8 15:30
 * @Version 1.0
 */


namespace App\HttpController\Super_admin;


use App\HttpController\IndexBase;
use App\Model\ChannelModel;
use App\Model\DevicesModel;
use App\Model\DevicesTypeModel;
use App\Model\ProjectModel;
use App\Model\RealizationTaskModel;
use App\Model\ReceptionListModel;
use App\Model\ReceptionOrdersModel;
use App\Model\ShopOrdersModel;
use App\Model\TaskOrdersModel;
use EasySwoole\ORM\Exception\Exception;

class Analysis extends IndexBase
{


    # 可樂獲取 分析
    function project_analysis()
    {
        try {


            $data = $this->request()->getQueryParams();
            if (!isset($data['limit']) || !isset($data['page']) || !isset($data['action'])) {
                $this->writeJson(-101, [], '参数异常');
                return false;
            }

            $model = TaskOrdersModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');
            $list = $model->all(['realization_status' => 2, 'reception_status' => 2, 'shop_status' => 2]);
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


                # 計算成本
                $list[$k]['cost'] = $value['channel_money'] / $value['realization_nums'];
                # 轉化率
                $list[$k]['conversion'] =    $value['realization_nums'] / $value['reception_nums'];


                #粉的單價
                $list[$k]['price'] = $value['channel_money'] / $value['reception_nums'];


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


        } catch (\Throwable $e) {
            $this->writeJson(-1, [], '异常:' . $e->getMessage());
        }


    }


}