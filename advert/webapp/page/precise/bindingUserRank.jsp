<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="/WEB-INF/tags/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<input id="projetPath" type="hidden" value="<%=path%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=path %>/css/menu_right.css" type="text/css" />
<link rel="stylesheet" href="<%=path %>/css/platform.css" type="text/css" />
<link rel="stylesheet" href="<%=path %>/css/easydialog/easydialog.css" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=path %>/js/jquery/jquery-1.9.0.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/js/easydialog/easydialog.min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery/jquery.ui.all.css" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=path %>/js/jquery/ui/jquery-ui-1.10.0.custom.js"></script>
<title>无标题文档</title>
<script>
//保存已选广告位[因父页面要引用此变量，故此处定义为全局变量]
var alreadyChooseObject = [];

function accessUrl(url){
		window.location.href=url;
}
$(function(){   
    $("#bm").find("tr:even").addClass("treven");  //奇数行的样式
    $("#bm").find("tr:odd").addClass("trodd");  //偶数行的样式
    $("#system-dialog").hide();
    
    
    var userRankList="{'list':[";
     <c:choose>
		<c:when test="${!empty userRankList}">
			<c:forEach var="userRank" items="${userRankList}" varStatus="status">
				userRankList+="{'userRankOrder':'${status.count}','userRankCode':'${userRank.userLevels}','userRankName':'${userRank.userLevelsName}'}";
				<c:choose>
					<c:when test="${status.last}">
					</c:when>
					<c:otherwise>
						userRankList+=',';
					</c:otherwise>
				</c:choose>						
			</c:forEach>
		</c:when>			
	</c:choose>
	userRankList+="]}";
	var userRankListObject=eval("("+userRankList+")");
    $("#searchUserRankSubmit").click(function(){
     	var userRankName = $("#userRankName").val();
     	userRankName = encodeURI(userRankName);   
		userRankName = encodeURI(userRankName);
     	url='queryUserRank.do?method=queryUserRank&userRankName='+userRankName;
     	accessUrl(url);
     	return;
     });
     $("#chooseUserRankButton").click(function(){
     
     	var alreadyChoose = "";
	    $("input[name='userRankCheckBox']").each(function(){
	        if($(this).is(':checked')){
	            alreadyChoose += $(this).val() + "#";
	        }
	    });
	    
	    if($.isEmptyObject(alreadyChoose)){
	    	var message = '请先选择已有【用户级别】后再进行添加';
			$("#content").html(message);
			$( "#system-dialog" ).dialog({
		      	modal: true
		    });
	    }else{
	    	var alreadyChooseColumn = alreadyChoose.split('#');
	    	$(alreadyChooseColumn).each(function(index,itemOut){
	    		if(!$.isEmptyObject(itemOut)){
	       			$(userRankListObject.list).each(function(index,itemInner){
	       				if((!$.isEmptyObject(itemOut))&&(itemOut==itemInner.userRankCode)){
	       					var jsonStr = deepCopy(itemInner);
	       					alreadyChooseObject.push(jsonStr);
	       				}
					});
	       		}
			});
	 		
	 		parent.showChooseList4Page(1,11);
	    }
	    parent.easyDialog.close();
     });
	
});
/**
 * 对象属性拷贝
 *
 */
function deepCopy(obj){
            if(obj instanceof Array){
                var arr = [],i = obj.length;
                while(i--){
                   arr[i] = arguments.callee.call(null,obj[i]);
                }
                return arr;
            }else if(obj instanceof Date || obj instanceof RegExp || obj instanceof Function){
                return obj;
            }else if(obj instanceof Object){
                var a = {};
                for(var i in obj){
                   a[i] = arguments.callee.call(null,obj[i]);
                }
                return a;
            }else{
                return obj;
            }
        }
