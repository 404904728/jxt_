<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<title>Ace Admin</title>

	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="./res/ace/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./res/ace/assets/font-awesome/4.1.0/css/font-awesome.min.css" />

	<!-- page specific plugin styles -->
	<link rel="stylesheet" href="./res/ace/assets/css/jquery-ui.custom.min.css" />
	<link rel="stylesheet" href="./res/ace/assets/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="./res/ace/assets/css/jquery.gritter.css" />
	<link rel="stylesheet" href="./res/ace/assets/css/datepicker.css" />
	<link rel="stylesheet" href="./res/ace/assets/css/ui.jqgrid.css" />
	
	<!-- text fonts -->
	<link rel="stylesheet" href="./res/ace/assets/fonts/fonts.googleapis.com.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="./res/ace/assets/css/ace.min.css" id="main-ace-style" />
	<link rel="stylesheet" href="./res/ace/assets/css/colorbox.css" />
	
		<!-- select -->
		<link rel="stylesheet" href="./res/ace/assets/css/select2.css" />
		<link rel="stylesheet" href="./res/ace/assets/css/chosen.css" />
		
	<!--[if lte IE 9]>
	<link rel="stylesheet" href="./res/ace/assets/css/ace-part2.min.css" />
	<![endif]-->
	<link rel="stylesheet" href="./res/ace/assets/css/ace-skins.min.css" />
	<link rel="stylesheet" href="./res/ace/assets/css/ace-rtl.min.css" />

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="./res/ace/assets/css/ace-ie.min.css" />
	<![endif]-->

	<!-- inline styles related to this page -->

	<!-- ace settings handler -->
	<script src="./res/ace/assets/js/ace-extra.min.js"></script>

	<!--[if !IE]> -->
	<script src="./res/ace/assets/js/jquery.2.1.1.min.js"></script>
	<!-- <![endif]-->
	
	<!--[if IE]>
	<script src="./res/ace/assets/js/jquery.1.11.1.min.js"></script>
	<![endif]-->
	
	<!--[if IE]>
	<script type="text/javascript">
		window.jQuery || document.write("<script src='./res/ace/assets/js/jquery1x.min.js'>"+"<"+"/script>");
	</script>
	<![endif]-->

	<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

	<!--[if lte IE 8]>
	<script src="./res/ace/assets/js/html5shiv.min.js"></script>
	<script src="./res/ace/assets/js/respond.min.js"></script>
	<script src="./res/ace/assets/js/excanvas.min.js"></script>
	<![endif]-->
	<script src="./res/ace/assets/js/bootstrap.min.js"></script>
	<script src="./res/ace/assets/js/jquery-ui.min.js"></script>
	<!-- page specific plugin scripts -->
	<script src="./res/ace/assets/js/jquery-ui.custom.min.js"></script>
	<script src="./res/ace/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="./res/ace/assets/js/bootbox.min.js"></script>
	<script src="./res/ace/assets/js/jquery.gritter.min.js"></script>
	<script src="./res/ace/assets/js/spin.min.js"></script>
	<script src="./res/ace/assets/js/jquery.slimscroll.min.js"></script>
	<script src="./res/ace/assets/js/flot/jquery.flot.min.js"></script>
	<script src="./res/ace/assets/js/flot/jquery.flot.pie.min.js"></script>
	<script src="./res/ace/assets/js/flot/jquery.flot.resize.min.js"></script>


	<!-- ace scripts -->
	<script src="./res/ace/assets/js/ace-elements.min.js"></script>
	<script src="./res/ace/assets/js/ace.min.js"></script>
	
	
	<!-- 验证 -->
	<script src="./res/ace/assets/js/jquery.validate.min.js"></script>
	<link rel="stylesheet" href="./res/css/validate/validate.css" type="text/css" />
		
	<!-- 表格-->
	<script src="./res/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="./res/ace/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script src="./res/ace/assets/js/jqGrid/i18n/grid.locale-ch.js"></script>
	<script src="./res/ace/assets/js/jqGrid/jqGridUtil.js"></script>
	
	<script src="./res/script_/hmq/hmq.js"></script>
	<script src="./res/ace/aceUtil.js"></script>
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default">
<div class="navbar-container" id="navbar-container">
<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
	<span class="sr-only">Toggle sidebar</span>

	<span class="icon-bar"></span>

	<span class="icon-bar"></span>

	<span class="icon-bar"></span>
</button>

