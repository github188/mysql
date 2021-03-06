<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/WEB-INF/tags/c.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link id="maincss"  rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/new/main.css" media="all"/>
<title></title>
 <script type='text/javascript' src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
 <script type='text/javascript' src='<%=request.getContextPath()%>/js/avit.js'></script>

<script type="text/javascript">

    function query() {   
    if(validateSpecialCharacterAfter(document.getElementById("adPositionQuery.positionName").value)){
			alert("广告位名称不能包括特殊字符！");
			return ;
		}
        document.forms[0].submit();
    }

   
	function selectPositin(positionCode,type,positionName,widthHeight,coordinate,backgroundPath,speId){
		
		parent.document.getElementById("material.positionCode").value=positionCode;
    	parent.document.getElementById("material.advertPositionName").value=positionName;
    	
    	parent.document.getElementById("sel_material_type").options.length = 0;
    	var json='';
    	$.ajax({
             type:"post",
             async : false,
             url:"<%=request.getContextPath()%>/dmaterial/getMateSpec.action",
             data:{'position.resourceType':type,
            	   'position.specificationId':speId
             },//Ajax传递的参数
             success:function(mess)
             {
                 json = eval('(' + mess + ')');
                
             },
             error:function(mess)
             {
             	alert("根据广告位获取视频规格失败");
             }
         });
    	
    	if (type == 0)
    	{
    		 parent.document.getElementById("sel_material_type").options.add(new Option("图片","0"));
           	if(json!=null){
           	    parent.document.getElementById("imageFileSize").value=json.fileSize;
           	    parent.document.getElementById("imageFileHigh").value=json.imageHeight;
           	    parent.document.getElementById("imageFileWidth").value=json.imageWidth;
           	    if(window.name=="defaultSelectAdPositionFrame"){
           	    	var mars = parent.document.getElementById("mars");
           	    	mars.innerHTML = "大小："+json.imageFileSize+"， 宽度："+json.imageFileWidth+" px，高度："+json.imageFileHigh+" px";
           	    }
           	}
    	}
    	
    	else if (type==1)
    	{
    	   parent.document.getElementById("sel_material_type").options.add(new Option("视频","1"));
    	   if(json!=null){
        	    parent.document.getElementById("videoFileDuration").value=json.duration;
        	}
    	}else if(type == 2){
    		parent.document.getElementById("sel_material_type").options.add(new Option("文字","2"));
    	}
    	
    	parent.window.changeType2();
		// 设置默认素材背景图片
		if(window.name=="defaultSelectAdPositionFrame"){
			var p = getContextPath()+"/"+backgroundPath;
			parent.document.getElementById("pImage1").src = p;
			parent.document.getElementById("pImage2").src = p;
			parent.document.getElementById("pImage3").src = p;
			parent.document.getElementById("pImage4").src = p;
		}
		//预览
    	preview(widthHeight,coordinate,backgroundPath);
        parent.easyDialog.close();
    }

	/**
	 * 预览
	 */
	function preview(widthHeight,coordinate,backgroundPath){
		/**为页面预览区域赋值*/
		var size = widthHeight.split('*');
		var width = size[0];
		var height = size[1];
		var coor = coordinate.split('*');
		
		
		$("#pImage",window.parent.document).attr("width",426).attr("height",240);
		
		$("#mImage",window.parent.document).attr("width",width).attr("height",height);
		$("#mImage,#video,#mImage4",window.parent.document).css({
			width:width+"px",
			height:height+"px",
			position:'absolute',
			left: coor[0]+"px", 
			top: coor[1]+"px" 
		});
		$("#video",window.parent.document).hide();
		parent.document.getElementById("videoWidth").value=width;
		parent.document.getElementById("videoHeight").value=height;
		
		$("#text",window.parent.document).css({
			position:'absolute',
			width:width+"px",
			height:height+"px",
			left:coor[0]+"px",
			top:coor[1]+"px",
			'z-index':1
		});
		$("#text2",window.parent.document).css({
			position:'absolute',
			width:width+"px",
			height:height+"px",
			left:coor[0]+"px",
			top:coor[1]+"px",
			'z-index':1
		});
	}

	/**
	 * 获取上下文路径
	 */ 
	function getContextPath() {
		var contextPath = document.location.pathname;
		var index = contextPath.substr(1).indexOf("/");
		contextPath = contextPath.substr(0, index + 1);
		delete index;
		return contextPath;
	}
    

    
    function cancle(){
    	
        parent.easyDialog.close();
    }

