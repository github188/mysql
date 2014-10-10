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
    
    
    var userIndustrysList="{'list':[";
     <c:choose>
		<c:when test="${!empty userIndustrysList}">
			<c:forEach var="userIndustrys" items="${userIndustrysList}" varStatus="status">
				userIndustrysList+="{'userIndustrysOrder':'${status.count}','userIndustrysCode':'${userIndustrys.userIndustrys}','userIndustrysName':'${userIndustrys.userIndustrysName}'}";
				<c:choose>
					<c:when test="${status.last}">
					</c:when>
					<c:otherwise>
						userIndustrysList+=',';
					</c:otherwise>
				</c:choose>						
			</c:forEach>
		</c:when>			
	</c:choose>
	userIndustrysList+="]}";
	var userIndustrysListObject=eval("("+userIndustrysList+")");
    $("#searchUserIndustrysSubmit").click(function(){
     	var userIndustrysName = $("#userIndustrysName").val();
     	userIndustrysName = encodeURI(userIndustrysName);   
		userIndustrysName = encodeURI(userIndustrysName);
     	url='queryUserIndustrys.do?method=queryUserIndustrys&userIndustrysName='+userIndustrysName;
     	accessUrl(url);
     	return;
     });
     $("#chooseUserIndustrysButton").click(function(){
     
     	var alreadyChoose = "";
	    $("input[name='userIndustrysCheckBox']").each(function(){
	        if($(this).is(':checked')){
	            alreadyChoose += $(this).val() + "#";
	        }
	    });
	    
	    if($.isEmptyObject(alreadyChoose)){
	    	var message = '请先选择已有【用户行业】后再进行添加';
			$("#content").html(message);
			$( "#system-dialog" ).dialog({
		      	modal: true
		    });
	    }else{
	    	var alreadyChooseColumn = alreadyChoose.split('#');
	    	$(alreadyChooseColumn).each(function(index,itemOut){
	    		if(!$.isEmptyObject(itemOut)){
	       			$(userIndustrysListObject.list).each(function(index,itemInner){
	       				if((!$.isEmptyObject(itemOut))&&(itemOut==itemInner.userIndustrysCode)){
	       					var jsonStr = deepCopy(itemInner);
	       					alreadyChooseObject.push(jsonStr);
	       				}
					});
	       		}
			});
	 		
	 		parent.showChooseList4Page(1,10);
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
					<td class="formTitle" colspan="99"><span>·用户行业查询</span></td>
				</tr>
				<tr>
					<td class="td_label">用户行业名称：</td>
					<td class="td_input">
						<input id="userIndustrysName" name="userIndustrysName" class="e_input" type="text" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'" value="${userIndustrysName}" maxlength="80"/>
					</td>
				</tr>
				<tr>
					<td class="formBottom" colspan="99">
						<input name="searchUserIndustrysSubmit" id="searchUserIndustrysSubmit" type="button" title="查看" class="b_search" value=""/>
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
						<td colspan="23" style="padding-left: 8px; background: url(<%=path %>/images/menu_righttop.png) repeat-x; text-align: left; height: 26px;"><span>·用户行业列表</span></td>
					</tr>
					<tr>
						<td height="26px" align="center">选项</td>
						<td height="26px" align="center">序号</td>
						<td>用户行业名称</td>
					</tr>
					<c:choose>
						<c:when test="${!empty userIndustrysList}">
							<c:forEach var="userIndustrys" items="${userIndustrysList}" varStatus="status">
								<tr>
									<td align="center" height="26"><input type="checkbox" id="userIndustrysCheckBox" name="userIndustrysCheckBox" value="${userIndustrys.userIndustrys}"/></td>
									<td align="center" height="26">${status.count}</td>
									<td>${userIndustrys.userIndustrysName}</td>
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
									<a href="queryUserIndustrys.do?pageNo=${page.pageNo+1 }&userIndustrysName=${userIndustrysName}">下一页</a>&nbsp;&nbsp;
									<a href="queryUserIndustrys.do?pageNo=${page.totalPage}&userIndustrysName=${userIndustrysName}">末页</a>&nbsp;&nbsp;
								</c:when>
								<c:when test="${page.pageNo==page.totalPage&&page.totalPage!=1 }">
									<a href="queryUserIndustrys.do?pageNo=1&userIndustrysName=${userIndustrysName}">首页</a>&nbsp;&nbsp;
									<a href="queryUserIndustrys.do?pageNo=${page.pageNo-1 }&userIndustrysName=${userIndustrysName}">上一页</a>&nbsp;&nbsp;
								</c:when>
								<c:when test="${page.pageNo>1&&page.pageNo<page.totalPage }">
									<a href="queryUserIndustrys.do?pageNo=1&userIndustrysName=${userIndustrysName}">首页</a>&nbsp;&nbsp;
									<a href="queryUserIndustrys.do?pageNo=${page.pageNo-1 }&userIndustrysName=${userIndustrysName}">上一页</a>&nbsp;&nbsp;
									<a href="queryUserIndustrys.do?pageNo=${page.pageNo+1 }&userIndustrysName=${userIndustrysName}">下一页</a>&nbsp;&nbsp;
									<a href="queryUserIndustrys.do?pageNo=${page.totalPage}&userIndustrysName=${userIndustrysName}">末页</a>&nbsp;&nbsp;
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="formBottom" colspan="99" style="text-align: right;">
							 <input id="chooseUserIndustrysButton" name="chooseuserIndustrysButton" type="button" title="确定" class="b_add" value="" onfocus=blur()/>
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