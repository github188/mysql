<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tags/c.tld"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/menu_right.css" type="text/css" />
<link rel="stylesheet" href="css/platform.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/js.js"></script>


<script language="javascript" type="text/javascript" src="<%=path%>/js/jquery/jquery-1.9.0.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/contract/listContract.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/jquery/datepicker/jquery.ui.datepicker.js"></script>
<script src="<%=path%>/js/jquery/ui/jquery.ui.core.js"></script>
<script src="<%=path%>/js/jquery/ui/jquery.ui.widget.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery/jquery.ui.all.css">
<title>修改视频素材</title>
<script type="text/javascript">
		
			
			//页面加载时调用访法 
    	    window.onload=function(){
			  getStartTime();
			  getEndTime();
			  getFilePath();
    		}
    		
    		//得到有效结束时间
    		function getEndTime(){
    			 var end =  document.getElementById("endTimeHidden").value;
    			 var endTime = end.substr(0,10);
    			 document.getElementById("endTime").value=endTime;
    		}
    		
    		
    		//得到生效开始时间
    		function getStartTime(){
    			 var start =  document.getElementById("startTimeHidden").value;
    			 var startTime = start.substr(0,10);
    			 document.getElementById("startTime").value=startTime;
    			 
    		}
    		
    		//得到临时存储的有效路径
         	function getFilePath(){ 
 				var temporaryFilePathHidden = document.getElementById("temporaryFilePathHidden").value;  
 				var temporaryFilePathStr = temporaryFilePathHidden.substr(0,temporaryFilePathHidden.indexOf("/")+1);
 				document.getElementById("temporaryFilePath").value=temporaryFilePathStr;	
    		}
    		
    		//取消素材		
    		function goBack(){
    			window.location.href="adContentMgr_list.do";
    		}
    		
    		function goUpdate(){
    		
    		return true;
    		
    	 //   var resourceName = document.getElementById("resourceName").value;
    	//	var name = document.getElementById("name").value;
    	//	alert(name);
    	//	var temporaryFilePath = document.getElementById("temporaryFilePath").value;
    	//	alert("temporaryFilePath="+temporaryFilePath);
    		
    	//	if(resourceName == ""){
    	//		document.getElementById("resourceNameF").innerHTML ="资产名称不能为空！";
    	//		return false;
    	//	}else{
    	//		document.getElementById("resourceNameF").innerHTML ="";
    	//		if(name ==""){
    	//			document.getElementById("nameF").innerHTML ="视频名称不能为空！";
    	//			return false;
    	//		}else{
    	//			document.getElementById("nameF").innerHTML ="";
    	//			if(temporaryFilePath == ""){
    	//			   document.getElementById("temporaryFilePathF").innerHTML ="素材临时存储空间不能为空！"
    		//		   return false;
    			//	}else{
    			//		document.getElementById("temporaryFilePathF").innerHTML ="";
    			//		return true;
    			//		}
    			//	}
    			//}
    		//}
    		
    	 }
    		
    </script>