<div class="navbar-header pull-left">
	<a href="#" class="navbar-brand">
		<small>
			<i class="fa fa-leaf"></i>
			Admin
		</small>
	</a>
</div>

<div class="navbar-buttons navbar-header pull-right" role="navigation">
     		<%@include file="./main/heard.jsp"%>
</div>
</div><!-- /.navbar-container -->
</div>

<div class="main-container" id="main-container">
<script type="text/javascript">
	try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>

<div id="sidebar" class="sidebar responsive">
<script type="text/javascript">
	try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
</script>

<div class="sidebar-shortcuts" id="sidebar-shortcuts">
	<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
		<button class="btn btn-success">
			<i class="ace-icon fa fa-signal"></i>
		</button>

		<button class="btn btn-info">
			<i class="ace-icon fa fa-pencil"></i>
		</button>

		<button class="btn btn-warning">
			<i class="ace-icon fa fa-users"></i>
		</button>

		<button class="btn btn-danger">
			<i class="ace-icon fa fa-cogs"></i>
		</button>
	</div>

	<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
		<span class="btn btn-success"></span>

		<span class="btn btn-info"></span>

		<span class="btn btn-warning"></span>

		<span class="btn btn-danger"></span>
	</div>
</div><!-- /.sidebar-shortcuts -->
 <%@include file="./main/menu.jsp"%>




<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
	<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
</div>

<script type="text/javascript">
	try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
</script>
</div>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="#">主页</a>
			</li>
			<li id="g_menu" class="active">个人中心</li>
		</ul><!-- /.breadcrumb -->
	</div>
					<div id="homePageContent" class="page-content">	</div>
					<script>
						if(${sessionModal.userType=="1"}){
							$.hmqHomePage("menuPage.htm?studentSelfPage");
						}else{
							$.hmqHomePage("menuPage.htm?teacherSelfPage");
						}
					</script>
</div><!-- /.main-content -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
	<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

<div id="modal_form_updatePwd" class="modal" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="blue bigger">请输入原密码后修改密码</h4>
											</div>

											<div class="modal-body overflow-visible">
												<div class="row">
														<div class="col-xs-12">
											<form class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right" for="form-field-1"> 原密码:</label>
			
													<div class="col-sm-8">
														<input type="password" id="oldpwd" class="col-xs-10 col-sm-5" />
													</div>
												</div>
			
												<div class="space-4"></div>
			
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right" for="form-field-2">新密码:</label>
			
													<div class="col-sm-8">
														<input type="password" id="newpwd1"  class="col-xs-10 col-sm-5" />
													</div>
												</div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right" for="form-input-readonly">确认新密码:</label>
													<div class="col-sm-8">
														<input type="password" id="newpwd2" class="col-xs-10 col-sm-5" />
													</div>
												</div>
											</form>
												
												</div>
											</div>

											<div class="modal-footer">
												<button id="modifypwdcancel" type="reset" class="btn btn-sm" data-dismiss="modal">
													<i class="icon-remove"></i>
													取消
												</button>

												<button onclick="modifyPwd()" type="button" class="btn btn-sm btn-primary" >
													<i class="icon-ok"></i>
													保存
												</button>
											</div>
										</div>
									</div>
								</div>
			</div>
</div><!-- /.main-container -->
<!-- basic scripts -->

<script type="text/javascript">
	try{ace.settings.check('navbar' , 'fixed')}catch(e){}

	if('ontouchstart' in document.documentElement){
		document.write("<script src='./res/ace/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	}
	
	function reloadNotice(url){
		$.hmqHomePage(url);
	}
	
	function changeHeadImg(){
		$.dialogACE({
			url:"uploader.htm?show_",
			title:"修改头像",
			frame:true,width:500,height:300,
			frameId:'headImg',
			button:{
				text: "测试头像",
			    "class" : "btn btn-pink btn-xs",
				click: function() {
					var attachId=$("#headImg")[0].contentWindow.attachId;
					if(attachId==null){
						alert("请先上传照片");
						return;
					}
					$("#avatar").attr("src","download/" + attachId + ".png");
				} 
			},
			callBack:function(dialog){
				var attachId=$("#headImg")[0].contentWindow.attachId;
				if(attachId==null){
					alert("请先上传照片");
					return;
				}
				$.hmqAJAX("user/changeImg.htm",function(data){
					alert(data.msg);
					window.location.reload();
					$(dialog).dialog("destroy");
				},{"attachId":attachId});
			}
		})	
	}
</script>
</body>
</html>