</script>
<style>
	.easyDialog_wrapper{ width:800px;color:#444; border:3px solid rgba(0,0,0,0); -webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; -webkit-box-shadow:0 0 10px rgba(0,0,0,0.4); -moz-box-shadow:0 0 10px rgba(0,0,0,0.4); box-shadow:0 0 10px rgba(0,0,0,0.4); display:none; font-family:"Microsoft yahei", Arial; }
	.easyDialog_text{}
</style>
<style>
.treven {
	background: #FFFFFF;
}

.trodd {
	background: #f6f6f6;
}
</style>
</head>

<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td style="padding:2px;">
			<table cellpadding="0" cellspacing="1" width="100%" class="tablea">
				<tr>
					<td class="formTitle" colspan="99"><span>·用户级别查询</span></td>
				</tr>
				<tr>
					<td class="td_label">用户级别名称：</td>
					<td class="td_input">
						<input id="userRankName" name="userRankName" class="e_input" type="text" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'" value="${userRankName}" maxlength="80"/>
					</td>
				</tr>
				<tr>
					<td class="formBottom" colspan="99">
						<input name="searchUserRankSubmit" id="searchUserRankSubmit" type="button" title="查看" class="b_search" value=""/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="padding:2px;">
			<div>  
				<table cellpadding="0" cellspacing="1" width="100%"
			class="taba_right_list" id="bm">
					<tr>
						<td colspan="23" style="padding-left: 8px; background: url(<%=path %>/images/menu_righttop.png) repeat-x; text-align: left; height: 26px;"><span>·用户级别列表</span></td>
					</tr>
					<tr>
						<td height="26px" align="center">选项</td>
						<td height="26px" align="center">序号</td>
						<td>用户级别名称</td>
					</tr>
					<c:choose>
						<c:when test="${!empty userRankList}">
							<c:forEach var="userRank" items="${userRankList}" varStatus="status">
								<tr>
									<td align="center" height="26"><input type="checkbox" id="userRankCheckBox" name="userRankCheckBox" value="${userRank.userLevels}"/></td>
									<td align="center" height="26">${status.count}</td>
									<td>${userRank.userLevelsName}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="12">
									暂无记录
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="12">
						
						</td>
					</tr>
					<c:if test="${index<page.pageSize}">
						<c:forEach begin="${index}" end="${page.pageSize-1}" step="1">
							<tr>
								<td align="center" height="26">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td height="34" colspan="12"
							style="background: url(<%=path %>/images/bottom.jpg) repeat-x; text-align: right;">
							<a href="#">当前第${page.pageNo }/${page.totalPage }页</a>&nbsp;&nbsp; 
							<c:choose>
								<c:when test="${page.pageNo==1&&page.totalPage!=1}">
									<a href="queryUserRank.do?pageNo=${page.pageNo+1 }&userRankName=${userRankName}">下一页</a>&nbsp;&nbsp;
									<a href="queryUserRank.do?pageNo=${page.totalPage}&userRankName=${userRankName}">末页</a>&nbsp;&nbsp;
								</c:when>
								<c:when test="${page.pageNo==page.totalPage&&page.totalPage!=1 }">
									<a href="queryUserRank.do?pageNo=1&userRankName=${userRankName}">首页</a>&nbsp;&nbsp;
									<a href="queryUserRank.do?pageNo=${page.pageNo-1 }&userRankName=${userRankName}">上一页</a>&nbsp;&nbsp;
								</c:when>
								<c:when test="${page.pageNo>1&&page.pageNo<page.totalPage }">
									<a href="queryUserRank.do?pageNo=1&userRankName=${userRankName}">首页</a>&nbsp;&nbsp;
									<a href="queryUserRank.do?pageNo=${page.pageNo-1 }&userRankName=${userRankName}">上一页</a>&nbsp;&nbsp;
									<a href="queryUserRank.do?pageNo=${page.pageNo+1 }&userRankName=${userRankName}">下一页</a>&nbsp;&nbsp;
									<a href="queryUserRank.do?pageNo=${page.totalPage}&userRankName=${userRankName}">末页</a>&nbsp;&nbsp;
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="formBottom" colspan="99" style="text-align: right;">
							 <input id="chooseUserRankButton" name="chooseUserRankButton" type="button" title="确定" class="b_add" value="" onfocus=blur()/>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
<div id="system-dialog" title="友情提示">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
    <span id="content"></span>
  </p>
</div>
</body>
</html>