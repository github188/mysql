package cn.com.avit.ads.synVoddata.service;

import java.util.List;

import cn.com.avit.ads.synVoddata.bean.UserIndustryCategoryBean;

public interface SynUserIndustryCategoryService {
	public void deleteUserIndustryCategoryList(String netWorkID);
	public void insertUserIndustryCategorys(List<UserIndustryCategoryBean> userIndustryCategoryBeans);
	public void insertUserIndustryCategory(UserIndustryCategoryBean userIndustryCategoryBean);
	public void execProc();
}
