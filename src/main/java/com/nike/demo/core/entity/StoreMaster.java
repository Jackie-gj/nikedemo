package com.nike.demo.core.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.opencsv.bean.CsvBindByName;
import com.opencsv.bean.CsvBindByPosition;
import com.opencsv.bean.CsvDate;

public class StoreMaster {
	
	@CsvBindByName(column="POS ID")
//	@CsvBindByPosition(position=1)
    private Integer posId;

	@CsvBindByName(column="Original POS ID")
    private Integer originalPosId;

	@CsvBindByName(column="Store Code")
    private String storeCode;

	@CsvBindByName(column="Store Status")
    private String storeStatus;

	@CsvBindByName(column="(Abbrev) Owner Group Name")
    private String abbrevOwnerGroupName;

	@CsvBindByName(column="Sub-Territory")
    private String subTerritory;

	@CsvBindByName(column="(Local) Store Name")
    private String localStoreName;

	@CsvBindByName(column="Store: Store Name")
    private String storeStoreName;

	@CsvBindByName(column="Store Street Address 1")
    private String storeStreetAddress1;

	@CsvBindByName(column="(English) Store Street Address 1")
    private String englishStoreStreetAddress1;

	@CsvBindByName(column="Temporary Store")
    private Integer temporaryStore;

	@CsvBindByName(column="Store SubPartner Indicator")
    private Integer storeSubpartnerIndicator;

	@CsvBindByName(column="Store: Record Type")
    private String storeRecordType;

	@CsvBindByName(column="Global Store Channel Class")
    private String globalStoreChannelClass;

	@CsvBindByName(column="Store Sub-Type")
    private String storeSubType;

	@CsvBindByName(column="China Store Sub Channel")
    private String chinaStoreSubChannel;

	@CsvBindByName(column="State/Province")
    private String stateProvince;

	@CsvBindByName(column="(Local) Province")
    private String localProvince;

	@CsvBindByName(column="City")
    private String city;

	@CsvBindByName(column="(Local) City")
    private String localCity;

	@CsvBindByName(column="Store City Tier Number")
    private Integer storeCityTierNumber;

	@CsvBindByName(column="(Local) Sales Area Names")
    private String localSalesAreaNames;
	
	@CsvBindByName(column="Sales Area Names")
    private String salesAreaNames;

	@CsvBindByName(column="China Trade Zone")
    private String chinaTradeZone;

	@CsvBindByName(column="Hotspot Cluster")
    private String hotspotCluster;

	@CsvBindByName(column="Store HotSpot Tier")
    private Integer storeHotspotTier;

	@CsvBindByName(column="Store Environment Description")
    private String storeEnvironmentDescription;

	@CsvBindByName(column="Consumer Led Concept Store")
    private Integer consumerLedConceptStore;

	@CsvBindByName(column="MPT Store")
    private Integer mptStore;

	@CsvBindByName(column="Sold To Number")
    private Integer soldToNumber;

	@CsvBindByName(column="Ship To Number")
    private Integer shipToNumber;

	@CsvBindByName(column="Customer Sold To")
    private String customerSoldTo;

	@CsvBindByName(column="Application Reason")
    private String applicationReason;

	@CsvBindByName(column="Distribution Type")
    private String distributionType;

	@CsvBindByName(column="Store First Open Date")
	@CsvDate("yyyy/MM/dd")
    private Date storeFirstOpenDate;

	@CsvBindByName(column="Store Last Open Date")
	@CsvDate("yyyy/MM/dd")
    private Date storeLastOpenDate;

	@CsvBindByName(column="Store Last Renovation Date")
	@CsvDate("yyyy/MM/dd")
    private Date storeLastRenovationDate;

	@CsvBindByName(column="Store Close Date")
	@CsvDate("yyyy/MM/dd")
    private Date storeCloseDate;

	@CsvBindByName(column="Close Reason (picklist)")
    private String closeReasonPicklist;

	@CsvBindByName(column="Store Total Space Size")
    private Integer storeTotalSpaceSize;

	@CsvBindByName(column="Store Selling Space Size")
    private Integer storeSellingSpaceSize;

	@CsvBindByName(column="Floor Number")
    private Integer floorNumber;

	@CsvBindByName(column="Total Stories")
    private Integer totalStories;

