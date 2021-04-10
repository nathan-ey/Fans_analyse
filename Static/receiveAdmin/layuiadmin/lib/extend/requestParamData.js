	//登陆参数函数
	function loginRequest(login_username,login_password) {

		//声明json格式的请求数据
		var login_requestdata = {"admin_name": login_username, "admin_password": login_password};

		return  login_requestdata;

	}

	//--------------------用户管理模块--------------------------------
	//用户管理-正常用户->参数函数,
	function yhgl_list_Request(token,status,type){

		//status 1.正常 2.等待确认 3.过期任务
		//type 1.加粉 2.加群
		var yhgl_list_requestdata = {};

		yhgl_list_requestdata['token']= token;
		yhgl_list_requestdata['status']= status;

		return yhgl_list_requestdata;

	}


	//--------------------微信管理模块--------------------------------
	//微信管理-已通过审核->参数函数,
	//同样适用微信管理-未审核->参数函数
	//同样适用微信管理-未通过审核->参数函数
	//同样适用微信管理-已禁用->参数函数
	function wxglRequest(token,status,addFans_status,add_group_status) {

		//status 1.通过审核 2.未通过审核 3.未审核 4.已禁用
		//addFans_status添加粉丝任务状态 1.未接任务 2.已接任务
		//addFans_status拉群的状态 0.没有权限 1.未接任务 2.已接任务

		var wxgl_requestdata = {"token":token,"status":status,"addFans_status":addFans_status,"add_group_status":add_group_status};

		return  wxgl_requestdata;

	}



	//同样适用 微信管理-未审核->通过按钮->参数函数,
	//同样适用 微信管理-未审核->不通过按钮->参数函数

	//同样适用 微信管理-已通过审核->禁用按钮->参数函数
	//同样适用 微信管理-已通过审核->不通过按钮->参数函数

	//同样适用 微信管理-未通过审核->开关按钮->参数函数

	//同样适用 微信管理-已禁用审核->开关按钮->参数函数

	function wxgl_tgsh_btgbtn_jinyongbtn_Request(token,status,user_id,remark,wx_number,id) {

		var xgl_tgsh_btgbtn_jinyongbtn_requestdata={};
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['token']= token;
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['status']= status;
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['user_id']= user_id;
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['remark']= remark;
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['wx_number']= wx_number;
		xgl_tgsh_btgbtn_jinyongbtn_requestdata['id']= id;

		return  xgl_tgsh_btgbtn_jinyongbtn_requestdata;

	}



	//--------------------任务管理模块--------------------------------
	//任务管理-拉粉管理->进行中->参数函数,
	//任务管理-拉群管理->进行中->参数函数,
	function rwgl_list_Request(token,status,type){

		//status 1.正常 2.等待确认 3.过期任务
		//type 1.加粉 2.加群
		var rwgl_list_requestdata = {};

		rwgl_list_requestdata['token']= token;
		rwgl_list_requestdata['status']= status;
		rwgl_list_requestdata['type']= type;

		return rwgl_list_requestdata;

	}


	//任务管理-拉粉管理->进行中->禁用按钮->参数函数,
	function rwgl_channel_status_Request(token,status,remark,wx_number,id){

		var rwgl_channel_status_requestdata = {};

		rwgl_channel_status_requestdata['token']= token;
		rwgl_channel_status_requestdata['status']= status;
		rwgl_channel_status_requestdata['remark']= remark;
		rwgl_channel_status_requestdata['wx_number']= wx_number;
		rwgl_channel_status_requestdata['id']= id;

		return rwgl_channel_status_requestdata;

	}

	//任务管理-拉群管理->通过按钮|不通过按钮->参数函数,
	function rwgl_set_group_tasks_status_Request(token,id,status){

		var rwgl_set_group_tasks_status_requestdata = {};

		rwgl_set_group_tasks_status_requestdata['token']= token;
		rwgl_set_group_tasks_status_requestdata['id']= id;
		rwgl_set_group_tasks_status_requestdata['status']= status;

		return rwgl_set_group_tasks_status_requestdata;

	}



	//微信管理-建立任务->新建按钮->参数函数,
	function wxglBuildRequest(token,action,name,task_object) {


		var wxglBuild_requestdata = {"token":token,"action":action,"name":name,"task_object":task_object};

		return  wxglBuild_requestdata;

	}
	//微信管理->新建任务->编辑按钮->参数函数,
	function wxglBuildUpdataRequest(token,action,taskid,name,task_object) {


		var wxglBuildUpdata_requestdata = {"token":token,"action":action,"id":taskid,"name":name,"task_object":task_object};

		return  wxglBuildUpdata_requestdata;

	}

	//微信管理-新建任务->删除按钮->参数函数,
	function wxglBuildDeteleRequest(token,action,taskid,status) {


		var wxglBuildDetele_requestdata = {"token":token,"action":action,"id":taskid,"status":status};

		return  wxglBuildDetele_requestdata;

	}



	//微信管理-新建任务->开关按钮->参数函数,
	function wxglBuildSwitchRequest(token,action,ids,switchs) {

		var wxglBuildSwitch_requestdata = {"token":token,"action":action,"id":ids,"switch":switchs};

		return  wxglBuildSwitch_requestdata;

	}


	//--------------------任务详情模块--------------------------------
	//任务详情-拉粉详情->审核通过->参数函数,
	//任务详情-拉粉详情->待审核通过->参数函数,
	//任务详情-拉粉详情->审核未通过->参数函数,
	//任务详情-拉粉详情->审核未提交->参数函数,
	function rwxq_list_Request(token,status){

		//status 1.审核通过 2.待审核 3.未通过审核 4.尚未提交
		var rwxq_list_requestdata = {};

		rwxq_list_requestdata['token']= token;
		rwxq_list_requestdata['status']= status;

		return rwxq_list_requestdata;

	}


	//--------------------团队管理模块--------------------------------
	//团队管理->团队列表->参数函数
	function tdgl_list_Request(token,status){

		//status 1.审核通过 2.待审核 3.未通过审核 4.尚未提交
		var tdgl_list_requestdata = {};


		tdgl_list_requestdata['token']= token;
		tdgl_list_requestdata['status']= status;


		return tdgl_list_requestdata;

	}


	//--------------------资金管理模块--------------------------------
	//资金管理->提现账单->参数函数,
	function txgl_list_Request(token,status,type){

		//status 1.申请中 2.驳回 3.已通过
		var txgl_list_requestdata = {};

		txgl_list_requestdata['token']= token;
		txgl_list_requestdata['status']= status;

		return txgl_list_requestdata;

	}



	//--------------------留言管理模块--------------------------------
	//留言管理->参数函数,
	function lygl_list_Request(token,status,type){

		//status 1.已读 2.未读

		var lygl_list_requestdata = {};

		lygl_list_requestdata['token']= token;
		lygl_list_requestdata['status']= status;

		return lygl_list_requestdata;

	}



	//--------------------配置模块--------------------------------
	//配置-APP配置->参数函数
	function APP_list_Request(token,money,min_tx_money,money_for_add_fans,money_for_add_fans_group,notification,group_task_recall_time,switch_for_fans,switch_for_group,group_task_begin_time,group_task_end_time){//暂时没有配置到网页

		//status 1.审核通过 2.待审核 3.未通过审核 4.尚未提交
		var conf_channelMoney_requestdata = {};

		conf_channelMoney_requestdata['token']= token;
		conf_channelMoney_requestdata['money']= money;
		conf_channelMoney_requestdata['min_tx_money']= min_tx_money;
		conf_channelMoney_requestdata['money_for_add_fans']= money_for_add_fans;


		conf_channelMoney_requestdata['money_for_add_fans_group']= money_for_add_fans_group;
		conf_channelMoney_requestdata['notification']= notification;
		conf_channelMoney_requestdata['group_task_recall_time']= group_task_recall_time;

		conf_channelMoney_requestdata['switch_for_fans']= switch_for_fans;
		conf_channelMoney_requestdata['switch_for_group']= switch_for_group;

		conf_channelMoney_requestdata['group_task_begin_time']= group_task_begin_time;
		conf_channelMoney_requestdata['group_task_end_time']= group_task_end_time;


		return conf_channelMoney_requestdata;

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

