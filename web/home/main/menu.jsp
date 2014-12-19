<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function liClass(ID,child){
	//boolean b=$(ID).attr("class").indexOf("open");
	$(".oneMenu").each(function(){
		$(this).removeClass("active");
	});
	if(child){
		
	}else{
		$(ID).addClass("active");
	}
}
function oneMenuUrl(url,name){
	$("#g_menu").text(name);
	if($.isEmpty(url))return;
	$.hmqHomePage(url);
}
function twoMenuUrl(url){
	$.hmqHomePage(url);
}
//${menu.url}
</script>
		<ul class="nav nav-list">
			<c:forEach items="${menus}" var="menu">
				<li onclick="liClass(this,${menu.child!=null})" class="oneMenu">
					<a href="#" onclick="oneMenuUrl('${menu.url}','${menu.name}')" class="dropdown-toggle">
						<i class="${menu.icon}"></i>
						<c:if test="${menu.child!=null}">
							<span class="menu-text">
								${menu.name}<span class="badge badge-primary ">${menu.childsize}</span>
							</span>
							<b class="arrow fa fa-angle-down"></b>
						</c:if>
						<c:if test="${menu.child==null}">
							<span class="menu-text">
								${menu.name}
							</span>
						</c:if>
					</a>
					<c:if test="${menu.child!=null}">
						<ul class="submenu">
							<c:forEach items="${menu.child}" var="menuSon">
								<li><a href="#" onclick="twoMenuUrl('${menuSon.url}')"><i class="icon-double-angle-right"></i>${menuSon.name}</a></li>
							</c:forEach>
						</ul>
					</c:if>
				</li>
			</c:forEach>
		</ul>