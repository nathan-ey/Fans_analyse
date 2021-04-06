<?php
/**
 * @Author WangYi
 * @Date 2021/4/1 16:47
 * @Version 1.0
 */


namespace App\HttpController;


use App\Log\LogHandel;
use App\Model\UserModel;
use EasySwoole\Http\AbstractInterface\Controller;
use EasySwoole\Mysqli\Exception\Exception;
use EasySwoole\RedisPool\RedisPool;

class Login extends IndexBase
{


    function login()
    {

        $log = new  LogHandel();
        try {
            $data = $this->request()->getQueryParams();
            if (!isset($data['user']) || !isset($data['password']) || !isset($data['action'])) {
                $this->writeJson(-101, [], '缺少参数');
                return false;
            }

            $redis = RedisPool::defer('redis');


            #校验权限
            if (!$redis->hExists($data['action'], $data['user'])) {
                $this->writeJson(-101, [], '登录失败');
                return false;
            }

            if ($redis->hGet($data['action'], $data['user']) != $data['password']) {
                $this->writeJson(-101, [], '登录失败');
                return false;
            }


            if (!$redis->hExists("USER_" . $data['user'], 'token')) {
                $res = UserModel::create()->get(['user' => $data['user']]);
                if ($res) {
                    $redis->hMSet("USER_" . $data['user'], $res->toArray());
                    $redis->hSet("Token_", $res['token'], $res['user']);
                }

            }

            $this->writeJson(200, $redis->hGetAll("USER_" . $data['user']), '登录成功');
            $redis->set($redis->hGet('USER_' . $data['user'], 'token'), $data['user'], 1800);
            $log->log('登录成功');
            $this->mysql_log('登录成功', $redis->hGet("USER_" . $data['user'], 'remark'));
            return true;
        } catch (\Throwable $e) {
            $this->writeJson(-1, [], '登录失败');
            $log->log('login  异常:' . $e->getMessage());
            return false;

        }
    }


}