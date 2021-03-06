package com.avit.ads.pushads.task.service;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avit.ads.pushads.task.bean.SystemMaintainBean;
import com.avit.ads.pushads.task.bean.UntSystemMaintain;
import com.avit.ads.pushads.task.dao.SystemMaintainDao;
import com.avit.ads.util.CommonUtil;

@Service(value="standByService")
public class SystemMaintainService {
	private Logger log=Logger.getLogger(this.getClass());
	@Autowired
	private SystemMaintainDao maintainDao;


	public SystemMaintainBean getAllMaintain() {
		return maintainDao.getAllMaintain();
	}
	
	public SystemMaintainBean findSystemMaintain(){
		return maintainDao.fin();
		
	}

	public void saveOrUpdate(SystemMaintainBean maintain) {
		
	}

	public void sendSystemMainToUnt(UntSystemMaintain unt,SystemMaintainBean systemMaintain) {
		log.info("待机指令发送开始");
		
				unt.setActiveHour(systemMaintain.getActiveHour().intValue());
				unt.setActionCode(CommonUtil.ACTIONCODE_STANDEY);
				//待机指令发送
				//HttpUtils.post(url, null);
			
		//}

	}
	public void sendActionCode(UntSystemMaintain unt,SystemMaintainBean systemMaintain){
		
				unt.setActiveHour(systemMaintain.getActiveHour().intValue());
				unt.setActionCode(CommonUtil.ACTIONCODE_STOP);
				//HttpUtils.post(url, null);
			
	}
	


}
