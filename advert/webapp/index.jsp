<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/layout/accordion.css" type="text/css"/>
<title>互动电视广告平台</title>
<script type="text/javascript" src="js/jquery-1.4.4.js"></script>

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
<script type="text/javascript"><!-- 

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
 


/** 
 * 栏目显示的js 
 */
function  showColumn(){
	
	var menu_first = ['ggzcgl','ggstfgl','bpgl','xtgl','ggwgl','ggsgl','htgl','tfclgl','yxgzgl','ddgl','flsjtbgl','xtcx']; 
	
	var menu_second = ['ggwglwh','zcgl','scsc','tcwjgl','yysscsh','yyszcgl','tfqyxxgl','pdxxgl','yhqygl','yhjbgl','yhhylbcx','zcsxxgl','tpggwh','spggwh','wzggwh','dcwjggwh','yxgzglwh','ggswh','ggssh','htwh','htsh','ddwh','ddsh','fbgl','yhgl','jsgl','lmgl','ggmrpz','tfptpz','sjjkpz','ggxswzpz','tbcps','cpxxcx','ypflcx','ypxxcx','tfclwh','jzppgl','htsh','tbcpyp'];
	
	var columns = $('#columns').val();//
	var userId = $.trim($('#userId').val());  //用户的ID,    0表示是超级管理员

	if(userId == '0'){
		for(var i = 0; i < menu_first.length; i++){
			$('#'+menu_first[i]).show();
		}
		for(var i = 0; i < menu_second.length; i++){
			$('#'+menu_second[i]).show();
		}
		$("#frame_content").attr("src","<%=path %>/page/user/userList.do?method=getAllUserList");
		return;
	}else{ 
		if('' != columns){
			var arr = eval(columns);
			var showMenuRight = true;
			for(var i = 0 ; i < arr.length; i++){
				$('#'+arr[i].columnCode).show();//菜单展示
			}
			for(var j = 0 ; j < menu_second.length; j++){
				if(showMenuRight){//渲染右侧菜单
					for(var i = 0 ; i < arr.length; i++){
						if(menu_second[j] == arr[i].columnCode){
							var href_ = $('#'+menu_second[j]).children(); 
							$("#frame_content").attr("src",href_[0]);
							showMenuRight = false;
							break;
						}
					}
				}
			}		
			return;
		}else{
			alert('没有权限');
			return;
		}
	}
	
}
--></script> 

<body onload="resizeMe();showColumn();"  >
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
<td colspan="3" height="63px"><iframe src="head1.html" scrolling="no" frameborder="0" height="100%" width="100%"></iframe></td>
</tr>
<tr>
<td width="214px" valign="top" height="100%">
<!-- 
 <iframe src="menu_left1.jsp" id="I5" scrolling="no" frameborder="0" height="526" width="100%"></iframe>
 -->
 
