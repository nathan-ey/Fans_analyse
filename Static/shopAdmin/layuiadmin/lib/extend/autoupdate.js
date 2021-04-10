
	var saveToken = GetCookie('tokenMyb');

// console.log("saveToken值:"+saveToken);

	//页面点击事件自动延长1个小时时间
	jQuery(document).click(function (event)
	{
		var abctemp = getRootPath_web();

		console.log("返回值:"+abctemp)
		var globalCK= GetCookie('tokenMyb');

		// console.log("当前CK值:"+ globalCK);

		if(globalCK == "" || globalCK == null){

			// console.log("绘画时间已过,点击跳回");
			window.top.location.href= getRootPath_web()+"/centralism/login.html";

		}else{

			JsSetCookie('tokenMyb',saveToken);
			// console.log("延迟时间");

			// var millisecond = new Date().getTime();
			// var expiresTime = new Date(millisecond +  1000 * 6);
			//
			// document.cookie = "expires=" + expiresTime.toGMTString();

			// console.log("延迟时间---当前CK值:"+ document.cookie);

		}

	});


	//取Cookie的值
    function GetCookie(name) {
	 	var arg = name + "=";
	   	var alen = arg.length;
	    var clen = document.cookie.length;
		var i = 0;
	    while (i < clen) {
			   var j = i + alen;
			   //alert(j);
			   if (document.cookie.substring(i, j) == arg) return getCookieVal(j);
			   i = document.cookie.indexOf(" ", i) + 1;
	           if (i == 0) break;
		       }
	   return null;
   	}


	function getCookieVal(offset) {
	       var endstr = document.cookie.indexOf(";", offset);
	       if (endstr == -1) endstr = document.cookie.length;
		   return unescape(document.cookie.substring(offset, endstr));
	}



	//设置CK方法
	function JsSetCookie(name,value)//两个参数，一个是cookie名称，一个是值
	{
		var millisecond = new Date().getTime();
		var expiresTime = new Date(millisecond + 60 * 1000 * 60);

		document.cookie = name + "="+ escape (value) + ";expires=" + expiresTime.toGMTString();
	}



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


		console.log("当前网址:"+curWwwPath);
		console.log("主机地址后的目录:"+pos+"----"+pathName);
		console.log("主机地址:"+localhostPaht);
		console.log("项目名:"+projectName);


		return localhostPaht;
    }

	//
	// "global_requestloginAddress":"http://8.136.97.179:9501/centralism/login",
	// "global_requestUrl":"http://8.136.97.179:9501/centralism/",
	// "global_wx_inventoryUrl":"http://8.136.97.179:9501/centralism/show_wx_inventory",
	// "global_requestWxwshUrl":"http://8.136.97.179:9501/centralism/get_wx_numbers",
	// "global_imgAddress":"https://ogame.oss-cn-shenzhen.aliyuncs.com/",
	// "global_change_wx_statusUrl":"http://8.136.97.179:9501/centralism/change_wx_status",
	// "global_wx_tasks":"http://8.136.97.179:9501/centralism/get_wx_tasks",
	// "global_import_wxUrl":"http://8.136.97.179:9501/centralism/import_wx_inventory",
	// "global_document_message":"http://8.136.97.179:9501/centralism/document_message",
	// "global_admin_config":"http://8.136.97.179:9501/centralism/admin_config"

