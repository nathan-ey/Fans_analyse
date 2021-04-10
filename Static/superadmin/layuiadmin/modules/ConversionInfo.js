
layui.define(['table', 'form'], function(exports){
    var $ = layui.$
        ,table = layui.table
        ,form = layui.form;


    var mybck= $.cookie('tokenMyb')
    //用户管理
    table.render({
        elem: '#LAY-fs-manage',
        url: "http://8.134.62.33/superAdmin/project_analysis?token="+mybck+"&action=superAdmin",
        cellMinWidth : 95,
        page :  { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            ,groups: 10 //只显示 1 个连续页码
            ,first: "首页" //不显示首页
            ,last: "尾页"//不显示尾页

        },
        height : "full-20",
        limit : 15,
        limits : [15,30,50,100],
        id : "systemLog",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            // {field: 'id', title: '编号', width:60, align:"center"},
            // {field: 'xid', title: '编号', width:60, align:"center",templet: '#titleTpl'},
            {field: 'id', title: 'ID', minWidth:'60', width:'60', type:'space',align:"center"}, //, style :'display: none'

            {field: 'project_id', title: '项目名称', width:180, align:'center'},
            {field: 'channel_id', title: '渠道名称', width:180, align:'center'},
            {field: 'channel_money', title: '购粉金额', width:180, align:'center'},
            {field: 'reception_nums', title: '接待个数', width:180, align:'center'},
            {field: 'realization_nums', title: '变现个数', width:180, align:'center'},
            {field: 'cost', title: '接待成本(元)', width:180, align:'center'},
            // {field: 'ces', title: '接待率', width:180, align:'center'},
            // {field: 'realization_money', title: '变现金额', width:180, align:'center'},
            {field: 'conversion', title: '接待转换率(变现数/接待数)', width:230, align:'center',templet: function (d) {

                    return toPercent(d.conversion);
            }},
            {field: 'date', title: '日期', width:180, align:'center'},
            {field: 'remark', title: '备注', width:180, align:'center'},

            // //用layer自带的转换方法没有效果,暂时用网上JS封装的工具类
            // {field: 'created_at', title: '创建时间', width: 190, align:'center',templet: function (d) {
            //
            //
            //         return layui.util.toDateString(d.created_at*1000, 'yyyy-MM-dd HH:mm:ss')
            //     }},
            // {field: 'updated_at', title: '更新时间',width:190, align:'center',templet: function (d) {
            //
            //
            //         return layui.util.toDateString(d.updated_at*1000, 'yyyy-MM-dd HH:mm:ss')
            //     }}
            {title: '', width:10, templet:'#orderListBar',fixed:"right",align:"center"}
        ]],
        done: function(res, curr, count){

            // $('.layui-table-cell').css({'height':'auto'});  ////暂时不用显示完整,有个小问题,把高度设置后全选按钮显示不对齐.
            // layer.close(orderLoadingIndex);    //返回数据关闭loading

        }
    });


    //小数转百分数
    function toPercent(point){
        var str=Number(point*100).toFixed(1);
        str+="%";
        return str;
    }


    //百分数转小数
    function toPoint(percent){
        var str=percent.replace("%","");
        str= str/100;
        return str;
    }
    //时间戳转日期时间型工具类
    function formatDateTime(inputTime) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
    }



    //监听工具条
    //列表操作
    table.on('tool(LAY-fs-manage)', function(obj){
        var layEvent = obj.event; //获得 lay-event 对应的值
        var newdata = obj.data; //获得当前行数据
        var newtr = obj.tr; //获得当前行tr的DOM对象

        if(layEvent === 'look'){

        }else if(layEvent === 'edit'){ //编辑

            var index = layer.open({
                area: ['430px', '630px'],
                fixed: false, //不固定
                maxmin: true,
                title : "编辑账号内容",
                skin: 'layui-layer-rim',//加上边框
                type : 2,
                content : "editPurchase.html",
                success : function(layero, index){
                    var body = layui.layer.getChildFrame('body', index);

                    if(newdata) {


                        jsonDataStr = JSON.stringify(newdata);

                        body.find("#money").val(newdata.money);
                        body.find("#num").val(newdata.num);
                        body.find("#remark").val(newdata.remark);
                        $("select[name='channelID']").val(newdata.channel_id);
                        $("select[name='type']").val(newdata.type);
                        $("select[name='deviceID']").val(newdata.device_id);


                        // $("#pay_state").val(newdata.pay_state);


                        // 当前的select的id
                        // $('#pay_ckstate').val('0');
                        //
                        // //更新全部
                        // layui.form.render();

                        // console.log(newdata.pay_ckstate);
                        // $('#pay_state').find("option[value="+newdata.pay_state+"]").attr("selected",true);
                        // form.render('select');
                        // $('#pay_ckstate').find("option[value="+newdata.pay_ckstate+"]").attr("selected",true);
                        // form.render('select');

                        // body.find(".enable_state").prop("checked", edit.enable_state);//通道状态
                        // layui.form.render('select');
                        // form.render();

                        setTimeout(function(){
                            layui.layer.tips('点击此处返回通道查询查询页面', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500)
                    }

                }
            })
            // layui.layer.full(index);
            window.sessionStorage.setItem("index",index);
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            $(window).on("resize",function(){
                layui.layer.full(window.sessionStorage.getItem("index"));
            })


        }else if(layEvent === 'del'){ //删除

            // layer.msg(newdata.id);



            layer.confirm('系统将删除当前数据，确认要删除？', {
                icon:2,
                title:'温馨提示',
                skin: 'layui-layer-lan',
                btn: ['确认','取消'] //按钮
                ,cancel: function(index, layero){
                    //取消操作，点击右上角的X
                }
            }, function(){//是


                var param={};
                param['token']=$.cookie('tokenMyb');
                param['id']=newdata.id;
                param['action'] = 'delete';

                $.ajax({
                    url:"http://8.134.62.33/shopAdmin/get_shop_orders",
                    type: "POST",
                    data: param,
                    success: function (resultData) {

                        console.log(resultData);

                        if(resultData.code == 200){


                            $.message({
                                message:resultData.msg ,
                                type: 'success',
                                showClose: true
                            });

                            setTimeout(function (){

                                // layer.close("iframe");
                                window.location.reload()

                            },100)


                        }else{

                            $.message({
                                message:resultData.msg ,
                                type: 'error',
                                showClose: true
                            });


                        }



                    },


                });


            }, function(){//否

                // layer.alert('编辑行：<br>'+ JSON.stringify(newdata))
            });



            // layer.confirm('系统将删除当前数据，确认要删除？', {
            //     icon:2,
            //     title:'温馨提示',
            //     skin: 'layui-layer-lan',
            //     btn: ['确认','取消'] //按钮
            //     ,cancel: function(index, layero){
            //         //取消操作，点击右上角的X
            //     }
            // }, function(){//是
            //
            //     //GET方式
            //     var getStr ="merchantOrderQuery.php?query_type=deleteQuery&querymerzh="+newdata.merchant_zh+"&querymerzhh="+newdata.merchant_zhh+"&querymerwpname="+newdata.merchant_name;
            //
            //     $.get(getStr,function(result){
            //
            //         layer.alert("["+newdata.merchant_zh+"--"+newdata.merchant_zhh+"--"+newdata.merchant_name+"]   "+"此数据删除成功",{icon: 1,title:'温馨提示',skin:'layui-layer-molv'}, function(index){
            //             //do something
            //             tableIns.reload();
            //             layer.close(index);
            //         });
            //
            //         // layer.msg("["+newdata.merchant_zh+"--"+newdata.merchant_zhh+"--"+newdata.merchant_name+"]   "+"此数据删除成功");
            //         // tableIns.reload();
            //     });
            //
            //
            // }, function(){//否
            //
            //     // layer.alert('编辑行：<br>'+ JSON.stringify(newdata))
            // });
        }
    });


    //监听搜索
    form.on('submit(LAY-user-front-search)', function(data){
        var field = data.field;

        //执行重载
        table.reload('LAY-fs-manage', {
            where: field
        });
    });

    //监听搜索
    form.on('submit(LAY-user-front-reload)', function(data){

        location.reload();
    });


    // //监听工具条
    // table.on('tool(LAY-user-manage)', function(obj){
    //     var data = obj.data;
    //     if(obj.event === 'del'){
    //         layer.prompt({
    //             formType: 1
    //             ,title: '敏感操作，请验证口令'
    //         }, function(value, index){
    //             layer.close(index);
    //
    //             layer.confirm('真的删除行么', function(index){
    //                 obj.del();
    //                 layer.close(index);
    //             });
    //         });
    //     } else if(obj.event === 'edit'){
    //         var tr = $(obj.tr);
    //
    //         layer.open({
    //             type: 2
    //             ,title: '编辑用户'
    //             ,content: '../../../views/user/user/userform.html'
    //             ,maxmin: true
    //             ,area: ['500px', '450px']
    //             ,btn: ['确定', '取消']
    //             ,yes: function(index, layero){
    //                 var iframeWindow = window['layui-layer-iframe'+ index]
    //                     ,submitID = 'LAY-user-front-submit'
    //                     ,submit = layero.find('iframe').contents().find('#'+ submitID);
    //
    //                 //监听提交
    //                 iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
    //                     var field = data.field; //获取提交的字段
    //
    //                     //提交 Ajax 成功后，静态更新表格中的数据
    //                     //$.ajax({});
    //                     table.reload('LAY-user-front-submit'); //数据刷新
    //                     layer.close(index); //关闭弹层
    //                 });
    //
    //                 submit.trigger('click');
    //             }
    //             ,success: function(layero, index){
    //
    //             }
    //         });
    //     }
    // });
    //
    // //管理员管理
    // table.render({
    //     elem: '#LAY-user-back-manage'
    //     ,url: layui.setter.base + 'json/useradmin/mangadmin.js' //模拟接口
    //     ,cols: [[
    //         {type: 'checkbox', fixed: 'left'}
    //         ,{field: 'id', width: 80, title: 'ID', sort: true}
    //         ,{field: 'loginname', title: '登录名'}
    //         ,{field: 'telphone', title: '手机'}
    //         ,{field: 'email', title: '邮箱'}
    //         ,{field: 'role', title: '角色'}
    //         ,{field: 'jointime', title: '加入时间', sort: true}
    //         ,{field: 'check', title:'审核状态', templet: '#buttonTpl', minWidth: 80, align: 'center'}
    //         ,{title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
    //     ]]
    //     ,text: '对不起，加载出现异常！'
    // });
    //
    // //监听工具条
    // table.on('tool(LAY-user-back-manage)', function(obj){
    //     var data = obj.data;
    //     if(obj.event === 'del'){
    //         layer.prompt({
    //             formType: 1
    //             ,title: '敏感操作，请验证口令'
    //         }, function(value, index){
    //             layer.close(index);
    //             layer.confirm('确定删除此管理员？', function(index){
    //                 console.log(obj)
    //                 obj.del();
    //                 layer.close(index);
    //             });
    //         });
    //     }else if(obj.event === 'edit'){
    //         var tr = $(obj.tr);
    //
    //         layer.open({
    //             type: 2
    //             ,title: '编辑管理员'
    //             ,content: '../../../views/user/administrators/adminform.html'
    //             ,area: ['420px', '420px']
    //             ,btn: ['确定', '取消']
    //             ,yes: function(index, layero){
    //                 var iframeWindow = window['layui-layer-iframe'+ index]
    //                     ,submitID = 'LAY-user-back-submit'
    //                     ,submit = layero.find('iframe').contents().find('#'+ submitID);
    //
    //                 //监听提交
    //                 iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
    //                     var field = data.field; //获取提交的字段
    //
    //                     //提交 Ajax 成功后，静态更新表格中的数据
    //                     //$.ajax({});
    //                     table.reload('LAY-user-front-submit'); //数据刷新
    //                     layer.close(index); //关闭弹层
    //                 });
    //
    //                 submit.trigger('click');
    //             }
    //             ,success: function(layero, index){
    //
    //             }
    //         })
    //     }
    // });
    //
    // //角色管理
    // table.render({
    //     elem: '#LAY-user-back-role'
    //     ,url: layui.setter.base + 'json/useradmin/role.js' //模拟接口
    //     ,cols: [[
    //         {type: 'checkbox', fixed: 'left'}
    //         ,{field: 'id', width: 80, title: 'ID', sort: true}
    //         ,{field: 'rolename', title: '角色名'}
    //         ,{field: 'limits', title: '拥有权限'}
    //         ,{field: 'descr', title: '具体描述'}
    //         ,{title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
    //     ]]
    //     ,text: '对不起，加载出现异常！'
    // });
    //
    // //监听工具条
    // table.on('tool(LAY-user-back-role)', function(obj){
    //     var data = obj.data;
    //     if(obj.event === 'del'){
    //         layer.confirm('确定删除此角色？', function(index){
    //             obj.del();
    //             layer.close(index);
    //         });
    //     }else if(obj.event === 'edit'){
    //         var tr = $(obj.tr);
    //
    //         layer.open({
    //             type: 2
    //             ,title: '编辑角色'
    //             ,content: '../../../views/user/administrators/roleform.html'
    //             ,area: ['500px', '480px']
    //             ,btn: ['确定', '取消']
    //             ,yes: function(index, layero){
    //                 var iframeWindow = window['layui-layer-iframe'+ index]
    //                     ,submit = layero.find('iframe').contents().find("#LAY-user-role-submit");
    //
    //                 //监听提交
    //                 iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function(data){
    //                     var field = data.field; //获取提交的字段
    //
    //                     //提交 Ajax 成功后，静态更新表格中的数据
    //                     //$.ajax({});
    //                     table.reload('LAY-user-back-role'); //数据刷新
    //                     layer.close(index); //关闭弹层
    //                 });
    //
    //                 submit.trigger('click');
    //             }
    //             ,success: function(layero, index){
    //
    //             }
    //         })
    //     }
    // });

    exports('ConversionInfo', {})
});
