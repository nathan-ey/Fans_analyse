<?php


namespace EasySwoole\EasySwoole;


use EasySwoole\EasySwoole\AbstractInterface\Event;
use EasySwoole\EasySwoole\Swoole\EventRegister;
use EasySwoole\ORM\Db\Config;
use EasySwoole\ORM\Db\Connection;
use EasySwoole\ORM\DbManager;
use EasySwoole\RedisPool\Exception\Exception;
use EasySwoole\RedisPool\RedisPoolException;

class EasySwooleEvent implements Event
{
    public static function initialize()
    {
        date_default_timezone_set('Asia/Shanghai');
        \EasySwoole\Component\Di::getInstance()->set(\EasySwoole\EasySwoole\SysConst::HTTP_GLOBAL_ON_REQUEST,function (\EasySwoole\Http\Request $request, \EasySwoole\Http\Response $response){
            $response->withHeader('Access-Control-Allow-Origin', '*');
            $response->withHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
            $response->withHeader('Access-Control-Allow-Credentials', 'true');
            $response->withHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');
            if ($request->getMethod() === 'OPTIONS') {
                $response->withStatus(\EasySwoole\Http\Message\Status::CODE_OK);
                return false;
            }
            return true;
        });
    }

    public static function mainServerCreate(EventRegister $register)
    {

        #注册 mysql
        #注册mysql连接池
        $mysql_config = new Config(\EasySwoole\EasySwoole\Config::getInstance()->getConf('MYSQL'));
        DbManager::getInstance()->addConnection(new Connection($mysql_config));


        #注册redis连接池
        $redis_config = new \EasySwoole\Redis\Config\RedisConfig(\EasySwoole\EasySwoole\Config::getInstance()->getConf('REDIS'));
        try {
            \EasySwoole\RedisPool\RedisPool::getInstance()->register($redis_config, 'redis');
        } catch (Exception $e) {
            var_dump("?/");
        } catch (RedisPoolException $e) {
            var_dump("?/");

        }

    }
}