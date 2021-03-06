<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="/WEB-INF/tags/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tags/fmt.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type='text/javascript' src="<%=path%>/js/new/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/new/main.css" />
<script type='text/javascript' src='<%=path %>/js/new/avit.js'></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=path%>/js/order/preview.js"></script>
<script type="text/javascript" src="<%=path%>/js/order/common.js"></script>
<title>新增订单</title>
<style>
	.ggw {
		width: 100%;
		height: 68px;
	}
	.ggw li {
		background: #efefef;
		font-weight: bold;
		width: 100%;
		height: 25px;
	}
	.e_input_add {
		background:url(<%=path%>/images/add.png) right no-repeat #ffffff;
	}
	
	.e_input_time{
		background:url(<%=path%>/js/new/My97DatePicker/skin/datePicker.gif) right no-repeat #ffffff;
	}
</style>
<script type="text/javascript">
	var contractId = -1;
	var ployId = -1;
	var validMinDate = '2010-01-01';//广告位投放开始日期
	var validMaxDate = '2099-01-01';//广告位投放结束日期
	var ployStartTime = '';//策略开始时间
	var ployEndTime = '';//策略结束时间
	var deliveryMode = 1;//投放方式
	var selResource = '';//选择的素材
	var aheadTime=0; //提前量
	var playNumber = 0;//按次播放次数
	var ployNumber = 1;//分策略或基本策略加精准总数
	var orderId=-1;
	var previewValue;
	function init(time){
		aheadTime = time;
		showOrderResource('${order.dposition.positionCode}','${order.orderCode}');
		$("#periodDate").show();
	}

	/**
	*  进入弹出页面前，先检查会话是否过期
	*/
	function showContent(content,pId){
    	$.ajax({   
 	       url:'checkSession.do',       
 	       type: 'POST',    
 	       dataType: 'text',   
 	       data: {
 		   },                   
 	       timeout: 1000000000,                              
 	       error: function(){                      
 	    		alert("系统错误，请联系管理员！");
 	       },    
 	       success: function(result){
 	    	   if(result=='0'){
 	    		  if(content == 'contract'){
 	    			 showContract();
 	 	    	  }else if(content == 'position'){
 	 	    		showPosition();
 	 	    	  }else if(content == 'ploy'){
 	 	    		showPloy();
 	 	    	  }else if(content == 'resource'){
 	 	    		showResource(pId);
 	 	    	  }
 	    	   }else{
 	 	    	   //会话已经过期
 	    		  window.location.href=getContextPath()+'/tset/timeoutPage.jsp'
 	 	    	}	    	   
 		   }  
 		}); 
    }
    
	//选择合同
	function showContract(){
		var url = "showContractList.do?order.contractId="+contractId;
		var contractValue = window.showModalDialog(url, window, "dialogHeight=480px;dialogWidth=820px;center=1;resizable=0;status=0;");
		if(contractValue){
			if(contractId != contractValue.split("_")[0]){
				contractId = contractValue.split("_")[0];
				$("#contractId").val(contractId);
				$("#contractName").val(contractValue.split("_")[1]);
				document.getElementById("contractName").style.borderColor="";
	        	document.getElementById("contract_error").innerHTML = "";
	        	$("#positionId").val("");
				$("#positionName").val("");
				$("#ployId").val("");
				$("#ployName").val("");
				$("#startDate").val("");
				$("#startDate2").val("");
				$("#endDate").val("");
				$("#selResource").val("");
				positionId = -1;
				ployId = -1;
			}
        }
	}

	//选择广告位
    function showPosition(){
    	contractId = document.getElementById("contractId").value;
    	if(!contractId || contractId==-1){
        	document.getElementById("contractName").style.borderColor="red";
        	document.getElementById("contract_error").innerHTML = "合同不能为空";
    		return;
    	}
    	
		document.getElementById("positionCode").style.borderColor="";
       	document.getElementById("position_error").innerHTML = "";
       	$("#ployId").val("");
		$("#ployName").val("");
		$("#startDate").val("");
		$("#startDate2").val("");
		$("#endDate").val("");
		$("#selResource").val("");
		$("[name=order\\.isDefault]:checkbox").attr("checked", false);
		$("#isDefault").hide();
		ployId = -1;
		var positionCode = document.getElementById("positionCode").value;
		if(positionCode == '01202'){
			$("#isDefault").show();
		}
				
       
    }

    //选择策略
    function showPloy(){
    	var positionCode = $("#positionCode").val();
    	if(!positionCode){
        	document.getElementById("positionCode").style.borderColor="red";
        	document.getElementById("position_error").innerHTML = "广告位不能为空";
    		return;
    	}
    	var ployId = document.getElementById("ployId").value;
    	var url = "queryDPloyList.action?ploy.dposition.positionCode="+positionCode;
    	var value = window.showModalDialog(url, window, "dialogHeight=480px;dialogWidth=820px;center=1;resizable=0;status=0;");
    	
    	var orderId=${order.orderCode};
        if(value){
            if(ployId != value.split("|")[0]){
            	ployId = value.split("|")[0];
            	ployName = value.split("|")[1];
            	var count = value.split("|")[2];
            	if($("[name=order\\.isDefault]:checkbox").is(":checked")){
            		count = 1;
            	}else{
            		$("#isDefault").hide();
            	}
            	var mainPloy = value.split("|")[3];
	        	$("#ployId").val(ployId);
				$("#ployName").val(ployName);
			
				$("#periodDate").show();
				$("#onceDate").hide();
				
				var orderCode = document.getElementById("orderCode").value;
				$.ajax({   
		 		       url:'insertDOrderMateRelTmp.action',       
		 		       type: 'POST',    
		 		       dataType: 'text',   
		 		       data: {
		 		    	   'order.orderCode':orderCode,
		 		    	   'order.dploy.id':ployId,
		 		    	   'order.dposition.mainPloy':mainPloy,
		 		    	   'order.dposition.resourceCount':count
		 				},                   
		 		       timeout: 1000000000,                              
		 		       error: function(){                      
		 		    		alert("系统错误，请联系管理员！");
		 		       },    
		 		       success: function(result){ 
		 		    	   if(result == '-1'){
		 		    		  alert("系统错误，请联系管理员！");
		 		    	   }
		 			   }  
		 		   });
		 		   document.getElementById("ployName").style.borderColor="";
      			   document.getElementById("ploy_error").innerHTML = "";
                   hidDetails();
            }
        }
        
    }
     

    /**
    * 选择订单日期
    */
    function selectDate(){
    	var ahead = 0;
    	if(deliveryMode==0){
    		ahead =  parseInt(aheadTime)*1000;
    	}
    	var now = Date.parse(new Date())+ahead;
    	var vStartDate = Date.parse(validMinDate.replace(/-/g,"/"));
    	//当前时间大于投放开始时间，则订单开始时间只能选择大于当前时间，否则订单开始时间从投放开始时间选择
    	var tmp = '#';
    	if(now > vStartDate){
    		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-'+tmp+'{%d}',maxDate:validMaxDate});
    	}else{
    		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:validMinDate,maxDate:validMaxDate});
    	}
    }

    /**
     * 保存订单
     */
    function saveOrder(){
    	if(checkFormNotNull()&&checkOrderDate()){
    		if(!playNumber || playNumber<=0){
    			$("#startTime").val($("#startDate").val())
        	}else{
        		$("#startTime").val($("#startDate2").val())
            }
    		var startDate = $("#startDate").val();
    		var endDate = $("#endDate").val();
    		var positionCode = $("#positionCode").val();
    		var orderCode = $("#orderCode").val();
    		$.ajax({   
   		       url:'checkDOrderRule.action',       
   		       type: 'POST',    
   		       dataType: 'text',   
   		       data: {
	   				'order.startDate':startDate,
	   				'order.endDate':endDate,
	   				'order.dposition.positionCode':positionCode,
	   				'order.orderCode':orderCode
   			   },                   
   		       timeout: 1000000000,                              
   		       error: function(){                      
   		    		alert("系统错误，请联系管理员！");
   		       },    
   		       success: function(result){ 
   		    	   if(result!='-1'){
   			    	   if(result=='0'){
   			    			$("#saveForm").submit();
   			    			
   			    	   }else if(result =='1'){
   			    		   alert("订单对应区域在日期范围与已有订单冲突，订单创建失败！");
   			    	   }
   		    	   }else{
   			    		alert("系统错误，请联系管理员！");
   		    	   }
   		    	   
   			   }  
   		   }); 
    		
    	}
	}
	function repush(orderCode){
	$.ajax({   
		       url:'repushOrder.action',       
		       type: 'POST',    
		       dataType: 'text',   
		       data: {
				'order.orderCode':orderCode,				
				},                   
		       timeout: 1000000000,                              
		       error: function(){                      
		    		alert("系统错误，请联系管理员！");
		       },    
		       success: function(result){ 
		    	   if(result=='0'){
		    		   alert('重新投放成功！');
		    		  window.location.href='queryDOrderList.action';
		    	   }else if(result=="-1"){
		    		   alert("系统错误，请联系管理员！");   		   
		    	   }else{
		    		   alert(result);
		    	   }
			   }  
		   }); 
	}

    /**
     * 检查输入项是否符合要求
     * */
    function checkFormNotNull(){
    	if(isEmpty($("#contractId").val())){
    		alert("请选择合同！");
    		$("#contractId").focus();
    		return false;
    	}
    	if(isEmpty($("#positionCode").val())){
    		alert("请选择广告位！");
    		$("#positionCode").focus();
    		return false;
    	}
    	if(isEmpty($("#ployId").val())){
    		alert("请选择策略！");
    		$("#ployId").focus();
    		return false;
    	}

    	if(!playNumber || playNumber<=0){
    		if(isEmpty($("#startDate").val())){
        		alert("请选择开始日期！");
        		$("#startDate").focus();
        		return false;
        	}
	    	if(isEmpty($("#endDate").val())){
	    		alert("请选择结束日期！");
	    		$("#endDate").focus();
	    		return false;
	    	}
    	}else{
    		if(isEmpty($("#startDate2").val())){
        		alert("请选择开始日期！");
        		$("#startDate2").focus();
        		return false;
        	}
        }
    	
    	if(!isEmpty($("#desc").val()) && $("#desc").val().length>120){
    		alert("订单描述长度必须在0-120字之间！");
    		$("#desc").focus();
    		return false;
    	}
    	if(validateSpecialCharacterAfter($("#desc").val())){
			alert("订单描述不能包括特殊字符！");
			$("#desc").focus();
			return false;
		}
		
    	if($("#sucai").find("tr").length < 2){
    		alert("请为策略绑定素材！");
    		return false;
    	}
    	return true;
    }
    
     //选择素材
    function addResouce(){
    	positionCode = document.getElementById("positionCode").value;
    	ployId = document.getElementById("ployId").value;
    	var orderCode = document.getElementById("orderCode").value;
    	if(!ployId || ployId==-1){
        	document.getElementById("ployName").style.borderColor="red";
        	document.getElementById("ploy_error").innerHTML = "策略不能为空";
    		return;
    	}
    	var url = "queryDOrderMateRelTmp.action?omrTmp.orderCode="+orderCode+"&order.dposition.positionCode="+positionCode;
    	window.showModalDialog(url, window, "dialogHeight=580px;dialogWidth=820px;center=1;resizable=0;status=0;");
    	showOrderResource(positionCode,orderCode);
    	//showAreaResource(ployId,'${order.orderCode}',positionCode);  
    }
    function showOrderResource(positionCode,orderCode){
    	$.ajax({   
   		       url:'getOrderResourceJson.action',       
   		       type: 'POST',    
   		       dataType: 'text',   
   		       data: {
	   				'omrTmp.orderCode':orderCode
   			   },                   
   		       timeout: 1000000000,                              
   		       error: function(){                      
   		    		alert("系统错误，请联系管理员！");
   		       },    
   		       success: function(result){ 
   		    	   if(result!=""){
   			    	   var json=eval("("+result+")");
					    var str="<tr><td>策略详情</td><td>素材</td><td>操作</td></tr>";
					    if(result==null||json==null){
							   return;
						}
					   for(var i = 0;i<json.length;i++){
					        var obj = json[i];
						    str+="<tr><td><a style='diplay:block;float:left' href=javascript:showOrderResourceDetail("+orderCode+","+obj.id+")>详情</a></td>"+
							 	 "<td>"+obj.resourceName+"</td>"+
						   		 "<td><a style='diplay:block;float:left' href=javascript:showDtmbSource('"+positionCode+"',"+obj.id+")>预览</a></td></tr>";
						   		 
					   }
					   $("#sucai").html(str);
   		    	   }else{
   			    		alert("系统错误，请联系管理员！");
   		    	   }
   		    	   
   			   }  
   		   }); 
    }
    function showOrderResourceDetail(orderCode, resourceId){
    
    	var url = "queryDOrderMateRelTmp.action?omrTmp.orderCode="+orderCode+"&omrTmp.resource.id="+resourceId;
    	window.showModalDialog(url, window, "dialogHeight=580px;dialogWidth=820px;center=1;resizable=0;status=0;");
    }
    function showDtmbSource(positionCode,resourceId){
    	var url = "previewResource.action?resource.positionCode="+positionCode+"&resource.id="+resourceId;
    	window.showModalDialog(url, window, "dialogHeight=245px;dialogWidth=428px;center=1;resizable=0;status=0;");
    }
    
    /**
     * 检查开始时间和结束时间是否符合要求
     * */
    function checkOrderDate(){
    	var start = $("#startDate").val();
    	var end = $("#endDate").val();
    	var ahead = 0;
    	if(deliveryMode==0){
    		ahead =  parseInt(aheadTime)*1000;
    	}
    	
    	var startTime=Date.parse(start.replace(/-/g, "/")+" "+ployStartTime);
        var endTime=Date.parse(end.replace(/-/g, "/")+" "+ployEndTime);
        var now = Date.parse(new Date())+ahead; 
        
        var startDate = Date.parse(start.replace(/-/g,"/"));
        var endDate = Date.parse(end.replace(/-/g,"/"));
        var vStartDate = Date.parse(validMinDate.replace(/-/g,"/"));
        var vEndDate = Date.parse(validMaxDate.replace(/-/g,"/"));
        
       if(endTime<startTime)
       {
           alert("订单结束时间不能小于开始时间！");
           return false;
       }
       
       if(startDate<vStartDate||endDate>vEndDate){
    	   alert("订单日期超出合同范围，合同日期范围是"+vStart.replace(" 00:00:00","")+"~"+vEnd.replace(" 00:00:00",""));
    	   return false;
       }
       return true;
    }

