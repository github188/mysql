package cn.com.avit.ads.synVoddata.dao;

import java.util.List;

import cn.com.avit.ads.synVoddata.bean.LocationCodeBean;


public interface SynLocationCodeDao {
	public void deleteLocationCodeList(String netWorkID);
	public void insertLocationCodes(List<LocationCodeBean> locationCodeBeans);
	public void insertLocationCode(LocationCodeBean locationCodeBean);
	public void execProc();
}
