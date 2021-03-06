package com.avit.dtmb.order.bean;
// default package

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.avit.dtmb.material.bean.DResource;
import com.avit.dtmb.type.PloyType;
import com.dvnchina.advertDelivery.model.ReleaseArea;

/**
 * DOrderMaterialRef entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "d_order_mate_rel_tmp")
public class DOrderMateRelTmp implements
		java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6902616209233440440L;
	private Integer id;
	private String orderCode;
	private DResource resource;
	private String startTime;
	private String endTime;
	private ReleaseArea releaseArea;
	private String ployType;
	private String typeName;
	private String typeValue;
	private String valueName;
	private Integer indexNum;
	private String contain;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "ORDER_CODE")
	public String getOrderCode() {
		return this.orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Column(name = "START_TIME", length = 8)
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@Column(name = "END_TIME", length = 8)
	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@ManyToOne(cascade =CascadeType.REFRESH, fetch = FetchType.LAZY)
	@JoinColumn(name = "AREA_CODE", referencedColumnName ="AREA_CODE", insertable = false, updatable = false)
	@NotFound(action=NotFoundAction.IGNORE)
	public ReleaseArea getReleaseArea() {
		return releaseArea;
	}

	public void setReleaseArea(ReleaseArea releaseArea) {
		this.releaseArea = releaseArea;
	}

	@ManyToOne(cascade =CascadeType.REFRESH, fetch = FetchType.LAZY)
	@JoinColumn(name = "RESOURCE_ID", referencedColumnName ="ID", insertable = false, updatable = false)
	@NotFound(action=NotFoundAction.IGNORE)
	public DResource getResource() {
		return resource;
	}

	public void setResource(DResource resource) {
		this.resource = resource;
	}
	@Column(name = "PLOY_TYPE")
	public String getPloyType() {
		return ployType;
	}

	public void setPloyType(String ployType) {
		this.ployType = ployType;
	}
	@Transient
	public String getTypeName(){
		typeName = PloyType.getValue(ployType);
		return typeName;
	}
	@Column(name = "TYPE_VALUE")
	public String getTypeValue() {
		return typeValue;
	}

	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}
	@Column(name = "VALUE_NAME")
	public String getValueName() {
		return valueName;
	}

	public void setValueName(String valueName) {
		this.valueName = valueName;
	}

	@Column(name = "INDEX_NUM")
	public Integer getIndexNum() {
		return this.indexNum;
	}

	public void setIndexNum(Integer indexNum) {
		this.indexNum = indexNum;
	}
	@Transient
	public String getContain() {
		return contain;
	}

	public void setContain(String contain) {
		this.contain = contain;
	}

}