</script>
</head>

<body class="mainBody" onload='init(${orderOpAheadTime});'>
<form action="saveDOrder.action" method="post" id="saveForm">
<input type="hidden" name="order.id" id="selResource" value="${order.id }" />
<input type="hidden" id="orderState" name="order.state" value="${order.state }" />
<input type="hidden" id="customerId" name="order.customer.id" value="${order.customer.id }" />
<div class="detail">
<table cellspacing="1" class="searchList" align="left">
	<tr class="title">
		<td colspan="4">订单添加</td>
	</tr>
	<c:if test="${roleType == 1}">
	<!-- 广告商 -->
	<tr>
		<td width="12%" align="right">订单号：</td>
		<td width="33%"><input type="hidden" id="orderCode" name="order.orderCode" value="${order.orderCode}" /> ${order.orderCode}</td>
		<td width="12%" align="right"><span class="required">*</span>合同名称：</td>
		<td width="33%">
			<input id="contractName" name="order.contractName" class="e_input_add" readonly="readonly" type="text" onclick="showContent('contract',null);"/>
			<input type="hidden" id="contractId" name="order.contract.id" />
			<span id="contract_error"></span>
		</td>
	</tr>
	</c:if>
	<c:if test="${roleType == 2}">
	<!-- 运营商 -->
	<tr>
		<td width="12%" align="right">订单号：</td>
		<td colspan="3"><input type="hidden" id="orderCode" name="order.orderCode" value="${order.orderCode}" /> ${order.orderCode}</td>
		<input type="hidden" id="contractId" name="order.contract.id" value="0"  />
	</tr>
	</c:if>
	<tr>
		<td align="right"><span class="required">*</span>广告位名称：</td>
		<td>
			
			<c:if test="${empty order.id }">
				<select id="positionCode" name="order.dposition.positionCode" onchange="showContent('position',null);">
					<option value="">--请选择--</option>
					<c:forEach items="${dpositionList }" var="position">
						<option value="${position.positionCode }">${position.positionName }</option>
					</c:forEach>
				</select>
				<span style="display:none" id="isDefault">
					是否默认:<input type="checkbox" value="1" name="order.isDefault"/>
				</span>
			</c:if>
			<c:if test="${not empty order.id }">
				<input type="hidden" id="positionCode" name="order.dposition.positionCode" value="${order.dposition.positionCode }"/>
				<c:out value="${order.dposition.positionName }"/>
			</c:if>
			<span id="position_error"></span>
		</td>
		<td align="right"><span class="required">*</span>策略名称：</td>
		<td>
			<c:choose>
				<c:when test="${empty order.state || order.state=='0' || order.state =='3' }">
					<input id="ployName" name="order.dploy.ployName" value="${order.dploy.ployName }" class="e_input_add" readonly="readonly" type="text" onclick="showContent('ploy',null);" />
				</c:when>
				<c:otherwise><c:out value="${order.dploy.ployName }"/></c:otherwise>
			</c:choose>
			<input type="hidden"  id="ployId" name="order.dploy.id" value="${order.dploy.id}"/>
			<span id="ploy_error"></span>
		</td>
	</tr>
	
	<tr id="periodDate" style="display: none">
		<td align="right"><span class="required">*</span>开始日期：</td>
		<td>
		<c:choose>
			<c:when test="${empty order.state || order.state=='0' || order.state =='3' }">
				<input type="text" name="order.startDate" readonly="readonly"  class="e_input_time" id="startDate"	value='<fmt:formatDate type="date" value="${order.startDate }"/>' onclick="selectDate();"/>
			</c:when>
			<c:otherwise><input type="hidden" name="order.startDate" id="startDate"	value='<fmt:formatDate type="date" value="${order.startDate }"/>'"/><fmt:formatDate type="date" value="${order.startDate }"/></c:otherwise>
		</c:choose>
		</td>
		<td align="right"><span class="required">*</span>结束日期：</td>
		<td>
		<c:choose>
			<c:when test="${order.state eq '7' or order.state eq '9'}">
				<input type="hidden" name="order.endDate" id="endDate"	value='<fmt:formatDate type="date" value="${order.endDate }"/>'"/><fmt:formatDate type="date" value="${order.endDate }"/>
			</c:when>
			<c:otherwise>
				<input type="text" name="order.endDate" readonly="readonly" class="e_input_time" id="endDate" value='<fmt:formatDate type="date" value="${order.endDate }"/>' onclick="selectDate();"/>	
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	
	<tr id="onceDate" style="display: none">
		<td align="right"><span class="required">*</span>开始日期：</td>
		<td><input type="text" readonly="readonly"  class="e_input_time" id="startDate2" onclick="selectDate();"/></td>
		<td align="right">播放次数：</td>
		<td>
			<input type="text" id="viewPlayNumber" disabled="disabled"/>
			<input type="hidden" id="playNumber" name="order.playNumber" />
		</td>
	</tr>
	<c:if test="${not empty order.state }">
		<tr>
			<td align="right"><span>订单状态:</span></td>
			<td colspan="3">
				<c:if test="${order.state==0 }">【未发布订单】待审核</c:if>
				<c:if test="${order.state==1}">【修改订单】待审核</c:if>
				<c:if test="${order.state==2}">【删除订单】待审核</c:if>
				<c:if test="${order.state==3}">【未发布订单】审核不通过</c:if>
				<c:if test="${order.state==4}">【修改订单】审核不通过</c:if>
				<c:if test="${order.state==5}">【删除订单】审核不通过</c:if>
				<c:if test="${order.state==6}">已发布</c:if>
				<c:if test="${order.state==7}">执行完毕</c:if>
				<c:if test="${order.state==9}">投放失败</c:if>
			</td>
		</tr>
	</c:if>
	<tr>
		<td align="right">订单描述：</td>
		<td colspan="3"><textarea id="desc" name="order.description" cols="50" rows="3"></textarea> <span class="required">(长度在0-120字之间)</span></td>
	</tr>
		<tr>
		    <td colspan="3" class="yulan"><span
				style="display: block; width: 500px;">策略绑定素材信息:</span>
			</td>
			<td>
				<c:if test="${empty order.state || order.state=='0' || order.state =='3' }">
					<input type="button" onclick="addResouce();" class="btn" value="新增绑定" />
				</c:if>
				<c:if test="${order.state eq '9' }">
					<input type="button" onclick="repush(${order.orderCode});" class="btn" value="重新投放" />
				</c:if>
			</td>
	   </tr>
	        <table name="sucai" id="sucai"  width="100%" cellspacing="1" class="searchList">
	        	<tr><td>策略详情</td><td>素材</td><td>操作</td></tr>
	        </table>
</table>
<div style="margin-left:50px;">
	<c:if test="${order.state ne '7'and order.state ne '9' }">
		<input type="button" onclick="saveOrder();" class="btn" value="确认" />
	</c:if> &nbsp;&nbsp; 
	<input type="button" onclick="javascript:history.back(-1);" class="btn" value="取消" />
</div>
</div>

</form>
</body>
</html>