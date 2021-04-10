<?php
/**
 * @Author WangYi
 * @Date 2021/4/10 16:04
 * @Version 1.0
 */


namespace App\HttpController\BaiBo;

use App\HttpController\IndexBase;
use App\Log\LogHandel;
use App\Model\AdminTypeModel;
use App\Model\UserModel;
use EasySwoole\RedisPool\RedisPool;


class User extends IndexBase
{



    # 添加成員 顯示成員
    function add_people()
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

                $model = UserModel::create()->limit($data['limit'] * ($data['page'] - 1), $data['limit'])->withTotalCount()->order('created_at', 'DESC');

                #获取普通用户 接待成員
                $list = $model->field("user.id,user.user,user.password,admin_type.name,user.created_at,user.updated_at,user.status,user.remark")
                    ->join("admin_type", 'admin_type.id=user.grade')->where('(admin_type.level>0)')
                    ->all(['status' => $data['status'], 'grade' => 7]);
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
                $res = UserModel::create()->destroy(['id' => $data['id']]);
                if (!$res) {
                    $this->writeJson(-101, [], "删除失败");
                    return false;
                }
                $this->writeJson(200, [], "删除成功");
                return false;
            }


            if (!isset($data['remark']) || !isset($data['user']) || !isset($data['password']) || !isset($data['grade'])) {
                $this->writeJson(-101, [], '添加/修改失败');
                return false;
            }


            if (isset($data['action']) && $data['action'] == "update" && isset($data['id'])) {
                #修改
                $update = [
                    'user' => $data['user'],
                    'password' => $data['password'],
                    'grade' => $data['grade'],
                    'remark' => $data['remark'],
                    'updated_at' => time(),
                ];

                #首先获取数据
                $one = UserModel::create()->get(['id' => $data['id']]);
                if (!$one) {
                    $this->writeJson(-101, [], "修改失败");
                    return false;
                }

                $res = UserModel::create()->where(['id' => $data['id']])->update($update);
                if (!$res) {
                    $this->writeJson(-101, [], "修改失败");
                    return false;
                }

                $redis = RedisPool::defer('redis');


                $redis->hSet("User_" . $data['user'], "password", $data['password']);
                $redis->hSet("Token_", $one['token'], $data['user']);


                $eight = AdminTypeModel::create()->get(['id' => $data['grade']]);
                if (!$eight) {
                    // $this->writeJson(-101, [], '添加失败,您添加的账号已经存在');
                    return false;
                }
                $redis->hSet($eight['path_remark'], $data['user'], $data['password']);
                $this->writeJson(200, [], "修改成功");
                return false;
            }


            #添加的  管理员是否重复
            $server = UserModel::create()->get(['user' => $data['user']]);
            if ($server) {
                $this->writeJson(-101, [], '添加失败,您添加的账号已经存在');
                return false;
            }

            #判断 添加的管理 类型是否存在
            $eight = AdminTypeModel::create()->get(['id' => $data['grade']]);
            if (!$eight) {
                $this->writeJson(-101, [], '添加失败,您添加的账号已经存在');
                return false;
            }


            $token = $this->Set_Token(36);
            $IN_DATA = [
                'user' => $data['user'],
                'password' => $data['password'],
                'grade' => $data['grade'],
                'remark' => $data['remark'],
                'token' => $token,
                'updated_at' => time(),
                'created_at' => time()
            ];


            $res = UserModel::create()->data($IN_DATA)->save();
            if (!$res) {
                $this->writeJson(-101, [], '添加失败');
                return false;
            }

            $redis = RedisPool::defer('redis');
            $redis->hMGet("User_" . $data['user'], $IN_DATA);
            $redis->hSet("Token_", $token, $data['user']);
            $redis->hSet($eight['path_remark'], $data['user'], $data['password']);
            $this->mysql_log("超级管理员 添加管理员:" . $data['user'], $this->who['user'], 'notice');
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