<script>
$(function(){   
    $("#bm").find("tr:even").addClass("treven");  //奇数行的样式
    $("#bm").find("tr:odd").addClass("trodd");  //偶数行的样式
});
</script>
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
<form action="adContentMgr_updateVideoMeta.do" method="post" name="adContentMgr_updateImageMeta" onsubmit="return goUpdate();"> 
<table cellpadding="0" cellspacing="0" border="0" width="100%">

	<tr>
		<td>
		<table cellpadding="0" cellspacing="0" border="0" width="100%"
			class="tab_right">
			<tr>
				<td>工作台</td>
				<td>客户</td>
				<td>日程行动</td>
				<td>销售机会</td>
				<td>订单管理</td>
				<td>客服中心</td>
				<td>财务中心</td>
				<td>营销中心</td>
				<td>人力资源中心</td>
				<td>数据统计</td>
				<td>信息门户管理</td>
			</tr>
		</table>
		</td>
	</tr>


	<tr>
		<td style="padding: 4px;">
		<table cellpadding="0" cellspacing="1" width="100%" class="tablea">
			<tr>
				<td class="formTitle" colspan="99"><span>视频素材修改</span></td>
			</tr>
			<tr>
				<input type=hidden value="${resource.id}" name="resource.id"/>
				<input type=hidden value="${resource.createTime}" name="resource.createTime"/>
				<input type=hidden value="${resource.operationId}" name="resource.operationId"/>
				<input type=hidden value="${resource.resourceType}" name="resource.resourceType"/>
				<input type=hidden value="${resource.resourceId}" name="resource.resourceId"/>
				<input type=hidden value="${resource.category}" name="resource.category"/>
				<input type=hidden value="${resource.state}" name="resource.state"/>
				<input type=hidden value="${resource.customerId}" name="resource.customerId"/>  
				<input type=hidden value="${resource.contractNumber}" name="resource.contractNumber"/>
				<input type=hidden value="${resource.startTime}" name="resource.startTime" id= "startTimeHidden"/>
				<input type=hidden value="${resource.endTime}" name="resource.endTime" id="endTimeHidden"/>
					
				<input type=hidden value="${videoMeta.id}" name="videoMeta.id"/>
				<input type=hidden value="${videoMeta.runTime}" name="videoMeta.runTime"/> 
				<input type=hidden value="${videoMeta.temporaryFilePath}" name="videoMeta.temporaryFilePath" id="temporaryFilePathHidden"/>
				
				<td class="td_label">内容分类：</td> 
			    <td class="td_input">&nbsp; <c:if test="${resource.category == 0}">公益</c:if><c:if test="${resource.category == 1}">商用</c:if></td>
				<td class="td_label">素材状态：</td>
				<td class="td_input">&nbsp;<c:if test="${resource.state == '0'}">待审核</c:if><c:if test="${resource.state == '1'}">审核未通过</c:if><c:if test="${resource.state == '2'}">上线</c:if><c:if test="${resource.state == '3'}">下线</c:if><c:if test="${resource.state == '4'}">审核待删除</c:if><c:if test="${resource.state == '5'}">审核已删除</c:if></td>
			</tr>
			<tr>
				<td class="td_label">视频时长：</td>
         		<td class="td_input">&nbsp;${videoMeta.runTime}&nbsp;&nbsp;&nbsp;<font style="color:red;">秒</font></td>
				<td class="td_label">所属广告位</td>
         		<td class="td_input">&nbsp;${positionName}</td>
			</tr>
			<tr>
				<td class="td_label">所属合同号：</td>
				<td class="td_input">&nbsp;${resource.contractNumber}</td>
				<td class="td_label">临时存储空间：</td>
				<td class="td_input"><input type="text" id="temporaryFilePath" class="e_input" value="${videoMeta.temporaryFilePath}" name="videoMeta.temporaryFilePath" id="temporaryFilePath" class="e_input" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/><font style="color:red;"><span id = "temporaryFilePathF"></span>*</font></td>
			</tr>
			<tr>
				<td class="td_label">资产名称：</td>
			    <td class="td_input"><input type="text" class="e_input" value="${resource.resourceName}" name="resource.resourceName" id="resourceName" class="e_input" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/><font style="color:red;"><span id = "resourceNameF"></span>*</font></td>
				<td class="td_label">视频名称：</td>
				<td class="td_input"><input type="text" class="e_input" value="${videoMeta.name}" name="videoMeta.name" id="name" class="e_input" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/><font style="color:red;"><span id = "nameF"></span>*</font></td>
			</tr>
			<tr>
				<td class="td_label">有效开始时间：</td> 
				<td class="td_input"><input type="text" class="e_input"  name="resource.startTime"  id="startTime" onclick="WdatePicker()" readOnly="true" class="e_input" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/><font style="color:red;"><span id = "resourceNameF"></span>*</font></td>
				<td class="td_label"></td>
				<td class="td_input"></td>
			</tr>
			<tr>
				<td class="td_label">有效结束时间：</td>
				<td class="td_input"><input type="text" class="e_input"  name="resource.endTime" id="endTime" class="e_input" onclick="WdatePicker()" readOnly="true" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/><font style="color:red;"><span id = "resourceNameF"></span>*</font></td>
				<td class="td_label" rowspan="3">视频简介：</td>
				<td class="td_input" rowspan="3"><font style='color:red;'>仅支持IE浏览器！如需播放，请单击开始按钮</font><embed src="${resourcePath}" height="255px" width="260px" autostart=false  loop=true type="application/x-vlc-plugin" version="VideoLAN.VLCPlugin.2" pluginspage="http://www.videolan.org"/></td>
			</tr>
			<tr>
				<td class="td_label">资产描述：</td>
				<td class="td_input">
					  <textarea id="" rows="8" cols="35" value="${resource.resourceDesc}" name="resource.resourceDesc">${resource.resourceDesc}</textarea>
				</td>
			</tr>
			<tr>
				<td class="td_label">审核意见：</td>
				<td class="td_input"><textarea id=""  readonly="true" rows="8" cols="35" value="${resource.examinationOpintions}" name="resource.examinationOpintions">${resource.examinationOpintions}</textarea></td>
			</tr>
			
			 <tr>
				<td class="formBottom" colspan="99" align="center">
					<input name="Submit"  type="submit" title="确定" value="确定"  onfocus=blur()/>
					<input type="button" title="返回"  value="返回"  onfocus=blur() id="bt1" onclick="goBack();"/>
				</td>
		</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
