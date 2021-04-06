<?php


namespace App\HttpController;


use EasySwoole\Http\AbstractInterface\AbstractRouter;
use EasySwoole\Http\Request;
use EasySwoole\Http\Response;
use FastRoute\RouteCollector;

class Router extends AbstractRouter
{
    function initialize(RouteCollector $routeCollector)
    {


        /**
         * @Super_admin 超级管理员  all
         * User.php
         */

        # 获取  管理员种类 修改管理员种类 get_type_admins
        $routeCollector->get('/superAdmin/get_type_admins', '/Super_admin/User/get_type_admins');
        # add_admins    #添加管理员  获取成员
        $routeCollector->get('/superAdmin/add_admins', '/Super_admin/User/add_admins');
        $routeCollector->post('/superAdmin/add_admins', '/Super_admin/User/add_admins');


        /**
         * @Shop_admin 购物管理员
         * Channel.php
         * ShopOrders.php
         */
        #get_channel  获取 修改 增添 渠道
        $routeCollector->get('/shopAdmin/get_channel', '/Shop_admin/Channel/get_channel');
        $routeCollector->post('/shopAdmin/get_channel', '/Shop_admin/Channel/get_channel');
        #get_shop_orders
        $routeCollector->get('/shopAdmin/get_shop_orders', '/Shop_admin/ShopOrders/get_shop_orders');
        $routeCollector->post('/shopAdmin/get_shop_orders', '/Shop_admin/ShopOrders/get_shop_orders');


        /**
         * @Reception_admin
         *  接待管理员
         * Devices.php
         * Task.php
         * User.php
         */
        #get_devices  获取 修改 添加设备类型
        $routeCollector->get('/realizationAdmin/get_devices', '/Reception_admin/Devices/get_devices');
        $routeCollector->post('/realizationAdmin/get_devices', '/Reception_admin/Devices/get_devices');
        #get_devices_detail 获取设备详情
        $routeCollector->get('/realizationAdmin/get_devices_detail', '/Reception_admin/Devices/get_devices_detail');
        $routeCollector->post('/realizationAdmin/get_devices_detail', '/Reception_admin/Devices/get_devices_detail');
        # get_task
        $routeCollector->get('/realizationAdmin/get_task', '/Reception_admin/Task/get_task');
        $routeCollector->post('/realizationAdmin/get_task', '/Reception_admin/Task/get_task');
        # add_people
        $routeCollector->get('/realizationAdmin/add_people', '/Reception_admin/User/add_people');
        $routeCollector->post('/realizationAdmin/add_people', '/Reception_admin/User/add_people');



        /**
         * @Reception_user
         * 接待成員
         * Get_tasks.php
         */
        #submit_task 提交任務
        $routeCollector->get('/realizationUser/submit_task', '/Reception_user/Get_tasks/submit_task');
        $routeCollector->post('/realizationUser/submit_task', '/Reception_user/Get_tasks/submit_task');


        /**
         * @Realization_admin
         * 变现管理员
         */


        #登录
        $routeCollector->get('/login', '/Login/login');
        /*

          * eg path : /router/index.html  ; /router/ ;  /router
         */
        $routeCollector->get('/router', '/test');
        /*
         * eg path : /closure/index.html  ; /closure/ ;  /closure
         */
        $routeCollector->get('/closure', function (Request $request, Response $response) {
            $response->write('this is closure router');
            //不再进入控制器解析
            return false;
        });
    }
}