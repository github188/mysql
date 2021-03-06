package com.avit.ads.util.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="RealTimeAds")
public class RealTimeAds {
	
	@XmlAttribute(name="preSecond", required = true)
	private String preSecond;	
	@XmlAttribute(name="adsConfigFile")
	private String adsConfigFile;	
	@XmlAttribute(name="adsTempPath")
	private String adsTempPath;	
	@XmlAttribute(name="adsTargetPath")
	private String adsTargetPath;	
	
	@XmlAttribute(name="adsTempConfigPath")
	private String adsTempConfigPath;	
	@XmlAttribute(name="adsTargetConfigPath")
	private String adsTargetConfigPath;	
	@XmlAttribute(name="untUrl")
	private String untUrl;
	@XmlElement(name="Ads")
	private List<Ads> adsList;
	@XmlTransient
	private List<String> picList = new ArrayList<String>();
	@XmlTransient
	private Map<String, List<String>> areaPicMap = new HashMap<String, List<String>>();
	private HashMap<String,Ads> adsMap = new HashMap<String,Ads>();
	public String getPreSecond() {
		return preSecond;
	}
	public void setPreSecond(String preSecond) {
		this.preSecond = preSecond;
	}
	public String getAdsConfigFile() {
		return adsConfigFile;
	}
	public void setAdsConfigFile(String adsConfigFile) {
		this.adsConfigFile = adsConfigFile;
	}
	public String getAdsTempPath() {
		return adsTempPath;
	}
	public void setAdsTempPath(String adsTempPath) {
		this.adsTempPath = adsTempPath;
	}
	public String getAdsTargetPath() {
		return adsTargetPath;
	}
	public void setAdsTargetPath(String adsTargetPath) {
		this.adsTargetPath = adsTargetPath;
	}
	public List<Ads> getAdsList() {
		return adsList;
	}
	public void setAdsList(List<Ads> adsList) {
		this.adsList = adsList;
		adsMap.clear();
		for (int i=0;i<adsList.size();i++)
		{
			adsMap.put(adsList.get(i).getAdsCode(), adsList.get(i));
		}
	}
	public Ads getAdsByCode(String adsCode)
	{
		String key=adsCode;
		Ads temp =null;
		temp= adsMap.get(adsCode);
		return temp;
	}
	public List<String> getPicList() {
		return picList;
	}
	public void setPicList(List<String> picList) {
		this.picList = picList;
	}
	public String getUntUrl() {
		return untUrl;
	}
	public void setUntUrl(String untUrl) {
		this.untUrl = untUrl;
	}
	public String getAdsTempConfigPath() {
		return adsTempConfigPath;
	}
	public void setAdsTempConfigPath(String adsTempConfigPath) {
		this.adsTempConfigPath = adsTempConfigPath;
	}
	public String getAdsTargetConfigPath() {
		return adsTargetConfigPath;
	}
	public void setAdsTargetConfigPath(String adsTargetConfigPath) {
		this.adsTargetConfigPath = adsTargetConfigPath;
	}
	public Map<String, List<String>> getAreaPicMap() {
		return areaPicMap;
	}
	
	
	
}