</script>
</head>

<body class="mainBody" >
<form action="<%=path %>/page/material/selectAdPosition.do" method="post" id="queryForm">
         <s:set name="page" value="%{adPositionPage}" />
		 <input type="hidden" id="pageNo" name="adPositionPage.pageNo" value="${page.pageNo}"/>
		 <input type="hidden" id="pageSize" name="adPositionPage.pageSize" value="${page.pageSize}"/>
		 <input type="hidden" id="adPositionQuery.contractId" name="adPositionQuery.contractId" value="${adPositionQuery.contractId}"/>
		 <input id="positionPackIds" name="positionPackIds" type="hidden" value="${positionPackIds}"/>
<div class="search" >
<div class="searchContent" >
<table cellspacing="1" class="searchList">
  <tr class="title">
    <td>查询条件</td>
  </tr>
  <tr>
    <td class="searchCriteria">
      <span>广告位名称：</span>
      <input type="text" name="adPositionQuery.positionName" id="adPositionQuery.positionName" value="${adPositionQuery.positionName}"/>
                 
        <input type="button" value="查询" onclick="javascript:query();" class="btn"/></td>
  </tr>
</table>

<table cellspacing="1" class="searchList">
    <tr class="title">
        <td height="10" class="dot">选项</td>
        <td width="20%" align="center">广告位名称</td>
        <td width="15%" align="center">广告位编码</td>
        <td width="20%" align="center">广告位类型</td>
        <td width="20%" align="center">素材类型</td>
        <td width="20%" align="center">高标清</td>
    </tr>
       
           <c:if test="${adPositionPage.dataList != null && fn:length(adPositionPage.dataList) > 0}">
                    <c:forEach items="${adPositionPage.dataList}" var="adPositionPageInfo" varStatus="pc">
               <tr <c:if test="${pc.index%2==1}">class="sec"</c:if>>
                   <td>
                       <input type="radio" value="${adPositionPageInfo.positionCode}"  id="adPositionPageInfo.locationId" onclick="selectPositin('${adPositionPageInfo.positionCode}','${adPositionPageInfo.resourceType}','${adPositionPageInfo.positionName}','${adPositionPageInfo.domain}','${adPositionPageInfo.coordinate}','${adPositionPageInfo.backgroundPath}','${adPositionPageInfo.specificationId}')"/>
                   </td>
                   <td>
                       ${adPositionPageInfo.positionName}
                     </td>
                    <td>
                        ${adPositionPageInfo.positionCode}
                    </td>
                    <td>
                        <c:choose>
								<c:when test="${adPositionPageInfo.positionType==1}">
												单向实时广告
								</c:when>
								<c:when test="${adPositionPageInfo.positionType==2}">
												单向非实时广告
								</c:when>
								<c:when test="${adPositionPageInfo.positionType==3}">
												字幕类广告
								</c:when>
								<c:otherwise>
												未知
								</c:otherwise>
						</c:choose>
                    </td>
                    <td>
                        <c:choose>
								<c:when test="${adPositionPageInfo.resourceType==0}">
												图片
								</c:when>
								<c:when test="${adPositionPageInfo.resourceType==1}">
												视频
								</c:when>
								<c:when test="${adPositionPageInfo.resourceType==2}">
												文字
								</c:when>
								<c:otherwise>
												未知
								</c:otherwise>
						</c:choose>
                    </td>
                   <td>
                	    <c:choose>
								<c:when test="${adPositionPageInfo.isHd==0}">
												标清
								</c:when>
								<c:when test="${adPositionPageInfo.isHd==1}">
												高清
								</c:when>
								<c:otherwise>
												未知
								</c:otherwise>
						</c:choose>
               </tr>
           </c:forEach>
       </c:if>
        <tr>
		   <td colspan="7">
             <input type="button" class="btn" value="返 回" onclick="cancle();" />
             <jsp:include page="../../../common/page.jsp" flush="true" />
	       </td>
	    </tr>
   </table>
   
   </div>
</div>
</form>
</body>
</html>