<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<link rel="stylesheet" href="css/layout/accordion.css" type="text/css"/>

<script type="text/javascript" src="js/jquery/jquery-1.3.1.js"></script>
<script type="text/javascript" src="js/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="js/jquery/ui/jquery-ui-1.7.2.custom.js"></script>  


<script type="text/javascript">
	var tb_pathToImage = "images/thickbox/loadingAnimation.gif";
	$(document).ready(function () { 
		$("#accordion").accordion("resize");
		$("#accordion").accordion({
			fillSpace: true
		});
	}); 
</script>
<style>
.ainput{ width:70px;}
</style>
<style type="text/css"> 
    *{ margin:0; padding:0;    list-style:none;} 
    body { margin-left:0px; font-size:12px;} 
    h2 { font-family:"黑体"; font-size:24px; text-align:center; line-height:32px;} 
    h5 { font-size:12px; text-align:center; font-weight:normal; color:#666; line-height:28px;}
	#nav{ margin:0px; padding:0px; width:170px; } 
    #nav a { text-decoration:none;color:#06c; font-size:12px; line-height:24px;} 
	#nav a:hover { color:#428EFF;text-decoration:underline; }
    #nav ul{ margin-left:15px;} 
    #nav strong{ color:#696;} 
    #nav.dyn li ul{ display:block;} 
    #nav.dyn li ul.show{ display:none;} 
    #nav.dyn li{ padding-left:15px;} 
    #nav.dyn li.parent{    background:url(images/user_23.gif) 5px -34px no-repeat;} 
    #nav.dyn li.open{ background:url(images/user_23.gif) 5px 10px no-repeat;}
	img{ border:0px;} 
    </style> 
</head>
<script type="text/javascript">
    DOMhelp = {
        debugWindowId: 'DOMhelpdebug',
        init: function() {
            if (!document.getElementById || !document.createTextNode) { return; }
        },
        lastSibling: function(node) {
            var tempObj = node.parentNode.lastChild;
            while (tempObj.nodeType != 1 && tempObj.previousSibling != null) {
                tempObj = tempObj.previousSibling;
            }
            return (tempObj.nodeType == 1) ? tempObj : false;
        },
        firstSibling: function(node) {
            var tempObj = node.parentNode.firstChild;
            while (tempObj.nodeType != 1 && tempObj.nextSibling != null) {
                tempObj = tempObj.nextSibling;
            }
            return (tempObj.nodeType == 1) ? tempObj : false;
        },
        getText: function(node) {
            if (!node.hasChildNodes()) { return false; }
            var reg = /^\s+$/;
            var tempObj = node.firstChild;
            while (tempObj.nodeType != 3 && tempObj.nextSibling != null || reg.test(tempObj.nodeValue)) {
                tempObj = tempObj.nextSibling;
            }
            return tempObj.nodeType == 3 ? tempObj.nodeValue : false;
        },
        setText: function(node, txt) {
            if (!node.hasChildNodes()) { return false; }
            var reg = /^\s+$/;
            var tempObj = node.firstChild;
            while (tempObj.nodeType != 3 && tempObj.nextSibling != null || reg.test(tempObj.nodeValue)) {
                tempObj = tempObj.nextSibling;
            }
            if (tempObj.nodeType == 3) { tempObj.nodeValue = txt } else { return false; }
        },
        createLink: function(to, txt) {
            var tempObj = document.createElement('a');
            tempObj.appendChild(document.createTextNode(txt));
            tempObj.setAttribute('href', to);
            return tempObj;
        },
        createTextElm: function(elm, txt) {
            var tempObj = document.createElement(elm);
            tempObj.appendChild(document.createTextNode(txt));
            return tempObj;
        },
        closestSibling: function(node, direction) {
            var tempObj;
            if (direction == -1 && node.previousSibling != null) {
                tempObj = node.previousSibling;
                while (tempObj.nodeType != 1 && tempObj.previousSibling != null) {
                    tempObj = tempObj.previousSibling;
                }
            } else if (direction == 1 && node.nextSibling != null) {
                tempObj = node.nextSibling;
                while (tempObj.nodeType != 1 && tempObj.nextSibling != null) {
                    tempObj = tempObj.nextSibling;
                }
            }
            return tempObj.nodeType == 1 ? tempObj : false;
        },
        initDebug: function() {
            if (DOMhelp.debug) { DOMhelp.stopDebug(); }
            DOMhelp.debug = document.createElement('div');
            DOMhelp.debug.setAttribute('id', DOMhelp.debugWindowId);
            document.body.insertBefore(DOMhelp.debug, document.body.firstChild);
        },
        setDebug: function(bug) {
            if (!DOMhelp.debug) { DOMhelp.initDebug(); }
            DOMhelp.debug.innerHTML += bug + '\n';
        },
        stopDebug: function() {
            if (DOMhelp.debug) {
                DOMhelp.debug.parentNode.removeChild(DOMhelp.debug);
                DOMhelp.debug = null;
            }
        },
        getKey: function(e) {
            if (window.event) {
                var key = window.event.keyCode;
            } else if (e) {
                var key = e.keyCode;
            }
            return key;
        },
        /* helper methods */
        getTarget: function(e) {
            var target = window.event ? window.event.srcElement : e ? e.target : null;
            if (!target) { return false; }
            while (target.nodeType != 1 && target.nodeName.toLowerCase() != 'body') {
                target = target.parentNode;
            }
            return target;
        },
        stopBubble: function(e) {
            if (window.event && window.event.cancelBubble) {
                window.event.cancelBubble = true;
            }
            if (e && e.stopPropagation) {
                e.stopPropagation();
            }
        },
        stopDefault: function(e) {
            if (window.event && window.event.returnValue) {
                window.event.returnValue = false;
            }
            if (e && e.preventDefault) {
                e.preventDefault();
            }
        },
        cancelClick: function(e) {
            if (window.event) {
                window.event.cancelBubble = true;
                window.event.returnValue = false;
            }
            if (e && e.stopPropagation && e.preventDefault) {
                e.stopPropagation();
                e.preventDefault();
            }
        },
        addEvent: function(elm, evType, fn, useCapture) {
            if (elm.addEventListener) {
                elm.addEventListener(evType, fn, useCapture);
                return true;
            } else if (elm.attachEvent) {
                var r = elm.attachEvent('on' + evType, fn);
                return r;
            } else {
                elm['on' + evType] = fn;
            }
        },
        cssjs: function(a, o, c1, c2) {
            switch (a) {
                case 'swap':
                    o.className = !DOMhelp.cssjs('check', o, c1) ? o.className.replace(c2, c1) : o.className.replace(c1, c2);
                    break;
                case 'add':
                    if (!DOMhelp.cssjs('check', o, c1)) { o.className += o.className ? ' ' + c1 : c1; }
                    break;
                case 'remove':
                    var rep = o.className.match(' ' + c1) ? ' ' + c1 : c1;
                    o.className = o.className.replace(rep, '');
                    break;
                case 'check':
                    var found = false;
                    var temparray = o.className.split(' ');
                    for (var i = 0; i < temparray.length; i++) {
                        if (temparray[i] == c1) { found = true; }
                    }
                    return found;
                    break;
            }
        },
        safariClickFix: function() {
            return false;
        }
    }
    DOMhelp.addEvent(window, 'load', DOMhelp.init, false);
</script> 
<script type="text/javascript"> 
<!--
    sn = {
        dynamicClass: 'dyn',
        showClass: 'show',
        parentClass: 'parent',
        openClass: 'open',
        navID: 'nav',
        init: function() {
            var triggerLink;
            if (!document.getElementById || !document.createTextNode) { return; }
            var nav = document.getElementById(sn.navID);
            if (!nav) { return; }
            DOMhelp.cssjs('add', nav, sn.dynamicClass);
            var nested = nav.getElementsByTagName('ul');
            for (var i = 0; i < nested.length; i++) {
                triggerLink = nested[i].parentNode.getElementsByTagName('a')[0];
                DOMhelp.cssjs('add', triggerLink.parentNode, sn.parentClass);
                DOMhelp.addEvent(triggerLink, 'click', sn.changeSection, false);
                triggerLink.onclick = DOMhelp.safariClickFix;
                if (nested[i].parentNode.getElementsByTagName('strong').length > 0) {
                    DOMhelp.cssjs('add', triggerLink.parentNode, sn.openClass);
                    DOMhelp.cssjs('add', nested[i], sn.showClass);
                }
            }
        },
        changeSection: function(e) {
            var t = DOMhelp.getTarget(e);
            var firstList = t.parentNode.getElementsByTagName('ul')[0];
            if (DOMhelp.cssjs('check', firstList, sn.showClass)) {
                DOMhelp.cssjs('remove', firstList, sn.showClass)
                DOMhelp.cssjs('swap', t.parentNode, sn.openClass, sn.parentClass);
            } else {
                DOMhelp.cssjs('add', firstList, sn.showClass)
                DOMhelp.cssjs('swap', t.parentNode, sn.openClass, sn.parentClass);
            }
            DOMhelp.cancelClick(e);
        }
    }
    DOMhelp.addEvent(window, 'load', sn.init, false); 
--> 
</script> 

<script language="JavaScript">
function show(i){     
if (i.style.display == "none") {     
		i.style.display = "";     
	}else{     
		i.style.display = "none";     
	}     
}	     
function checkTeacher(t){
	var teachers=document.getElementsByName("teacher");
	var I2=window.parent.document.frames["I2"];
	if(t.id=="teacher_all"){
		for(var i=0;i<teachers.length;i++){
			if(t.checked&&!teachers.checked){
				teachers[i].checked=true;
				I2.document.getElementById("teacher_"+(i+1)).style.display = "";
			}else{
				teachers[i].checked=false;
				I2.document.getElementById("teacher_"+(i+1)).style.display = "none";
			}
		}
	}else{
		if(t.checked){
			I2.document.getElementById(t.id).style.display = "";
		}else{
			I2.document.getElementById(t.id).style.display = "none";
		}
	}
}
</script>
<body>
<div style=" width:216px; height:29px;"><img src="images/bar_top1.jpg" alt="" /></div>
<div class="menuArea">
    <div id="accordion" class="menu">
    	<a href="#" class="menu-title" onfocus="blur();">广告资产管理</a>
		<div class="menu-item">
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li><a href="<%=path %>/page/position/queryPositionPage.do?method=queryPage" target="main_frame">广告位管理</a></li>
						<li><a href="<%=path %>/page/AdContent/adContentMgr_list.do" target="main_frame">资产管理</a></li>
						<li><a href="<%=path %>/material/toUploaldFile.do" target="main_frame">上传素材</a></li>
						<li><a href="<%=path %>/page/questionnaire/listQuestionnaire.do" target="main_frame">调查问卷管理</a></li>
						<li><a href="<%=path %>/page/AdContent/adContentMgr_listAuditMetas.do" target="main_frame">运营商素材审核</a></li>
						<li><a href="<%=path %>/page/AdContent/adContentMgr_listReal.do" target="main_frame">运营商资产管理</a></li>
						<li><a href="<%=path %>/page/ReleaseArea/ReleaseArea_list.do" target="main_frame">投放区域信息管理</a></li>
						<li><a href="<%=path %>/page/channelInfo/channelInfo_list.do" target="main_frame">频道信息管理</a></li>
						<li><a href="<%=path %>/page/userArea/userArea_list.do" target="main_frame">用户区域查询</a></li>
						<li><a href="<%=path %>/page/userArea/userRank_list.do" target="main_frame">用户级别查询</a></li>
						<li><a href="<%=path %>/page/userIndustryCategory/userIndustryCategory_list.do" target="main_frame">用户行业类别查询</a></li>
					</ul>
				</li>
			</ul>
		</div>
        <a href="#" target="_top" class="menu-title" onfocus="blur();">广告营销规则管理</a>
		<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="<%=path %>/page/marketingrule/listMarketingRule.do?method=listMarketingRule" target="main_frame">营销规则管理</a></li>
					      		<li><a href="<%=path %>/page/customer/adCustomerMgr_list.do" target="main_frame">广告商管理</a></li>
					      		<li><a href="<%=path %>/page/customer/adCustomerMgr_listAudit.do" target="main_frame">广告商审核</a></li>
					      		<li><a href="<%=path %>/page/contract/queryContractPage.do?method=queryPage" target="main_frame">广告合同管理</a></li>
					      		<li><a href="<%=path %>/page/contract/approvalListContract.do?method=approvalListPage" target="main_frame">广告合同审核</a></li>
							</ul>
						</li>
					</ul>
				</div>
       <a href="#" target="_top" class="menu-title" onfocus="blur();">广告投放管理</a>
				<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="<%=path %>/page/ploy/listPloy.do?method=getAllPloyList" target="main_frame">投放策略管理</a></li>
					      		<li><a href="<%=path %>/page/precise/listPrecise.do?method=getAllPreciseList" target="main_frame">精准匹配管理</a></li>
					      		<li><a href="<%=path %>/page/order/listOrder.do?contractCode=&positionName=&ployName=&orderState=&pageNo=1" target="main_frame">订单管理</a></li>
					      		<li><a href="<%=path %>/page/order/listOrderForCheck.do?orderType=&contractCode=&positionName=&startDate=&endDate=&pageNo=1" target="main_frame">订单审核</a></li>
					      		<li><a href="#" target="main_frame">发布管理</a></li>
							</ul>
						</li>
					</ul>
				</div>
				
		<a href="#" target="_top" class="menu-title" onfocus="blur();">广告报表管理</a>
				<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="#" target="main_frame">广告投放统计报表</a></li>
					      		<li><a href="#" target="main_frame">广告效果分析管理</a></li>
							</ul>
						</li>
					</ul>
				</div>
			
		<a href="#" target="_top" class="menu-title" onfocus="blur();">系统用户管理</a>
				<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="<%=path %>/page/user/userList.do?method=getAllUserList" target="main_frame">用户管理</a></li>
								<li><a href="<%=path %>/page/role/toRoleList.do" target="main_frame">角色管理</a></li>
								<li><a href="<%=path %>/page/column/columnList.do?method=getAllColumnList" target="main_frame">栏目管理</a></li>
							</ul>
						</li>
					</ul>
				</div>
			
		<a href="#" target="_top" class="menu-title" onfocus="blur();">广告维护管理</a>
				<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="#" target="main_frame">广告决策配置</a></li>
					      		<li><a href="#" target="main_frame">投放系统配置</a></li>
					      		<li><a href="#" target="main_frame">系统消息管理</a></li>
					      		<li><a href="#" target="main_frame">系统日志管理</a></li>
							</ul>
						</li>
					</ul>
				</div>
			<a href="#" target="_top" class="menu-title" onfocus="blur();">规格管理</a>
				<div class="menu-item">
					<ul>
					 	 <li>
					      	<ul class="list">
					      		<li><a href="<%=path %>/page/imageSpecification/queryImageManager.do" target="main_frame">图片规格维护</a></li>
					      		<li><a href="<%=path %>/page/videoSpecification/queryVideoManager.do" target="main_frame">视频规格维护</a></li>
					      		<li><a href="<%=path %>/page/textSpecification/queryTextManager.do" target="main_frame">文字规格维护</a></li>
					      		<li><a href="<%=path %>/page/questionnaireSpecification/queryQuestionManager.do" target="main_frame">调查问卷规格维护</a></li>
							</ul>
						</li>
					</ul>
				</div>
  </div>
</div> 
</body>
</html>



