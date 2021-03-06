package com.avit.ads.pushads.uix.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ui_version")
public class UixVersion {
	/** 主键 */
	private Long versionId;
	
	/** 区域码 */
	private String areaCode;
	
	/** 更新类型  1/2/3/4/5 */
	private Integer updateType;
	
	/** 版本号 */
	private Integer version;
	
	/** 是否可用（1：可用， 0：不可用） */
	private Integer available;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "version_id", unique = true, nullable = false)
	public Long getVersionId() {
		return versionId;
	}
	public void setVersionId(Long versionId) {
		this.versionId = versionId;
	}	
	
	@Column(name = "area_code",nullable = false)
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	
	@Column(name = "update_type",nullable = false)
	public Integer getUpdateType() {
		return updateType;
	}
	public void setUpdateType(Integer updateType) {
		this.updateType = updateType;
	}
	
	@Column(name = "version",nullable = false)
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	@Column(name = "available",nullable = false)
	public Integer getAvailable() {
		return available;
	}
	public void setAvailable(Integer available) {
		this.available = available;
	}
	
	

}
