/**

 @Name：layuiAdmin 公共业务
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */

layui.define(function(exports){
  var $ = layui.$
  ,layer = layui.layer
  ,laytpl = layui.laytpl
  ,setter = layui.setter
  ,view = layui.view
  ,admin = layui.admin

  //公共业务的逻辑处理可以写在此处，切换任何页面都会执行
  //……



  //退出
  admin.events.logout = function(){
    //执行退出接口



    location.href = getRootPath_web()+'/views/login.html';


    // location.href = '../../memberAdmin/views/login.html';

    // admin.req({
    //   url: layui.setter.base + 'json/user/logout.js'
    //   ,type: 'get'
    //   ,data: {}
    //   ,done: function(res){ //这里要说明一下：done 是只有 response 的 code 正常才会执行。而 succese 则是只要 http 为 200 就会执行
    //
    //     //清空本地记录的 token，并跳转到登入页
    //     admin.exit(function(){
    //       location.href = 'user/login.html';
    //     });
    //   }
    // });
  };


  //对外暴露的接口
  exports('common', {});
});

//获取目录路径方法
function getRootPath_web() {

  //获取当前网址，如： http://localhost:8888/eeeeeee/aaaa/vvvv.html
  var curWwwPath = window.document.location.href;
  //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
  var pathName = window.document.location.pathname;
  var pos = curWwwPath.indexOf(pathName);
  //获取主机地址，如： http://localhost:8888
  var localhostPaht = curWwwPath.substring(0, pos);
  //获取带"/"的项目名，如：/abcd
  var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

  // return (localhostPaht + projectName);


  // console.log("当前网址:"+curWwwPath);
  // console.log("主机地址后的目录:"+pos+"----"+pathName);
  // console.log("主机地址:"+localhostPaht);
  // console.log("项目名:"+projectName);


  return localhostPaht+projectName;
}
