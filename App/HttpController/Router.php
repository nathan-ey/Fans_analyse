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
        #project_analysis 项目的数据分析
        $routeCollector->get('/superAdmin/project_analysis', '/Super_admin/Analysis/project_analysis');


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
        #submit_kele  提交给可乐
        $routeCollector->get('/realizationAdmin/submit_kele', '/Reception_admin/Task/submit_kele');
        $routeCollector->post('/realizationAdmin/submit_kele', '/Reception_admin/Task/submit_kele');


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
         * Project.php
         * Analysis.php
         * 变现管理员
         */
        #get_project  创建 获取 项目
        $routeCollector->get('/receptionAdmin/get_project', '/Realization_admin/Project/get_project');
        $routeCollector->post('/receptionAdmin/get_project', '/Realization_admin/Project/get_project');
        #get_task
        $routeCollector->get('/receptionAdmin/get_task', '/Realization_admin/Project/get_task');
        $routeCollector->post('/receptionAdmin/get_task', '/Realization_admin/Project/get_task');
        #get_task_orders
        $routeCollector->get('/receptionAdmin/get_task_orders', '/Realization_admin/Project/get_task_orders');
        $routeCollector->post('/receptionAdmin/get_task_orders', '/Realization_admin/Project/get_task_orders');


        /**
         * @baiBoAdmin
         * User.php
         * CostType.php
         */

        #add_people  添加修改组成员
        $routeCollector->get('/baiBoAdmin/add_people', '/BaiBo/User/add_people');
        $routeCollector->post('/baiBoAdmin/add_people', '/BaiBo/User/add_people');
        #get_costType 获取 修改消费类型
        $routeCollector->get('/baiBoAdmin/get_costType', '/BaiBo/CostType/get_costType');
        $routeCollector->post('/baiBoAdmin/get_costType', '/BaiBo/CostType/get_costType');





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