	@CsvBindByName(column="China Store Distribution Tier")
    private String chinaStoreDistributionTier;

	@CsvBindByName(column="CLC Status")
    private String clcStatus;

	@CsvBindByName(column="CLC Target Date")
    private Integer clcTargetDate;

	@CsvBindByName(column="Real Estate Category")
    private String realEstateCategory;

	@CsvBindByName(column="Customer Distribution Tier")
    private String customerDistributionTier;

	@CsvBindByName(column="Store Tier")
    private String storeTier;

	@CsvBindByName(column="Store Lead Category")
    private String storeLeadCategory;

	@CsvBindByName(column="Fixture Program")
    private String fixtureProgram;

	@CsvBindByName(column="Longitude")
    private BigDecimal longitude;

	@CsvBindByName(column="Latitude")
    private BigDecimal latitude;

	@CsvBindByName(column="Inc.")
    private String inc;

	@CsvBindByName(column="Address Match Type")
    private String addressMatchType;
	
	@CsvBindByName(column="Trade_Zone")
    private String tradeZone;
	
	private String searchOn;

    public String getTradeZone() {
		return tradeZone;
	}

	public void setTradeZone(String tradeZone) {
		this.tradeZone = tradeZone;
	}

	public String getSearchOn() {
		return searchOn;
	}

	public void setSearchOn(String searchOn) {
		this.searchOn = searchOn;
	}

	public Integer getPosId() {
        return posId;
    }

    public void setPosId(Integer posId) {
        this.posId = posId;
    }

    public Integer getOriginalPosId() {
        return originalPosId;
    }

    public void setOriginalPosId(Integer originalPosId) {
        this.originalPosId = originalPosId;
    }

    public String getStoreCode() {
        return storeCode;
    }

    public void setStoreCode(String storeCode) {
        this.storeCode = storeCode == null ? null : storeCode.trim();
    }

    public String getStoreStatus() {
        return storeStatus;
    }

    public void setStoreStatus(String storeStatus) {
        this.storeStatus = storeStatus == null ? null : storeStatus.trim();
    }

    public String getAbbrevOwnerGroupName() {
        return abbrevOwnerGroupName;
    }

    public void setAbbrevOwnerGroupName(String abbrevOwnerGroupName) {
        this.abbrevOwnerGroupName = abbrevOwnerGroupName == null ? null : abbrevOwnerGroupName.trim();
    }

    public String getSubTerritory() {
        return subTerritory;
    }

    public void setSubTerritory(String subTerritory) {
        this.subTerritory = subTerritory == null ? null : subTerritory.trim();
    }

    public String getLocalStoreName() {
        return localStoreName;
    }

    public void setLocalStoreName(String localStoreName) {
        this.localStoreName = localStoreName == null ? null : localStoreName.trim();
    }

    public String getStoreStoreName() {
        return storeStoreName;
    }

    public void setStoreStoreName(String storeStoreName) {
        this.storeStoreName = storeStoreName == null ? null : storeStoreName.trim();
    }

    public String getStoreStreetAddress1() {
        return storeStreetAddress1;
    }

    public void setStoreStreetAddress1(String storeStreetAddress1) {
        this.storeStreetAddress1 = storeStreetAddress1 == null ? null : storeStreetAddress1.trim();
    }

    public String getEnglishStoreStreetAddress1() {
        return englishStoreStreetAddress1;
    }

    public void setEnglishStoreStreetAddress1(String englishStoreStreetAddress1) {
        this.englishStoreStreetAddress1 = englishStoreStreetAddress1 == null ? null : englishStoreStreetAddress1.trim();
    }

    public Integer getTemporaryStore() {
        return temporaryStore;
    }

    public void setTemporaryStore(Integer temporaryStore) {
        this.temporaryStore = temporaryStore;
    }

    public Integer getStoreSubpartnerIndicator() {
        return storeSubpartnerIndicator;
    }

    public void setStoreSubpartnerIndicator(Integer storeSubpartnerIndicator) {
        this.storeSubpartnerIndicator = storeSubpartnerIndicator;
    }

    public String getStoreRecordType() {
        return storeRecordType;
    }

    public void setStoreRecordType(String storeRecordType) {
        this.storeRecordType = storeRecordType == null ? null : storeRecordType.trim();
    }

