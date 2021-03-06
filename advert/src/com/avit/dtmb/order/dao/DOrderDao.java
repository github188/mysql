package com.avit.dtmb.order.dao;

import java.util.List;

import com.avit.dtmb.material.bean.DResource;
import com.avit.dtmb.order.bean.DOrder;
import com.avit.dtmb.order.bean.DOrderMateRel;
import com.avit.dtmb.order.bean.DOrderMateRelTmp;
import com.avit.dtmb.ploy.bean.DPloy;
import com.avit.dtmb.position.bean.DAdPosition;
import com.dvnchina.advertDelivery.bean.PageBeanDB;
import com.dvnchina.advertDelivery.dao.BaseDao;
import com.dvnchina.advertDelivery.model.Customer;
import com.dvnchina.advertDelivery.model.ReleaseArea;

public interface DOrderDao extends BaseDao {
	
	public PageBeanDB queryDTMBOrderList(DOrder order, int pageNo, int pageSize);
	public PageBeanDB queryAuditDOrderList(DOrder order, int pageNo, int pageSize);
	public void saveDOrder(DOrder order);
	public List<DAdPosition> queryPositionList();
	public PageBeanDB queryDTMBPloyList(DPloy ploy, int pageNo, int pageSize);
	public void insertDOrderMateRelTmp(DOrder order);
	public void saveDOrderMateRel(DOrder order);
	public void deleteDOrderMateRelTmp(DOrder order);
	public void deleteDOrderMateRel(DOrder order);
	public PageBeanDB queryDOrderMateRelTmpList(DOrderMateRelTmp omrTmp, int pageNo, int pageSize);
	public List<ReleaseArea> queryReleaseAreaList();
	public PageBeanDB queryDResourceList(DResource resource, int pageNo, int pageSize);
	public void saveOrderMateRelTmp(String ids, String resourceIds);
	public List<DResource> getOrderResourceJson(DOrderMateRelTmp omrTmp);
	public void copyDOrderMateRelTmp(DOrder order);
	public int insertPlayList(DOrder order);
	public int updatePlayListEndDate(DOrder order);
	public List<Integer> checkDOrderRule(DOrder order);
	public void delDOrderMateRelTmp(String ids);
	public List<Customer> getCustomerList();
	public int updatePlayListState(String orderCode);
	public int updateOrderState(String orderCode);
	public List<DOrderMateRel> getOrderMateRelList(String orderCode);
	public List<String> getChannelGroupServiceIds(Integer groupId);
	public List<String> getAllChannelServiceIds();
	public List<String> getPloyValueByType(Integer ployId, String ployType);
	public DAdPosition getDPostionByPositionCode(String positionCode);
	public int updateOrderState();
	public int deletePlayList(DOrder order);
	public int updatePlayListEndTime(DOrder order);
	public List<ReleaseArea> getAllReleaseArea();
}