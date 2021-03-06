package com.dvnchina.advertDelivery.subtitle.bean;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class SubtitleBean {
	
	private Integer id;
	private Integer actionType;
	private Integer timeout;
	private Integer fontSize;
	private String fontColor;
	private Integer bgX;
	private Integer bgY;
	private Integer bgWidth;
	private Integer bgHeight;
	private String bgColor;
	private Integer showSpeed;
	private String word;
	private Date createTime;
	private Date pushTime;
	private Integer state;
	
	private String createDateStr;
	private String pushDateStr;
	
	private String areaCodes = "0";
	
	private String areaNames;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getActionType() {
		return actionType;
	}
	public void setActionType(Integer actionType) {
		this.actionType = actionType;
	}
	public Integer getTimeout() {
		return timeout;
	}
	public void setTimeout(Integer timeout) {
		this.timeout = timeout;
	}
	public Integer getFontSize() {
		return fontSize;
	}
	public void setFontSize(Integer fontSize) {
		this.fontSize = fontSize;
	}
	public String getFontColor() {
		return fontColor;
	}
	public void setFontColor(String fontColor) {
		this.fontColor = fontColor;
	}
	public Integer getBgX() {
		return bgX;
	}
	public void setBgX(Integer bgX) {
		this.bgX = bgX;
	}
	public Integer getBgY() {
		return bgY;
	}
	public void setBgY(Integer bgY) {
		this.bgY = bgY;
	}
	public Integer getBgWidth() {
		return bgWidth;
	}
	public void setBgWidth(Integer bgWidth) {
		this.bgWidth = bgWidth;
	}
	public Integer getBgHeight() {
		return bgHeight;
	}
	public void setBgHeight(Integer bgHeight) {
		this.bgHeight = bgHeight;
	}
	public String getBgColor() {
		return bgColor;
	}
	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}
	public Integer getShowSpeed() {
		return showSpeed;
	}
	public void setShowSpeed(Integer showSpeed) {
		this.showSpeed = showSpeed;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getPushTime() {
		return pushTime;
	}
	public void setPushTime(Date pushTime) {
		this.pushTime = pushTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCreateDateStr() {
		return createDateStr;
	}
	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}
	public String getPushDateStr() {
		return pushDateStr;
	}
	public void setPushDateStr(String pushDateStr) {
		this.pushDateStr = pushDateStr;
	}
	public String getAreaCodes() {
		return areaCodes;
	}
	public void setAreaCodes(String areaCodes) {
		this.areaCodes = areaCodes;
	}
	public String getAreaNames() {
		return areaNames;
	}
	public void setAreaNames(String areaNames) {
		this.areaNames = areaNames;
	}

}