    public String getGlobalStoreChannelClass() {
        return globalStoreChannelClass;
    }

    public void setGlobalStoreChannelClass(String globalStoreChannelClass) {
        this.globalStoreChannelClass = globalStoreChannelClass == null ? null : globalStoreChannelClass.trim();
    }

    public String getStoreSubType() {
        return storeSubType;
    }

    public void setStoreSubType(String storeSubType) {
        this.storeSubType = storeSubType == null ? null : storeSubType.trim();
    }

    public String getChinaStoreSubChannel() {
        return chinaStoreSubChannel;
    }

    public void setChinaStoreSubChannel(String chinaStoreSubChannel) {
        this.chinaStoreSubChannel = chinaStoreSubChannel == null ? null : chinaStoreSubChannel.trim();
    }

    public String getStateProvince() {
        return stateProvince;
    }

    public void setStateProvince(String stateProvince) {
        this.stateProvince = stateProvince == null ? null : stateProvince.trim();
    }

    public String getLocalProvince() {
        return localProvince;
    }

    public void setLocalProvince(String localProvince) {
        this.localProvince = localProvince == null ? null : localProvince.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getLocalCity() {
        return localCity;
    }

    public void setLocalCity(String localCity) {
        this.localCity = localCity == null ? null : localCity.trim();
    }

    public Integer getStoreCityTierNumber() {
        return storeCityTierNumber;
    }

    public void setStoreCityTierNumber(Integer storeCityTierNumber) {
        this.storeCityTierNumber = storeCityTierNumber;
    }

    public String getLocalSalesAreaNames() {
        return localSalesAreaNames;
    }

    public void setLocalSalesAreaNames(String localSalesAreaNames) {
        this.localSalesAreaNames = localSalesAreaNames == null ? null : localSalesAreaNames.trim();
    }

    public String getSalesAreaNames() {
        return salesAreaNames;
    }

    public void setSalesAreaNames(String salesAreaNames) {
        this.salesAreaNames = salesAreaNames == null ? null : salesAreaNames.trim();
    }

    public String getChinaTradeZone() {
        return chinaTradeZone;
    }

    public void setChinaTradeZone(String chinaTradeZone) {
        this.chinaTradeZone = chinaTradeZone == null ? null : chinaTradeZone.trim();
    }

    public String getHotspotCluster() {
        return hotspotCluster;
    }

    public void setHotspotCluster(String hotspotCluster) {
        this.hotspotCluster = hotspotCluster == null ? null : hotspotCluster.trim();
    }

    public Integer getStoreHotspotTier() {
        return storeHotspotTier;
    }

    public void setStoreHotspotTier(Integer storeHotspotTier) {
        this.storeHotspotTier = storeHotspotTier;
    }

    public String getStoreEnvironmentDescription() {
        return storeEnvironmentDescription;
    }

    public void setStoreEnvironmentDescription(String storeEnvironmentDescription) {
        this.storeEnvironmentDescription = storeEnvironmentDescription == null ? null : storeEnvironmentDescription.trim();
    }

    public Integer getConsumerLedConceptStore() {
        return consumerLedConceptStore;
    }

    public void setConsumerLedConceptStore(Integer consumerLedConceptStore) {
        this.consumerLedConceptStore = consumerLedConceptStore;
    }

    public Integer getMptStore() {
        return mptStore;
    }

    public void setMptStore(Integer mptStore) {
        this.mptStore = mptStore;
    }

    public Integer getSoldToNumber() {
        return soldToNumber;
    }

    public void setSoldToNumber(Integer soldToNumber) {
        this.soldToNumber = soldToNumber;
    }

    public Integer getShipToNumber() {
        return shipToNumber;
    }

    public void setShipToNumber(Integer shipToNumber) {
        this.shipToNumber = shipToNumber;
    }

    public String getCustomerSoldTo() {
        return customerSoldTo;
    }

    public void setCustomerSoldTo(String customerSoldTo) {
        this.customerSoldTo = customerSoldTo == null ? null : customerSoldTo.trim();
    }

    public String getApplicationReason() {
        return applicationReason;
    }

    public void setApplicationReason(String applicationReason) {
        this.applicationReason = applicationReason == null ? null : applicationReason.trim();
    }

    public String getDistributionType() {
        return distributionType;
    }

    public void setDistributionType(String distributionType) {
        this.distributionType = distributionType == null ? null : distributionType.trim();
    }

    public Date getStoreFirstOpenDate() {
        return storeFirstOpenDate;
    }

    public void setStoreFirstOpenDate(Date storeFirstOpenDate) {
        this.storeFirstOpenDate = storeFirstOpenDate;
    }

    public Date getStoreLastOpenDate() {
        return storeLastOpenDate;
    }

    public void setStoreLastOpenDate(Date storeLastOpenDate) {
        this.storeLastOpenDate = storeLastOpenDate;
    }

    public Date getStoreLastRenovationDate() {
        return storeLastRenovationDate;
    }

    public void setStoreLastRenovationDate(Date storeLastRenovationDate) {
        this.storeLastRenovationDate = storeLastRenovationDate;
    }

    public Date getStoreCloseDate() {
        return storeCloseDate;
    }

    public void setStoreCloseDate(Date storeCloseDate) {
        this.storeCloseDate = storeCloseDate;
    }

    public String getCloseReasonPicklist() {
        return closeReasonPicklist;
    }

    public void setCloseReasonPicklist(String closeReasonPicklist) {
        this.closeReasonPicklist = closeReasonPicklist == null ? null : closeReasonPicklist.trim();
    }

    public Integer getStoreTotalSpaceSize() {
        return storeTotalSpaceSize;
    }

    public void setStoreTotalSpaceSize(Integer storeTotalSpaceSize) {
        this.storeTotalSpaceSize = storeTotalSpaceSize;
    }

    public Integer getStoreSellingSpaceSize() {
        return storeSellingSpaceSize;
    }

    public void setStoreSellingSpaceSize(Integer storeSellingSpaceSize) {
        this.storeSellingSpaceSize = storeSellingSpaceSize;
    }

    public Integer getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(Integer floorNumber) {
        this.floorNumber = floorNumber;
    }

    public Integer getTotalStories() {
        return totalStories;
    }

    public void setTotalStories(Integer totalStories) {
        this.totalStories = totalStories;
    }

    public String getChinaStoreDistributionTier() {
        return chinaStoreDistributionTier;
    }

    public void setChinaStoreDistributionTier(String chinaStoreDistributionTier) {
        this.chinaStoreDistributionTier = chinaStoreDistributionTier == null ? null : chinaStoreDistributionTier.trim();
    }

    public String getClcStatus() {
        return clcStatus;
    }

    public void setClcStatus(String clcStatus) {
        this.clcStatus = clcStatus == null ? null : clcStatus.trim();
    }

    public Integer getClcTargetDate() {
        return clcTargetDate;
    }

    public void setClcTargetDate(Integer clcTargetDate) {
        this.clcTargetDate = clcTargetDate;
    }

    public String getRealEstateCategory() {
        return realEstateCategory;
    }

    public void setRealEstateCategory(String realEstateCategory) {
        this.realEstateCategory = realEstateCategory == null ? null : realEstateCategory.trim();
    }

    public String getCustomerDistributionTier() {
        return customerDistributionTier;
    }

    public void setCustomerDistributionTier(String customerDistributionTier) {
        this.customerDistributionTier = customerDistributionTier == null ? null : customerDistributionTier.trim();
    }

    public String getStoreTier() {
        return storeTier;
    }

    public void setStoreTier(String storeTier) {
        this.storeTier = storeTier == null ? null : storeTier.trim();
    }

    public String getStoreLeadCategory() {
        return storeLeadCategory;
    }

    public void setStoreLeadCategory(String storeLeadCategory) {
        this.storeLeadCategory = storeLeadCategory == null ? null : storeLeadCategory.trim();
    }

    public String getFixtureProgram() {
        return fixtureProgram;
    }

    public void setFixtureProgram(String fixtureProgram) {
        this.fixtureProgram = fixtureProgram == null ? null : fixtureProgram.trim();
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public String getInc() {
        return inc;
    }

    public void setInc(String inc) {
        this.inc = inc == null ? null : inc.trim();
    }

    public String getAddressMatchType() {
        return addressMatchType;
    }

    public void setAddressMatchType(String addressMatchType) {
        this.addressMatchType = addressMatchType == null ? null : addressMatchType.trim();
    }
}