<div style=" width:216px; height:29px;"><img src="images/bar_top1.jpg" alt="" /></div>
<div class="menuArea" height="526">

    <div id="accordion" class="menu">
	    <div id="xtgl"  style="display:none;"><a href="#" class="menu-title" onfocus="blur();">系统管理</a></div>
    	<div  class="menu-item">
			<ul>
			 	 <li>
			      	<ul class="list">
						<li id="yhgl" style="display: none;"><a href="<%=path %>/page/user/userList.do?method=getAllUserList" target="main_frame">用户管理</a></li>
						<li id='jsgl' style="display: none;"><a  href="<%=path %>/page/role/toRoleList.do" target="main_frame">角色管理</a></li>
						<li id="ggmrpz" style="display: none;"><a href="<%=path %>/page/config/getAdvertConfigList.do?method=queryPage" target="main_frame">广告默认配置</a></li>
			      		<li id="tfptpz" style="display: none;"><a href="<%=path %>/page/config/getAllPlatformConfigList.do?method=getAllPlatformConfigList" target="main_frame">投放平台配置</a></li>
			      		<li id="sjjkpz" style="display: none;"><a href="<%=path %>/page/config/getInterfaceConfigList.do?method=getInterfaceConfigList" target="main_frame">数据接口配置</a></li>
			      		<li id="ggxswzpz" style="display: none;"><a href="<%=path %>/page/config/getPositionConfigList.do?method=getPositionConfigList" target="main_frame">广告显示位置配置</a></li>
					</ul>
				</li>
			</ul>
		</div>	
		
		<div id="xtcx" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">系统查询</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="tfqyxxgl" style="display: none;" ><a href="<%=path %>/page/ReleaseArea/ReleaseArea_list.do" target="main_frame">投放区域信息管理</a></li>
			      		<li id="pdxxgl" style="display: none;" ><a href="<%=path %>/page/channelInfo/channelInfo_list.do" target="main_frame">频道信息管理</a></li>
			      		<li id="cpxxcx" style="display: none;" ><a href="<%=path %>/vod/listProduct.do?selId=&selName=&pageNo=1" target="main_frame">产品信息查询</a></li> 
			      		<li id="ypflcx" style="display: none;" ><a href="">#影片分类查询#</a></li>
			      		<li id="ypxxcx" style="display: none;" ><a href="<%=path %>/vod/listAsset.do?selId=&selName=&pageNo=1" target="main_frame">影片信息查询</a></li>
			      	    <li id="yhqygl" style="display: none;" ><a href="<%=path %>/page/userArea/userArea_list.do" target="main_frame">用户区域查询</a></li>
			      		<li id="yhjbgl" style="display: none;" ><a href="<%=path %>/page/userArea/userRank_list.do" target="main_frame">用户级别查询</a></li>
			      		<li id="yhhylbcx" style="display: none;" ><a href="<%=path %>/page/userIndustryCategory/userIndustryCategory_list.do" target="main_frame">用户行业类别查询</a></li>
					</ul> 
				</li>
			</ul>
		</div>
		
		<div id="ggwgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">广告位管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list"> 
			      		<li id="ggwglwh" style="display: none;" ><a href="<%=path %>/page/position/queryPositionPage.do?method=queryPage" target="main_frame">广告位管理</a></li>
			      		<li id="tpggwh" style="display: none;"><a href="<%=path %>/page/imageSpecification/queryImageManager.do" target="main_frame">图片规格维护</a></li>  
			      		<li id="spggwh" style="display: none;"><a href="<%=path %>/page/videoSpecification/queryVideoManager.do" target="main_frame">视频规格维护</a></li>
			      		<li id="wzggwh" style="display: none;"><a href="<%=path %>/page/textSpecification/queryTextManager.do" target="main_frame">文字规格维护</a></li>
			      		<li id="dcwjggwh" style="display: none;"><a href="<%=path %>/page/questionnaireSpecification/queryQuestionManager.do" target="main_frame">调查问卷规格维护</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div id="ggsgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">广告商管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="ggswh" style="display: none;" ><a href="<%=path %>/page/customer/adCustomerMgr_list.do" target="main_frame">广告商维护</a></li>
			      		<li id="ggssh" style="display: none;" ><a href="<%=path %>/page/customer/adCustomerMgr_listAudit.do" target="main_frame">广告商审核</a></li>
					</ul>
				</li>
			</ul>
		</div>
    	<div id="yxgzgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">营销规则管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="yxgzglwh" style="display: none;" ><a href="<%=path %>/page/marketingrule/listMarketingRule.do?method=listMarketingRule" target="main_frame">营销规则管理</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="htgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">合同管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="htwh" style="display: none;" ><a href="<%=path %>/page/contract/queryContractPage.do?method=queryPage" target="main_frame">合同维护</a></li>
						<li id="htsh" style="display: none;" ><a href="<%=path %>/page/contract/approvalListContract.do?method=approvalListPage" target="main_frame">合同审核</a></li>
					</ul> 
				</li>
			</ul>
		</div>
		
		<div id="tfclgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">投放策略管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list"> 
			      		<li id="jzppgl" style="display: none;" ><a href="<%=path %>/page/precise/listPrecise.do?method=getAllPreciseList" target="main_frame">精准匹配管理</a></li>
			      		<li id="tfclwh" style="display: none;" ><a href="#" target="main_frame">#投放策略维护#</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="ggzcgl"  style="display: none;"><a href="#" class="menu-title"  onfocus="blur();">广告资产管理</a></div>
		<div  style="display: none;" class="menu-item">
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="zcgl" style="display: none;" ><a href="<%=path %>/page/AdContent/adContentMgr_list.do" target="main_frame">资产维护</a></li>
						<li id="scsc" style="display: none;" ><a href="<%=path %>/material/toUploaldFile.do" target="main_frame">上传素材</a></li>
						<li id="tcwjgl" style="display: none;" ><a href="<%=path %>/page/questionnaire/listQuestionnaire.do" target="main_frame">调查问卷管理</a></li>
						<li id="yysscsh" style="display: none;" ><a href="<%=path %>/page/AdContent/adContentMgr_listAuditMetas.do" target="main_frame">资产审核</a></li>
						<li id="yyszcgl" style="display: none;" ><a href="<%=path %>/page/AdContent/adContentMgr_listReal.do" target="main_frame">运营商资产管理</a></li>
						<li id="zcsxxgl" style="display: none;" ><a href="<%=path %>/page/AdContent/adContentMgr_listUD.do" target="main_frame">资产上下线管理</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div id="ddgl" style="display: none;" ><a href="#" target="_top" class="menu-title" onfocus="blur();">订单管理</a></div>
		<div class="menu-item" style="display: none;" >
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="ddwh" style="display:none;" ><a href="<%=path %>/page/order/listOrder.do?pageNo=1&pageSize=2" target="main_frame">订单维护</a></li>
			      		<li id="ddsh" style="display:none;"><a href="<%=path %>/page/order/listOrderForCheck.do?pageNo=1&pageSize=2" target="main_frame">订单审核</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div id="bpgl"  style="display:none;"><a href="#" class="menu-title"  onfocus="blur();">报表管理</a></div>
		<div  style="display: none;" class="menu-item">
			<ul>
			 	 <li>
			      	<ul class="list">
			      		
					</ul>
				</li>
			</ul>
		</div>
		<div id="flsjtbgl"  style="display:none;"><a href="#" class="menu-title"  onfocus="blur();">分类数据同步管理</a></div>
		<div  style="display: none;" class="menu-item">
			<ul>
			 	 <li>
			      	<ul class="list">
			      		<li id="tbcps" style="display: none;" ><a href="<%=path %>/page/cpsCategory/CPSPotiontionMgr_queryPage.do" target="main_frame">同步CPS广告位信息</a></li>
			      		<li id="tbcpyp" style="display: none;" ><a href="<%=path %>/page/vod/vodSync.jsp" target="main_frame">同步产品影片信息</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div> 
<input id="columns" type="hidden" value='${coulumns }' />
<input id="userId" type="hidden" value='${userId }' />

</td>

<td width="4px" class="suxian"  valign="middle"> <img src="images/main_30.gif" /></td>
<td valign="top">
<!-- 
 	<iframe src="menu_right.html" name="main_frame" id="frame_content" scrolling="auto" frameborder="0" width="100%" height="526"></iframe>
 -->
	<iframe src="" name="main_frame" id="frame_content" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>
</td>
</tr>
<tr>
<td colspan="3" class="index_bottom"></td>
</tr>
</table>
<script type="text/javascript">
$(window).resize(function() {
	resizeMe();
});
function resizeMe(){
	var iframe = document.getElementById("I5");
	var iframe2 = document.getElementById("frame_content");
	try{
	var dHeight = document.documentElement.clientHeight-70;
	var height = Math.max(526, dHeight);
	iframe.height =  height;
	iframe2.height =  height;
	}catch (ex){}
}

</script>
</body>
</html>
