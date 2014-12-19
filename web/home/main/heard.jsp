<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function selfMsg(){
	if(${sessionModal.userType=="1"}){
		$.hmqHomePage("menuPage.htm?studentSelfPage");
	}else{
		$.hmqHomePage("menuPage.htm?teacherSelfPage");
	}
}
function clickMessage(v){
	var total = "${privateLetterCount}";
	$("#plul").remove();
	var html = "";
	$.post("./pLetter.htm?findNearPrivate",
			   function(data){
			   if(data && data.length > 0){
					html+= '<ul id="plul" class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">';
					html+= '<li class="dropdown-header"><i class="icon-envelope-alt"></i>'+total+'条消息</li>';
				    for(var i = 0; i < data.length; i++){
				    	html+= '<li>';
				    	html+= '<a href="#">';
				    	html+= '<img src="download/'+data[i].head+'.png" class="msg-photo" alt="headPic"/>';
				    	html+= '<span class="msg-body"><span class="msg-title">	<span class="blue">'+data[i].name+':</span>&nbsp;'+data[i].content+' ...</span>';
				    	html+= '<span class="msg-time"><i class="icon-time"></i><span>'+data[i].date+'</span></span></span>';
				    	html+= '</a>';
				    	html+= '</li>';
				    }
				    html+= '<li>';
					html+= '<a href="#" onclick="oneMenuUrl(\'menuPage.htm?privateLetter\',\'私信留言\')">';
					html+= '查看所有消息';
					html+= '<i class="icon-arrow-right"></i>';
					html+= '</a>';
					html+= '</li>';
					html+= '</ul>';
					$(v).after(html);
			   }
	},"json");
}
function clickNotice(v){
	$("#noticeul").remove();
	var html = "";
	$.post("./notice/findNearNotice.htm",
			   function(data){
			   if(data && data.length > 0){
					html+= '<ul id="noticeul" class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">';
					html+= '<li class="dropdown-header"><i class="icon-warning-sign"></i>${noticeCount}条通知</li>';
				    for(var i = 0; i < data.length; i++){
				    	html+= '<li>	<a href="#"><div class="clearfix"><span class="pull-left">';
				    	if(i%2 == 0){
				    		html+= '<i class="btn btn-xs no-hover btn-pink icon-comment"></i>';
				    	}else{
				    		html+= '<i class="btn btn-xs no-hover btn-info icon-twitter"></i>';
				    	}
				    	
				    	html+= data[i].name;
				    	if(i%2 == 0){
				    		html+= '</span>	<span class="pull-right badge badge-info">'+data[i].count+'</span></div></a></li>';
				    	}else{
				    		html+= '</span>	<span class="pull-right badge badge-success">'+data[i].count+'</span></div></a></li>';
				    	}
				    	
				    }
				    html+= '<li><a href="#" onclick="oneMenuUrl(\'menuPage.htm?noticereceivePage\',\'收件箱\')">查看所有通知<i class="icon-arrow-right"></i></a></li></ul>';
					$(v).after(html);
			   }
	},"json");
}

function modifyPwd(){
	var old =  $.trim($("#oldpwd").val());
	var new1 = $.trim($("#newpwd1").val());
	var new2 = $.trim($("#newpwd2").val());
	if(!old){
		alert("请输入原密码！");
		return;
	}
	if(!new1){
		alert("请输入新密码！");
		return;
	}
	if(!new1){
		alert("请确认新密码！");
		return;
	}
	if(new1 != new2){
		alert("确认密码与新密码不一致！");
		return;
	}
	$.post("home.htm?modifyPwd",{oP:old,nP:new1},
			   function(data){
		   		alert(data.msg);
		   		if(data.type == 0 || data.type == '0'){
					//$("#modal_form_updatePwd").hide();
					//$("div.modal-backdrop").hide();
					$("#modifypwdcancel").click();
					$("#oldpwd").val('');
					$("#newpwd1").val('');
					$("#newpwd2").val('');
		   		}
	},"json");
	
}

</script>

					<ul class="nav ace-nav">
						
						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-barcode"></i>
								<span class="badge badge-success">APP</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-envelope-alt"></i>
									二维码扫描下载
								</li>
								<c:if test="${sessionModal.userType==2}">
									<li>
										<a href="#">
											<img src="./home/android_js.png" width="120px" height="100px" alt="Susan's Avatar" />
											<span class="msg-body">
												
												<span class="msg-time">
													<i class="icon-time"></i>
													<span>android老师端</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="./home/ios_js.png" width="120px" height="100px" alt="暂无" />
											<span class="msg-body">
												
												<span class="msg-time">
													<i class="icon-time"></i>
													<span>ios老师端</span>
												</span>
											</span>
										</a>
									</li>
								</c:if>
								<c:if test="${sessionModal.userType==1}">
									<li>
										<a href="#">
											<img src="./home/android_jz.png" width="120px" height="100px" alt="Susan's Avatar" />
											<span class="msg-body">
												
												<span class="msg-time">
													<i class="icon-time"></i>
													<span>android家长端</span>
												</span>
											</span>
										</a>
									</li>
									<li>
										<a href="#">
											<img src="./home/ios_jz.png" width="120px" height="100px" alt="暂无" />
											<span class="msg-body">
												
												<span class="msg-time">
													<i class="icon-time"></i>
													<span>ios家长端</span>
												</span>
											</span>
										</a>
									</li>
								</c:if>

								<li>
									<a href="#">
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
						
						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#" onclick="clickNotice(this)">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">${noticeCount}</span>
							</a>

						</li>
						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#" onclick="clickMessage(this)">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">${privateLetterCount}</span>
							</a>
						</li>

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${sessionModal.png}" alt="" />
								<span class="user-info">
									<small>欢迎,</small>
									${sessionModal.name}
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#modal_form_updatePwd"  data-toggle="modal">
										<i class="icon-cog"></i>
										设置密码
									</a>
								</li>

								<li>
									<a href="javascript:selfMsg()">
										<i class="icon-user"></i>
										个人资料
									</a>
								</li>

								<li class="divider"></li>
								<li>
									<a href="javascript:$.logout()">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->