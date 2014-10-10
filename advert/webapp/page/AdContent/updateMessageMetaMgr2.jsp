<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tags/c.tld"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/tags/fmt.tld" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/new/main.css">

<link rel="stylesheet" href="css/menu_right.css" type="text/css" />
<link rel="stylesheet" href="css/platform.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/css/popUpDiv.css" type="text/css" />
<link rel="stylesheet" href="<%=path %>/css/jquery/jquery.ui.all.css">
<script type="text/javascript" src="../../js/new/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/jquery/jquery-1.9.0.js"></script>
<title></title>

<style type="text/css">
        a{text-decoration:underline;}
</style>

<script language="Javascript1.1" src="../../js/avit.js"></script>
<script type="text/javascript">
	function goBack(){
    			window.location.href="adContentMgr_list.do";
    		}
	
           //页面加载时调用访法 
    	    window.onload=function(){
			  getStartTime();
			  getEndTime();
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
	
	function goUpdate(){
    			
    			var resourceName = document.getElementById("resourceName").value;
    			var contractNumber =  document.getElementById("contractNumber").value;  
    			var name =  document.getElementById("name").value;
    			var fileFormat =  document.getElementById("content").value;
    			
    			if(resourceName == ""){
    				document.getElementById("resourceNameF").innerHTML ="资产名称不能为空！";
    				return false;
    			}else{
					document.getElementById("resourceNameF").innerHTML ="";		
					if(contractNumber == ""){
						document.getElementById("contractNumberF").innerHTML ="所属合同号不能为空！";
						return false;
					}else{
						document.getElementById("contractNumberF").innerHTML ="";
						if(name == ""){
							document.getElementById("nameF").innerHTML ="文字名称不能为空！";
							return false;
						}else{
							document.getElementById("nameF").innerHTML ="";
							return true;
						}
					}
    			}
    		}
   
</script>



</head>

<body class="mainBody">
<div class="searchContent">
<form  action="adContentMgr_updateMessageMeta.do" method="post" name="adContentMgr_updateMesageMeta" onsubmit="return goUpdate();">
<table cellspacing="1" class="searchList">
  <tr class="title">
      <td align="center" colspan="4">文字资产信息修改</td>
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
	  <input type=hidden value="${messageMeta.id}" name="imageMeta.id"/>
	  <input type=hidden value="${messageMeta.content}" name="messageMeta.content"/>
      <td  align="right">资产分类：</td>
      <td >
      <c:if test="${resource.category == 0}">公益</c:if>
      <c:if test="${resource.category == 1}">商用</c:if>
      </td>
      
      <td  align="right">资产状态：</td>
      <td >
      <c:if test="${resource.state == '0'}">待审核</c:if>
      <c:if test="${resource.state == '1'}">审核未通过</c:if>
      <c:if test="${resource.state == '2'}">上线</c:if>
      <c:if test="${resource.state == '3'}">下线</c:if>
      <c:if test="${resource.state == '4'}">审核待删除</c:if>
      <c:if test="${resource.state == '5'}">审核已删除</c:if>
      </td>
  </tr>
  <tr>
      <td align="right">所属广告位：</td>
      <td>${positionName}</td>
      <td align="right">所属合同号：</td>
	  <td>${resource.contractNumber}</td>
  </tr>
  <tr>
      <td align="right">资产名称：</td>
      <td>
      <input type="text"  value="${resource.resourceName}" name="resource.resourceName" id="resourceName"  onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/>
      <font style="color:red;"><span id = "resourceNameF"></span>*</font>
      </td>
      <td align="right">文字名称：</td>
	  <td>
	  <input type="text"  value="${messageMeta.name}" name="messageMeta.name" id="name" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/>
	  <font style="color:red;"><span id = "nameF"></span>*</font>
	  </td>
  </tr>
  <tr>
      <td align="right">有效时间：</td>
      <td>
      <input type="text" name="resource.startTime" id="startTime" readOnly="true" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
      <font style="color:red;">*</font></td>
      <td align="right">失效时间：</td>
	  <td>
	  <input type="text" name="resource.endTime" id="endTime" readOnly="true" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	  <font style="color:red;">*</font>
	  </td>
  </tr>
  <tr>
      <td align="right">文字URL：</td>
      <td>
      <input type="text" value="${messageMeta.URL}" name="messageMeta.URL" onfocus="this.className='e_inputFocus'" onblur="this.className='e_input'"/>
      </td>
      <td align="right" >文字内容：</td>
	  <td ><textarea id="" rows="8" cols="35" readonly="true">${content}</textarea></td>
  </tr>
  
  <tr>
      <td align="right">资产描述：</td>
      <td><textarea id="" rows="8" cols="35" value="${resource.resourceDesc}" name="resource.resourceDesc">${resource.resourceDesc}</textarea></td>
      <td align="right">审核意见：</td>
	  <td><textarea id="" rows="8"  readonly="true" cols="35" value="${resource.examinationOpintions}" name="resource.examinationOpintions">${resource.examinationOpintions}</textarea></td>
  </tr>
  
  
  <tr>
      <td align="center" colspan="4">
      <c:if test="${resource.state == '2'}"><input type="submit" class="btn" value="保存" disabled="disabled"/></c:if>
      <c:if test="${resource.state != '2'}"><input type="submit" class="btn" value="保存" /></c:if>
		  <input type="button" class="btn" value="返回" onclick="goBack();"/>
      </td>
  </tr>
</table>
</form>
</div>
</body>
</html>