%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	"status": {
		"code": payload.Status.Code,
		"message": payload.Status.Message,
		"success": payload.Status.Success,
		"requestId": payload.Status.RequestID
	},
	("results": {
		"resultDto": if (typeOf(payload.Results.ResultDto) as String == "Array") (payload.Results.ResultDto map {
			"requestedComId": $.RequestedComID,
			"summaryData": {
				"dataProviderId": $.SummaryData.DataProviderID,
				"partNumber": $.SummaryData.PartNumber,
				"manufacturer": $.SummaryData.Manufacturer,
				"manufacturerId": $.SummaryData.ManufacturerID,
				"partDescription": $.SummaryData.PartDescription,
				"datasheet": $.SummaryData.Datasheet,
				"onlineSupplierDatasheetUrl": $.SummaryData.OnlineSupplierDatasheetURL,
				"radHard": $.SummaryData.RadHard,
				"doseLevel": $.SummaryData.DoseLevel,
				"taxonomyPath": $.SummaryData.TaxonomyPath,
				"taxonomyPathIds": $.SummaryData.TaxonomyPathIDs,
				"eccn": $.SummaryData.ECCN,
				"unspsc": $.SummaryData.UNSPSC,
				"otherSources": $.SummaryData.OtherSources,
				"lastCheckDate": $.SummaryData.LastCheckDate,
				"partMarking": $.SummaryData.PartMarking,
				"introductionDate": $.SummaryData.IntroductionDate,
				"militarySpecifications": $.SummaryData.MilitarySpecifications,
				"partAliases": {
					"partAlias": $.SummaryData.PartAliases.PartAlias
				},
				"esdClass": $.SummaryData.ESDClass,
				"esdSourceofInformation": $.SummaryData.ESDSourceofInformation,
				"authorizedDistributors": $.SummaryData.AuthorizedDistributors,
				"genericName": $.SummaryData.GenericName,
				"familyName": $.SummaryData.FamilyName,
				"aecNumber": $.SummaryData.AECNumber,
				"aecQualified": $.SummaryData.AECQualified,
				"automotive": $.SummaryData.Automotive,
				"supplierCageCode": $.SummaryData.SupplierCageCode,
				"eurohs": $.SummaryData.EURoHS,
				"rohsVersion": $.SummaryData.RoHSVersion,
				"scheduleB": $.SummaryData.ScheduleB,
				"htsusa": $.SummaryData.HTSUSA,
				"ppap": $.SummaryData.PPAP,
				("countriesOfOrigin": {
					"countryOfOrigin": if (typeOf($.SummaryData.CountriesOfOrigin.CountryOfOrigin) as String == "Array") ($.SummaryData.CountriesOfOrigin.CountryOfOrigin map {
						"country": $.Country,
						"source": $.Source
					})
					else if (typeOf($.SummaryData.CountriesOfOrigin.CountryOfOrigin) as String == "Object")
					({
						"country": $.SummaryData.CountriesOfOrigin.CountryOfOrigin.Country,
						"source": $.SummaryData.CountriesOfOrigin.CountryOfOrigin.Source
					})
					else null
				}) if (not (isEmpty($.SummaryData.CountriesOfOrigin))),
				"usChinaTariffImpact": $.SummaryData.USChinaTariffImpact,
				"plName": $.SummaryData.PLName
			},
			"qualifications": {
				"energyEfficiency": {
					"enablingEnergyEfficiency": $.Qualifications.EnergyEfficiency.EnablingEnergyEfficiency,
					"sourceOfInformation": $.Qualifications.EnergyEfficiency.SourceOfInformation
				},
				"agencyApprovals": {
					"agency": {
						"agnecy": $.Qualifications.AgencyApprovals.Agency.Agnecy,
						"standard": $.Qualifications.AgencyApprovals.Agency.Standard,
						"standardDetails": $.Qualifications.AgencyApprovals.Agency.StandardDetails,
						"fileNumber": $.Qualifications.AgencyApprovals.Agency.FileNumber,
						"certificationDocument": $.Qualifications.AgencyApprovals.Agency.CertificationDocument
					}
				},
				"reliability": {
					"fitDetails": {
						"fitDetail": {
							"fit": $.Qualifications.Reliability.FitDetails.FitDetail.FIT,
							"conditionName": $.Qualifications.Reliability.FitDetails.FitDetail.ConditionName,
							"conditionValue": $.Qualifications.Reliability.FitDetails.FitDetail.ConditionValue
						}
					},
					"mtbfDetails": {
						"mtbfDetail": {
							"mtbf": $.Qualifications.Reliability.MTBFDetails.MTBFDetail.MTBF,
							"conditionName": $.Qualifications.Reliability.MTBFDetails.MTBFDetail.ConditionName,
							"conditionValue": $.Qualifications.Reliability.MTBFDetails.MTBFDetail.ConditionValue
						}
					},
					"sourceOfInformation": $.Qualifications.Reliability.SourceOfInformation,
					"flammabilityRating": $.Qualifications.Reliability.FlammabilityRating
				}
			},
			"lifeCycleData": {
				"partStatus": $.LifeCycleData.PartStatus,
				"ltbDate": $.LifeCycleData.LTBDate,
				"source": $.LifeCycleData.Source,
				"estimatedYearsToEOL": $.LifeCycleData.EstimatedYearsToEOL,
				"estimatedEOLDate": $.LifeCycleData.EstimatedEOLDate,
				"partLifecycleStage": $.LifeCycleData.PartLifecycleStage,
				"minimumEstimatedYearsToEOL": $.LifeCycleData.MinimumEstimatedYearsToEOL,
				"maximumEstimatedYearsToEOL": $.LifeCycleData.MaximumEstimatedYearsToEOL,
				"lifeCycleRiskGrade": $.LifeCycleData.LifeCycleRiskGrade,
				"overallRisk": $.LifeCycleData.OverallRisk,
				"partCounterfeitReports": $.LifeCycleData.PartCounterfeitReports,
				"partLifecycleCode": $.LifeCycleData.PartLifecycleCode
			},
			"fullCounterfeitData": {
				"counterfeitOverallRisk": $.FullCounterfeitData.CounterfeitOverallRisk,
				"partNumCounterfeitReportsCount": $.FullCounterfeitData.PartNumCounterfeitReportsCount,
				"manCounterfeitReportsCount": $.FullCounterfeitData.ManCounterfeitReportsCount,
				("manCounterfeitReports": if (typeOf($.FullCounterfeitData.ManCounterfeitReports) as String == "Array") ($.FullCounterfeitData.ManCounterfeitReports map {
					"mpn": $.MPN,
					"supplier": $.Supplier,
					"notificationDate": $.NotificationDate,
					"counterfitMethods": $.CounterfitMethods,
					"description": $.Description,
					"source": $.Source
				})
				else if (typeOf($.FullCounterfeitData.ManCounterfeitReports) as String == "Object") 
				({
					"mpn": $.FullCounterfeitData.ManCounterfeitReports.MPN,
					"supplier": $.FullCounterfeitData.ManCounterfeitReports.Supplier,
					"notificationDate": $.FullCounterfeitData.ManCounterfeitReports.NotificationDate,
					"counterfitMethods": $.FullCounterfeitData.ManCounterfeitReports.CounterfitMethods,
					"description": $.FullCounterfeitData.ManCounterfeitReports.Description,
					"source": $.FullCounterfeitData.ManCounterfeitReports.Source
				})
				else null) if (not (isEmpty($.FullCounterfeitData.ManCounterfeitReports))),
				"plCounterfeitReportsCount": $.FullCounterfeitData.PlCounterfeitReportsCount,
				"currentLifecycleStatus": $.FullCounterfeitData.CurrentLifecycleStatus,
				"timeSinceMarketIntroduction": $.FullCounterfeitData.TimeSinceMarketIntroduction,
				"authorizedDistributorswithStockCount": $.FullCounterfeitData.AuthorizedDistributorswithStockCount,
				("authorizedDistributorswithStockReports": if (typeOf($.FullCounterfeitData.AuthorizedDistributorswithStockReports) as String == "Array") ($.FullCounterfeitData.AuthorizedDistributorswithStockReports map {
					"date": $.Date,
					"avgQuantity": $.AvgQuantity,
					"inventory": $.Inventory
				})
				else if (typeOf($.FullCounterfeitData.AuthorizedDistributorswithStockReports) as String == "Object") 
				({
					"date": $.FullCounterfeitData.AuthorizedDistributorswithStockReports.Date,
					"avgQuantity": $.FullCounterfeitData.AuthorizedDistributorswithStockReports.AvgQuantity,
					"inventory": $.FullCounterfeitData.AuthorizedDistributorswithStockReports.Inventory
				})
				else null) if (not (isEmpty($.FullCounterfeitData.AuthorizedDistributorswithStockReports))),
				"historicalShortagesInventoryReported": $.FullCounterfeitData.HistoricalShortagesInventoryReported,
				"isPopularPart": $.FullCounterfeitData.IsPopularPart
			},
			("parametricData": {
				"features": if (typeOf($.ParametricData.Features) as String == "Array") ($.ParametricData.Features map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureID,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf($.ParametricData.Features) as String == "Object") 
				({
					"featureName": $.ParametricData.Features.FeatureName,
					"featureValue": $.ParametricData.Features.FeatureValue,
					"featureUnit": $.ParametricData.Features.FeatureUnit,
					"featureId": $.ParametricData.Features.FeatureID,
					"featureValueDetails": {
						"value": $.ParametricData.Features.FeatureValueDetails.value,
						"sign": $.ParametricData.Features.FeatureValueDetails.sign,
						"unit": $.ParametricData.Features.FeatureValueDetails.unit,
						"multiplier": $.ParametricData.Features.FeatureValueDetails.multiplier,
						"multiplierValue": $.ParametricData.Features.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty($.ParametricData))),
			"packagingData": {
				"packagingSuffix": $.PackagingData.PackagingSuffix,
				"packaging": $.PackagingData.Packaging,
				"quantityOfPackaging": $.PackagingData.QuantityOfPackaging,
				"reelDiameter": $.PackagingData.ReelDiameter,
				"reelWidth": $.PackagingData.ReelWidth,
				"tapePitch": $.PackagingData.TapePitch,
				"tapeWidth": $.PackagingData.TapeWidth,
				"feedHolePitch": $.PackagingData.FeedHolePitch,
				"holeCenterToComponentCenter": $.PackagingData.HoleCenterToComponentCenter,
				"leadClinchHeight": $.PackagingData.LeadClinchHeight,
				"componentOrientation": $.PackagingData.ComponentOrientation,
				"packagingDocument": $.PackagingData.PackagingDocument,
				"tapeMaterial": $.PackagingData.TapeMaterial,
				"tapeType": $.PackagingData.TapeType
			},
			("packageData": {
				"feature": if (typeOf($.PackageData.Feature) as String == "Array") ($.PackageData.Feature map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureId,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf($.PackageData.Feature) as String == "Object") 
				({
					"featureName": $.PackageData.Feature.FeatureName,
					"featureValue": $.PackageData.Feature.FeatureValue,
					"featureUnit": $.PackageData.Feature.FeatureUnit,
					"featureId": $.PackageData.Feature.FeatureId,
					"featureValueDetails": {
						"value": $.PackageData.Feature.FeatureValueDetails.value,
						"sign": $.PackageData.Feature.FeatureValueDetails.sign,
						"unit": $.PackageData.Feature.FeatureValueDetails.unit,
						"multiplier": $.PackageData.Feature.FeatureValueDetails.multiplier,
						"multiplierValue": $.PackageData.Feature.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty($.PackageData))),
			"manufacturingData": {
				"msl": $.ManufacturingData.MSL,
				"leadFinishPlating": $.ManufacturingData.LeadFinishPlating,
				"terminalBaseMaterial": $.ManufacturingData.TerminalBaseMaterial,
				"maximumReflowTemperature": $.ManufacturingData.MaximumReflowTemperature,
				"reflowSolderTime": $.ManufacturingData.ReflowSolderTime,
				"numberOfReflowCycle": $.ManufacturingData.NumberOfReflowCycle,
				"standard": $.ManufacturingData.Standard,
				"maximumWaveTemperature": $.ManufacturingData.MaximumWaveTemperature,
				"waveSolderTime": $.ManufacturingData.WaveSolderTime,
				"underPlatingMaterial": $.ManufacturingData.UnderPlatingMaterial,
				"reflowTempSource": $.ManufacturingData.ReflowTempSource,
				"waveTempSource": $.ManufacturingData.WaveTempSource,
				"underPlatingPorosityFree": $.ManufacturingData.UnderPlatingPorosityFree
			},
			("chemicalData": {
				"chemicalDto": if (typeOf($.ChemicalData.ChemicalDto) as String == "Array") ($.ChemicalData.ChemicalDto map {
					"totalMassInGram": $.TotalMassInGram,
					"totalMassSummationInGram": $.TotalMassSummationInGram,
					"locationName": $.LocationName,
					"homogenousMaterial": $.HomogenousMaterial,
					"homogenousMaterialMass": $.HomogenousMaterialMass,
					"substanceIdentification": $.SubstanceIdentification,
					"normalizedSubstance": $.NormalizedSubstance,
					"substanceGroup": $.SubstanceGroup,
					"substanceMass": $.SubstanceMass,
					"ppm": $.PPM,
					"casNumber": $.CASNumber,
					"mdsurl": $.MDSURL,
					"itemSubItem": $.ItemSubItem
				})
				else if (typeOf($.ChemicalData.ChemicalDto) as String == "Object") 
				({
					"totalMassInGram": $.ChemicalData.ChemicalDto.TotalMassInGram,
					"totalMassSummationInGram": $.ChemicalData.ChemicalDto.TotalMassSummationInGram,
					"locationName": $.ChemicalData.ChemicalDto.LocationName,
					"homogenousMaterial": $.ChemicalData.ChemicalDto.HomogenousMaterial,
					"homogenousMaterialMass": $.ChemicalData.ChemicalDto.HomogenousMaterialMass,
					"substanceIdentification": $.ChemicalData.ChemicalDto.SubstanceIdentification,
					"normalizedSubstance": $.ChemicalData.ChemicalDto.NormalizedSubstance,
					"substanceGroup": $.ChemicalData.ChemicalDto.SubstanceGroup,
					"substanceMass": $.ChemicalData.ChemicalDto.SubstanceMass,
					"ppm": $.ChemicalData.ChemicalDto.PPM,
					"casNumber": $.ChemicalData.ChemicalDto.CASNumber,
					"mdsurl": $.ChemicalData.ChemicalDto.MDSURL,
					"itemSubItem": $.ChemicalData.ChemicalDto.ItemSubItem
				})
				else null
			}) if (not (isEmpty($.ChemicalData))),
			"reachData": {
				"reachDto": {
					"cachedSource": $.ReachData.ReachDto.CachedSource,
					"containsSvhc": $.ReachData.ReachDto.ContainsSVHC,
					"svhcExceedThresholdLimit": $.ReachData.ReachDto.SVHCExceedThresholdLimit,
					"svhcListVersion": $.ReachData.ReachDto.SVHCListVersion,
					"substanceIdentification": $.ReachData.ReachDto.SubstanceIdentification,
					"substanceLocation": $.ReachData.ReachDto.SubstanceLocation,
					"substanceConcentration": $.ReachData.ReachDto.SubstanceConcentration,
					"sourceType": $.ReachData.ReachDto.SourceType,
					"reachStatus": $.ReachData.ReachDto.ReachStatus,
					"casNumber": $.ReachData.ReachDto.CASNumber,
					"svhcDateOfInclusion": $.ReachData.ReachDto.SVHCDateOfInclusion,
					"annexXIV": {
						"sunsetDate": $.ReachData.ReachDto.AnnexXIV.SunsetDate,
						"applicationDate": $.ReachData.ReachDto.AnnexXIV.ApplicationDate,
						"authorizationEntryNumber": $.ReachData.ReachDto.AnnexXIV.AuthorizationEntryNumber,
						"exemptedCategories": $.ReachData.ReachDto.AnnexXIV.ExemptedCategories
					}
				}
			},
			"environmentalDto": {
				"rohsStatus": $.EnvironmentalDto.RoHSStatus,
				"rohsVersion": $.EnvironmentalDto.RoHSVersion,
				"source": $.EnvironmentalDto.Source,
				"sourceType": $.EnvironmentalDto.SourceType,
				"exemption": $.EnvironmentalDto.Exemption,
				"exemptionType": $.EnvironmentalDto.ExemptionType,
				"exemptionCodes": $.EnvironmentalDto.ExemptionCodes,
				"exemptionExpirationDate": $.EnvironmentalDto.ExemptionExpirationDate,
				"rohsIdentifier": $.EnvironmentalDto.RohsIdentifier,
				"leadFree": $.EnvironmentalDto.LeadFree,
				"rareEarthElementInformation": $.EnvironmentalDto.RareEarthElementInformation,
				"conflictMineralStatus": $.EnvironmentalDto.ConflictMineralStatus,
				"conflictMineralStatement": $.EnvironmentalDto.ConflictMineralStatement,
				"eiccMembership": $.EnvironmentalDto.EICCMembership,
				"eiccTemplate": $.EnvironmentalDto.EICCTemplate,
				"eiccTemplateVersion": $.EnvironmentalDto.EICCTemplateVersion,
				"halgonFree": $.EnvironmentalDto.HalgonFree,
				"chinaRohs": {
					"chinaRohsStatus": $.EnvironmentalDto.ChinaRoHS.ChinaRoHSStatus,
					"cadmiumConcentration": $.EnvironmentalDto.ChinaRoHS.CadmiumConcentration,
					"cadmiumFlag": $.EnvironmentalDto.ChinaRoHS.CadmiumFlag,
					"chromiumConcentration": $.EnvironmentalDto.ChinaRoHS.ChromiumConcentration,
					"chromiumFlag": $.EnvironmentalDto.ChinaRoHS.ChromiumFlag,
					"leadConcentration": $.EnvironmentalDto.ChinaRoHS.LeadConcentration,
					"leadFlag": $.EnvironmentalDto.ChinaRoHS.LeadFlag,
					"mercuryConcentration": $.EnvironmentalDto.ChinaRoHS.MercuryConcentration,
					"mercuryFlag": $.EnvironmentalDto.ChinaRoHS.MercuryFlag,
					"pbbConcentration": $.EnvironmentalDto.ChinaRoHS.PBBConcentration,
					"pbbFlag": $.EnvironmentalDto.ChinaRoHS.PBBFlag,
					"pbdeConcentration": $.EnvironmentalDto.ChinaRoHS.PBDEConcentration,
					"pbdeFlag": $.EnvironmentalDto.ChinaRoHS.PBDEFlag,
					"epup": $.EnvironmentalDto.ChinaRoHS.EPUP,
					"itemSubitemName": $.EnvironmentalDto.ChinaRoHS.ItemSubitemName,
					"sourceType": $.EnvironmentalDto.ChinaRoHS.SourceType,
					"cachedSource": $.EnvironmentalDto.ChinaRoHS.CachedSource,
					"liveSupplierSource": $.EnvironmentalDto.ChinaRoHS.LiveSupplierSource
				},
				"exemptionDetails": $.EnvironmentalDto.ExemptionDetails
			},
			"gidepData": {
				"typeOfChange": $.GidepData.TypeOfChange,
				"gidepDescription": $.GidepData.GIDEPDescription,
				"notificationDate": $.GidepData.NotificationDate,
				"documentNumber": $.GidepData.DocumentNumber
			},
			"pcnData": {
				"pcnDto": {
					"lastPcnNumber": $.PCNData.PCNDto.LastPCNNumber,
					"lastPcnDate": $.PCNData.PCNDto.LastPCNDate,
					"lastPcnTypeOfChange": $.PCNData.PCNDto.LastPCNTypeOfChange,
					"lastPcnSource": $.PCNData.PCNDto.LastPCNSource,
					"lastEolNumber": $.PCNData.PCNDto.LastEOLNumber,
					"lastEolDate": $.PCNData.PCNDto.LastEOLDate,
					"lastEolSource": $.PCNData.PCNDto.LastEOLSource
				}
			},
			("pcnDetails": {
				"pcnDto":  if (typeOf($.PCNDetails.PCNDto) as String == "Array") ($.PCNDetails.PCNDto map {
					"pcnNumber": $.PCNNumber,
					"typeOfChange": $.TypeOfChange,
					"descriptionOfChange": $.DescriptionOfChange,
					"pcnSource": $.PcnSource,
					"notificationDate": $.NotificationDate,
					"effectiveDate": $.EffectiveDate,
					"lastTimeBuyDate": $.LastTimeBuyDate,
					"lastShipDate": $.LastShipDate,
					"pcnId": $.PCNId
				})
				else if (typeOf($.PCNDetails.PCNDto) as String == "Object")
				({
					"pcnNumber": $.PCNDetails.PCNDto.PCNNumber,
					"typeOfChange": $.PCNDetails.PCNDto.TypeOfChange,
					"descriptionOfChange": $.PCNDetails.PCNDto.DescriptionOfChange,
					"pcnSource": $.PCNDetails.PCNDto.PcnSource,
					"notificationDate": $.PCNDetails.PCNDto.NotificationDate,
					"effectiveDate": $.PCNDetails.PCNDto.EffectiveDate,
					"lastTimeBuyDate": $.PCNDetails.PCNDto.LastTimeBuyDate,
					"lastShipDate": $.PCNDetails.PCNDto.LastShipDate,
					"pcnId": $.PCNDetails.PCNDto.PCNId
				})
				else null
			}) if (not (isEmpty($.PCNDetails))),
			"replacementData": {
				"replacementDto": {
					"replacementComId": $.ReplacementData.ReplacementDto.ReplacementComId,
					"replacementPartNumber": $.ReplacementData.ReplacementDto.ReplacementPartNumber,
					"replacementType": $.ReplacementData.ReplacementDto.ReplacementType
				}
			},
			("crossData": {
				"crossDto": if (typeOf($.CrossData.CrossDto) as String == "Array") ($.CrossData.CrossDto map {
					"crossComId": $.CrossComId,
					"crossPartNumber": $.CrossPartNumber,
					"crossManufacturer": $.CrossManufacturer,
					"crossType": $.CrossType,
					"comment": $.Comment
				})
				else if (typeOf($.CrossData.CrossDto) as String == "Object")
				({
					"crossComId": $.CrossData.CrossDto.CrossComId,
					"crossPartNumber": $.CrossData.CrossDto.CrossPartNumber,
					"crossManufacturer": $.CrossData.CrossDto.CrossManufacturer,
					"crossType": $.CrossData.CrossDto.CrossType,
					"comment": $.CrossData.CrossDto.Comment
				})
				else null
			}) if (not (isEmpty($.CrossData))),
			"averageInventory": $.averageInventory,
			("franchisedInventoryData": {
				"franchisedInventoryDto": if (typeOf($.FranchisedInventoryData.FranchisedInventoryDto) as String == "Array") ($.FranchisedInventoryData.FranchisedInventoryDto map {
					"distributor": $.Distributor,
					"quantity": $.Quantity,
					"buyNowLink": $.BuyNowLink
				})
				else if (typeOf($.FranchisedInventoryData.FranchisedInventoryDto) as String == "Object")
				({
					"distributor": $.FranchisedInventoryData.FranchisedInventoryDto.Distributor,
					"quantity": $.FranchisedInventoryData.FranchisedInventoryDto.Quantity,
					"buyNowLink": $.FranchisedInventoryData.FranchisedInventoryDto.BuyNowLink
				})
				else null
			}) if (not (isEmpty($.FranchisedInventoryData))),
			"pricingData": {
				"minimumPrice": $.PricingData.MinimumPrice,
				"averagePrice": $.PricingData.AveragePrice,
				"minLeadtime": $.PricingData.MinLeadtime,
				"maxleadtime": $.PricingData.Maxleadtime,
				"lastUpdatedate": $.PricingData.LastUpdatedate
			},
			"riskData": {
				"rohsRisk": $.RiskData.RohsRisk,
				"multiSourcingRisk": $.RiskData.MultiSourcingRisk,
				"inventoryRisk": $.RiskData.InventoryRisk,
				"lifecycleRisk": $.RiskData.LifecycleRisk,
				"predictedObsolescenceYear": $.RiskData.PredictedObsolescenceYear,
				"lifecycleStage": $.RiskData.LifecycleStage,
				"yearsEol": $.RiskData.YearsEOL,
				"numberOfDistributors": $.RiskData.NumberOfDistributors,
				"numberOfOtherSources": $.RiskData.NumberOfOtherSources,
				"crossesPartCategory": $.RiskData.CrossesPartCategory,
				"seGrade": $.RiskData.SEGrade,
				"lastUpdateDate": $.RiskData.LastUpdateDate,
				"yeolComment": $.RiskData.YeolComment
			},
			"history": {
				("datasheet": if (typeOf($.History.Datasheet) as String == "Array") ($.History.Datasheet map {
					"date": $.date,
					"url": $.url
				})
				else if (typeOf($.History.Datasheet) as String == "Object") 
				({
					"date": $.History.Datasheet.date,
					"url": $.History.Datasheet.url
				})
				else null)  if (not (isEmpty($.History.Datasheet))),
				("lifecycle": if (typeOf($.History.Lifecycle) as String == "Array") ($.History.Lifecycle map {
					"date": $.Date,
					"lifecycle": $.Lifecycle,
					"partNumber": $.PartNumber,
					"manufacturerName": $.ManufacturerName,
					"reasonOfChange": $.ReasonOfChange,
					"sourceName": $.SourceName,
					"sourceUrl": $.SourceURL
				}) 
				else if (typeOf($.History.Lifecycle) as String == "Object") 
				({
					"date": $.History.Lifecycle.Date,
					"lifecycle": $.History.Lifecycle.Lifecycle,
					"partNumber": $.History.Lifecycle.PartNumber,
					"manufacturerName": $.History.Lifecycle.ManufacturerName,
					"reasonOfChange": $.History.Lifecycle.ReasonOfChange,
					"sourceName": $.History.Lifecycle.SourceName,
					"sourceUrl": $.History.Lifecycle.SourceURL
				})
				else null) if (not (isEmpty($.History.Lifecycle)))
			},
			"productImage": {
				"productImageSmall": $.ProductImage.ProductImageSmall,
				"productImageLarge": $.ProductImage.ProductImageLarge
			},
			"ecadModelsData": {
				"ecadModelsDto": {
					"ecadurl": $.ECADModelsData.ECADModelsDto.ECADURL
				}
			},
			"designResourcesData": {
				"pinOutData": {
					"pinOuts": $.DesignResourcesData.PinOutData.PinOuts,
					"cadPinOuts": $.DesignResourcesData.PinOutData.CadPinOuts
				},
				"refDesignData": $.DesignResourcesData.RefDesignData
			},
			("priceBreaksData": {
				"priceBreaksDto": if (typeOf($.PriceBreaksData.PriceBreaksDto) as String == "Array") ($.PriceBreaksData.PriceBreaksDto map {
					"priceBreaK": $.PriceBreaK,
					"averagePrice": $.AveragePrice,
					"minPrice": $.MinPrice
				})
				else if (typeOf($.PriceBreaksData.PriceBreaksDto) as String == "Object")
				({
					"priceBreaK": $.PriceBreaksData.PriceBreaksDto.PriceBreaK,
					"averagePrice": $.PriceBreaksData.PriceBreaksDto.AveragePrice,
					"minPrice": $.PriceBreaksData.PriceBreaksDto.MinPrice
				})
				else null
			}) if (not (isEmpty($.PriceBreaksData))),
			("allPackageData": {
				"feature": if (typeOf($.AllPackageData.Feature) as String == "Array") ($.AllPackageData.Feature map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureId,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf($.AllPackageData.Feature) as String == "Object") 
				({
					"featureName": $.AllPackageData.Feature.FeatureName,
					"featureValue": $.AllPackageData.Feature.FeatureValue,
					"featureUnit": $.AllPackageData.Feature.FeatureUnit,
					"featureId": $.AllPackageData.Feature.FeatureId,
					"featureValueDetails": {
						"value": $.AllPackageData.Feature.FeatureValueDetails.value,
						"sign": $.AllPackageData.Feature.FeatureValueDetails.sign,
						"unit": $.AllPackageData.Feature.FeatureValueDetails.unit,
						"multiplier": $.AllPackageData.Feature.FeatureValueDetails.multiplier,
						"multiplierValue": $.AllPackageData.Feature.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty($.AllPackageData)))
		})
		else if (typeOf(payload.Results.ResultDto) as String == "Object") ({
			"requestedComId": payload.Results.ResultDto.RequestedComID,
			"summaryData": {
				"dataProviderId": payload.Results.ResultDto.SummaryData.DataProviderID,
				"partNumber": payload.Results.ResultDto.SummaryData.PartNumber,
				"manufacturer": payload.Results.ResultDto.SummaryData.Manufacturer,
				"manufacturerId": payload.Results.ResultDto.SummaryData.ManufacturerID,
				"partDescription": payload.Results.ResultDto.SummaryData.PartDescription,
				"datasheet": payload.Results.ResultDto.SummaryData.Datasheet,
				"onlineSupplierDatasheetUrl": payload.Results.ResultDto.SummaryData.OnlineSupplierDatasheetURL,
				"radHard": payload.Results.ResultDto.SummaryData.RadHard,
				"doseLevel": payload.Results.ResultDto.SummaryData.DoseLevel,
				"taxonomyPath": payload.Results.ResultDto.SummaryData.TaxonomyPath,
				"taxonomyPathIds": payload.Results.ResultDto.SummaryData.TaxonomyPathIDs,
				"eccn": payload.Results.ResultDto.SummaryData.ECCN,
				"unspsc": payload.Results.ResultDto.SummaryData.UNSPSC,
				"otherSources": payload.Results.ResultDto.SummaryData.OtherSources,
				"lastCheckDate": payload.Results.ResultDto.SummaryData.LastCheckDate,
				"partMarking": payload.Results.ResultDto.SummaryData.PartMarking,
				"introductionDate": payload.Results.ResultDto.SummaryData.IntroductionDate,
				"militarySpecifications": payload.Results.ResultDto.SummaryData.MilitarySpecifications,
				"partAliases": {
					"partAlias": payload.Results.ResultDto.SummaryData.PartAliases.PartAlias
				},
				"esdClass": payload.Results.ResultDto.SummaryData.ESDClass,
				"esdSourceofInformation": payload.Results.ResultDto.SummaryData.ESDSourceofInformation,
				"authorizedDistributors": payload.Results.ResultDto.SummaryData.AuthorizedDistributors,
				"genericName": payload.Results.ResultDto.SummaryData.GenericName,
				"familyName": payload.Results.ResultDto.SummaryData.FamilyName,
				"aecNumber": payload.Results.ResultDto.SummaryData.AECNumber,
				"aecQualified": payload.Results.ResultDto.SummaryData.AECQualified,
				"automotive": payload.Results.ResultDto.SummaryData.Automotive,
				"supplierCageCode": payload.Results.ResultDto.SummaryData.SupplierCageCode,
				"eurohs": payload.Results.ResultDto.SummaryData.EURoHS,
				"rohsVersion": payload.Results.ResultDto.SummaryData.RoHSVersion,
				"scheduleB": payload.Results.ResultDto.SummaryData.ScheduleB,
				"htsusa": payload.Results.ResultDto.SummaryData.HTSUSA,
				"ppap": payload.Results.ResultDto.SummaryData.PPAP,
				("countriesOfOrigin": {
					"countryOfOrigin": if (typeOf(payload.Results.ResultDto.SummaryData.CountriesOfOrigin.CountryOfOrigin) as String == "Array") (payload.Results.ResultDto.SummaryData.CountriesOfOrigin.CountryOfOrigin map {
						"country": $.Country,
						"source": $.Source
					})
					else if (typeOf(payload.Results.ResultDto.SummaryData.CountriesOfOrigin.CountryOfOrigin) as String == "Object")
					({
						"country": payload.Results.ResultDto.SummaryData.CountriesOfOrigin.CountryOfOrigin.Country,
						"source": payload.Results.ResultDto.SummaryData.CountriesOfOrigin.CountryOfOrigin.Source
					})
					else null
				}) if (not (isEmpty(payload.Results.ResultDto.SummaryData.CountriesOfOrigin))),
				"usChinaTariffImpact": payload.Results.ResultDto.SummaryData.USChinaTariffImpact,
				"plName": payload.Results.ResultDto.SummaryData.PLName
			},
			"qualifications": {
				"energyEfficiency": {
					"enablingEnergyEfficiency": payload.Results.ResultDto.Qualifications.EnergyEfficiency.EnablingEnergyEfficiency,
					"sourceOfInformation": payload.Results.ResultDto.Qualifications.EnergyEfficiency.SourceOfInformation
				},
				"agencyApprovals": {
					"agency": {
						"agnecy": payload.Results.ResultDto.Qualifications.AgencyApprovals.Agency.Agnecy,
						"standard": payload.Results.ResultDto.Qualifications.AgencyApprovals.Agency.Standard,
						"standardDetails": payload.Results.ResultDto.Qualifications.AgencyApprovals.Agency.StandardDetails,
						"fileNumber": payload.Results.ResultDto.Qualifications.AgencyApprovals.Agency.FileNumber,
						"certificationDocument": payload.Results.ResultDto.Qualifications.AgencyApprovals.Agency.CertificationDocument
					}
				},
				"reliability": {
					"fitDetails": {
						"fitDetail": {
							"fit": payload.Results.ResultDto.Qualifications.Reliability.FitDetails.FitDetail.FIT,
							"conditionName": payload.Results.ResultDto.Qualifications.Reliability.FitDetails.FitDetail.ConditionName,
							"conditionValue": payload.Results.ResultDto.Qualifications.Reliability.FitDetails.FitDetail.ConditionValue
						}
					},
					"mtbfDetails": {
						"mtbfDetail": {
							"mtbf": payload.Results.ResultDto.Qualifications.Reliability.MTBFDetails.MTBFDetail.MTBF,
							"conditionName": payload.Results.ResultDto.Qualifications.Reliability.MTBFDetails.MTBFDetail.ConditionName,
							"conditionValue": payload.Results.ResultDto.Qualifications.Reliability.MTBFDetails.MTBFDetail.ConditionValue
						}
					},
					"sourceOfInformation": payload.Results.ResultDto.Qualifications.Reliability.SourceOfInformation,
					"flammabilityRating": payload.Results.ResultDto.Qualifications.Reliability.FlammabilityRating
				}
			},
			"lifeCycleData": {
				"partStatus": payload.Results.ResultDto.LifeCycleData.PartStatus,
				"ltbDate": payload.Results.ResultDto.LifeCycleData.LTBDate,
				"source": payload.Results.ResultDto.LifeCycleData.Source,
				"estimatedYearsToEOL": payload.Results.ResultDto.LifeCycleData.EstimatedYearsToEOL,
				"estimatedEOLDate": payload.Results.ResultDto.LifeCycleData.EstimatedEOLDate,
				"partLifecycleStage": payload.Results.ResultDto.LifeCycleData.PartLifecycleStage,
				"minimumEstimatedYearsToEOL": payload.Results.ResultDto.LifeCycleData.MinimumEstimatedYearsToEOL,
				"maximumEstimatedYearsToEOL": payload.Results.ResultDto.LifeCycleData.MaximumEstimatedYearsToEOL,
				"lifeCycleRiskGrade": payload.Results.ResultDto.LifeCycleData.LifeCycleRiskGrade,
				"overallRisk": payload.Results.ResultDto.LifeCycleData.OverallRisk,
				"partCounterfeitReports": payload.Results.ResultDto.LifeCycleData.PartCounterfeitReports,
				"partLifecycleCode": payload.Results.ResultDto.LifeCycleData.PartLifecycleCode
			},
			"fullCounterfeitData": {
				"counterfeitOverallRisk": payload.Results.ResultDto.FullCounterfeitData.CounterfeitOverallRisk,
				"partNumCounterfeitReportsCount": payload.Results.ResultDto.FullCounterfeitData.PartNumCounterfeitReportsCount,
				"manCounterfeitReportsCount": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReportsCount,
				("manCounterfeitReports": if (typeOf(payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports) as String == "Array") (payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports map {
					"mpn": $.MPN,
					"supplier": $.Supplier,
					"notificationDate": $.NotificationDate,
					"counterfitMethods": $.CounterfitMethods,
					"description": $.Description,
					"source": $.Source
				})
				else if (typeOf(payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports) as String == "Object") 
				({
					"mpn": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.MPN,
					"supplier": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.Supplier,
					"notificationDate": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.NotificationDate,
					"counterfitMethods": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.CounterfitMethods,
					"description": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.Description,
					"source": payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports.Source
				})
				else null) if (not (isEmpty(payload.Results.ResultDto.FullCounterfeitData.ManCounterfeitReports))),
				"plCounterfeitReportsCount": payload.Results.ResultDto.FullCounterfeitData.PlCounterfeitReportsCount,
				"currentLifecycleStatus": payload.Results.ResultDto.FullCounterfeitData.CurrentLifecycleStatus,
				"timeSinceMarketIntroduction": payload.Results.ResultDto.FullCounterfeitData.TimeSinceMarketIntroduction,
				"authorizedDistributorswithStockCount": payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockCount,
				("authorizedDistributorswithStockReports": if (typeOf(payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports) as String == "Array") (payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports map {
					"date": $.Date,
					"avgQuantity": $.AvgQuantity,
					"inventory": $.Inventory
				})
				else if (typeOf(payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports) as String == "Object") 
				({
					"date": payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports.Date,
					"avgQuantity": payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports.AvgQuantity,
					"inventory": payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports.Inventory
				})
				else null) if (not (isEmpty(payload.Results.ResultDto.FullCounterfeitData.AuthorizedDistributorswithStockReports))),
				"historicalShortagesInventoryReported": payload.Results.ResultDto.FullCounterfeitData.HistoricalShortagesInventoryReported,
				"isPopularPart": payload.Results.ResultDto.FullCounterfeitData.IsPopularPart
			},
			("parametricData": {
				"features": if (typeOf(payload.Results.ResultDto.ParametricData.Features) as String == "Array") (payload.Results.ResultDto.ParametricData.Features map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureID,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf(payload.Results.ResultDto.ParametricData.Features) as String == "Object") 
				({
					"featureName": payload.Results.ResultDto.ParametricData.Features.FeatureName,
					"featureValue": payload.Results.ResultDto.ParametricData.Features.FeatureValue,
					"featureUnit": payload.Results.ResultDto.ParametricData.Features.FeatureUnit,
					"featureId": payload.Results.ResultDto.ParametricData.Features.FeatureID,
					"featureValueDetails": {
						"value": payload.Results.ResultDto.ParametricData.Features.FeatureValueDetails.value,
						"sign": payload.Results.ResultDto.ParametricData.Features.FeatureValueDetails.sign,
						"unit": payload.Results.ResultDto.ParametricData.Features.FeatureValueDetails.unit,
						"multiplier": payload.Results.ResultDto.ParametricData.Features.FeatureValueDetails.multiplier,
						"multiplierValue": payload.Results.ResultDto.ParametricData.Features.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.ParametricData))),
			"packagingData": {
				"packagingSuffix": payload.Results.ResultDto.PackagingData.PackagingSuffix,
				"packaging": payload.Results.ResultDto.PackagingData.Packaging,
				"quantityOfPackaging": payload.Results.ResultDto.PackagingData.QuantityOfPackaging,
				"reelDiameter": payload.Results.ResultDto.PackagingData.ReelDiameter,
				"reelWidth": payload.Results.ResultDto.PackagingData.ReelWidth,
				"tapePitch": payload.Results.ResultDto.PackagingData.TapePitch,
				"tapeWidth": payload.Results.ResultDto.PackagingData.TapeWidth,
				"feedHolePitch": payload.Results.ResultDto.PackagingData.FeedHolePitch,
				"holeCenterToComponentCenter": payload.Results.ResultDto.PackagingData.HoleCenterToComponentCenter,
				"leadClinchHeight": payload.Results.ResultDto.PackagingData.LeadClinchHeight,
				"componentOrientation": payload.Results.ResultDto.PackagingData.ComponentOrientation,
				"packagingDocument": payload.Results.ResultDto.PackagingData.PackagingDocument,
				"tapeMaterial": payload.Results.ResultDto.PackagingData.TapeMaterial,
				"tapeType": payload.Results.ResultDto.PackagingData.TapeType
			},
			("packageData": {
				"feature": if (typeOf(payload.Results.ResultDto.PackageData.Feature) as String == "Array") (payload.Results.ResultDto.PackageData.Feature map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureId,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf(payload.Results.ResultDto.PackageData.Feature) as String == "Object") 
				({
					"featureName": payload.Results.ResultDto.PackageData.Feature.FeatureName,
					"featureValue": payload.Results.ResultDto.PackageData.Feature.FeatureValue,
					"featureUnit": payload.Results.ResultDto.PackageData.Feature.FeatureUnit,
					"featureId": payload.Results.ResultDto.PackageData.Feature.FeatureId,
					"featureValueDetails": {
						"value": payload.Results.ResultDto.PackageData.Feature.FeatureValueDetails.value,
						"sign": payload.Results.ResultDto.PackageData.Feature.FeatureValueDetails.sign,
						"unit": payload.Results.ResultDto.PackageData.Feature.FeatureValueDetails.unit,
						"multiplier": payload.Results.ResultDto.PackageData.Feature.FeatureValueDetails.multiplier,
						"multiplierValue": payload.Results.ResultDto.PackageData.Feature.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.PackageData))),
			"manufacturingData": {
				"msl": payload.Results.ResultDto.ManufacturingData.MSL,
				"leadFinishPlating": payload.Results.ResultDto.ManufacturingData.LeadFinishPlating,
				"terminalBaseMaterial": payload.Results.ResultDto.ManufacturingData.TerminalBaseMaterial,
				"maximumReflowTemperature": payload.Results.ResultDto.ManufacturingData.MaximumReflowTemperature,
				"reflowSolderTime": payload.Results.ResultDto.ManufacturingData.ReflowSolderTime,
				"numberOfReflowCycle": payload.Results.ResultDto.ManufacturingData.NumberOfReflowCycle,
				"standard": payload.Results.ResultDto.ManufacturingData.Standard,
				"maximumWaveTemperature": payload.Results.ResultDto.ManufacturingData.MaximumWaveTemperature,
				"waveSolderTime": payload.Results.ResultDto.ManufacturingData.WaveSolderTime,
				"underPlatingMaterial": payload.Results.ResultDto.ManufacturingData.UnderPlatingMaterial,
				"reflowTempSource": payload.Results.ResultDto.ManufacturingData.ReflowTempSource,
				"waveTempSource": payload.Results.ResultDto.ManufacturingData.WaveTempSource,
				"underPlatingPorosityFree": payload.Results.ResultDto.ManufacturingData.UnderPlatingPorosityFree
			},
			("chemicalData": {
				"chemicalDto": if (typeOf(payload.Results.ResultDto.ChemicalData.ChemicalDto) as String == "Array") (payload.Results.ResultDto.ChemicalData.ChemicalDto map {
					"totalMassInGram": $.TotalMassInGram,
					"totalMassSummationInGram": $.TotalMassSummationInGram,
					"locationName": $.LocationName,
					"homogenousMaterial": $.HomogenousMaterial,
					"homogenousMaterialMass": $.HomogenousMaterialMass,
					"substanceIdentification": $.SubstanceIdentification,
					"normalizedSubstance": $.NormalizedSubstance,
					"substanceGroup": $.SubstanceGroup,
					"substanceMass": $.SubstanceMass,
					"ppm": $.PPM,
					"casNumber": $.CASNumber,
					"mdsurl": $.MDSURL,
					"itemSubItem": $.ItemSubItem
				})
				else if (typeOf(payload.Results.ResultDto.ChemicalData.ChemicalDto) as String == "Object") 
				({
					"totalMassInGram": payload.Results.ResultDto.ChemicalData.ChemicalDto.TotalMassInGram,
					"totalMassSummationInGram": payload.Results.ResultDto.ChemicalData.ChemicalDto.TotalMassSummationInGram,
					"locationName": payload.Results.ResultDto.ChemicalData.ChemicalDto.LocationName,
					"homogenousMaterial": payload.Results.ResultDto.ChemicalData.ChemicalDto.HomogenousMaterial,
					"homogenousMaterialMass": payload.Results.ResultDto.ChemicalData.ChemicalDto.HomogenousMaterialMass,
					"substanceIdentification": payload.Results.ResultDto.ChemicalData.ChemicalDto.SubstanceIdentification,
					"normalizedSubstance": payload.Results.ResultDto.ChemicalData.ChemicalDto.NormalizedSubstance,
					"substanceGroup": payload.Results.ResultDto.ChemicalData.ChemicalDto.SubstanceGroup,
					"substanceMass": payload.Results.ResultDto.ChemicalData.ChemicalDto.SubstanceMass,
					"ppm": payload.Results.ResultDto.ChemicalData.ChemicalDto.PPM,
					"casNumber": payload.Results.ResultDto.ChemicalData.ChemicalDto.CASNumber,
					"mdsurl": payload.Results.ResultDto.ChemicalData.ChemicalDto.MDSURL,
					"itemSubItem": payload.Results.ResultDto.ChemicalData.ChemicalDto.ItemSubItem
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.ChemicalData))),
			"reachData": {
				"reachDto": {
					"cachedSource": payload.Results.ResultDto.ReachData.ReachDto.CachedSource,
					"containsSvhc": payload.Results.ResultDto.ReachData.ReachDto.ContainsSVHC,
					"svhcExceedThresholdLimit": payload.Results.ResultDto.ReachData.ReachDto.SVHCExceedThresholdLimit,
					"svhcListVersion": payload.Results.ResultDto.ReachData.ReachDto.SVHCListVersion,
					"substanceIdentification": payload.Results.ResultDto.ReachData.ReachDto.SubstanceIdentification,
					"substanceLocation": payload.Results.ResultDto.ReachData.ReachDto.SubstanceLocation,
					"substanceConcentration": payload.Results.ResultDto.ReachData.ReachDto.SubstanceConcentration,
					"sourceType": payload.Results.ResultDto.ReachData.ReachDto.SourceType,
					"reachStatus": payload.Results.ResultDto.ReachData.ReachDto.ReachStatus,
					"casNumber": payload.Results.ResultDto.ReachData.ReachDto.CASNumber,
					"svhcDateOfInclusion": payload.Results.ResultDto.ReachData.ReachDto.SVHCDateOfInclusion,
					"annexXIV": {
						"sunsetDate": payload.Results.ResultDto.ReachData.ReachDto.AnnexXIV.SunsetDate,
						"applicationDate": payload.Results.ResultDto.ReachData.ReachDto.AnnexXIV.ApplicationDate,
						"authorizationEntryNumber": payload.Results.ResultDto.ReachData.ReachDto.AnnexXIV.AuthorizationEntryNumber,
						"exemptedCategories": payload.Results.ResultDto.ReachData.ReachDto.AnnexXIV.ExemptedCategories
					}
				}
			},
			"environmentalDto": {
				"rohsStatus": payload.Results.ResultDto.EnvironmentalDto.RoHSStatus,
				"rohsVersion": payload.Results.ResultDto.EnvironmentalDto.RoHSVersion,
				"source": payload.Results.ResultDto.EnvironmentalDto.Source,
				"sourceType": payload.Results.ResultDto.EnvironmentalDto.SourceType,
				"exemption": payload.Results.ResultDto.EnvironmentalDto.Exemption,
				"exemptionType": payload.Results.ResultDto.EnvironmentalDto.ExemptionType,
				"exemptionCodes": payload.Results.ResultDto.EnvironmentalDto.ExemptionCodes,
				"exemptionExpirationDate": payload.Results.ResultDto.EnvironmentalDto.ExemptionExpirationDate,
				"rohsIdentifier": payload.Results.ResultDto.EnvironmentalDto.RohsIdentifier,
				"leadFree": payload.Results.ResultDto.EnvironmentalDto.LeadFree,
				"rareEarthElementInformation": payload.Results.ResultDto.EnvironmentalDto.RareEarthElementInformation,
				"conflictMineralStatus": payload.Results.ResultDto.EnvironmentalDto.ConflictMineralStatus,
				"conflictMineralStatement": payload.Results.ResultDto.EnvironmentalDto.ConflictMineralStatement,
				"eiccMembership": payload.Results.ResultDto.EnvironmentalDto.EICCMembership,
				"eiccTemplate": payload.Results.ResultDto.EnvironmentalDto.EICCTemplate,
				"eiccTemplateVersion": payload.Results.ResultDto.EnvironmentalDto.EICCTemplateVersion,
				"halgonFree": payload.Results.ResultDto.EnvironmentalDto.HalgonFree,
				"chinaRohs": {
					"chinaRohsStatus": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.ChinaRoHSStatus,
					"cadmiumConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.CadmiumConcentration,
					"cadmiumFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.CadmiumFlag,
					"chromiumConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.ChromiumConcentration,
					"chromiumFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.ChromiumFlag,
					"leadConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.LeadConcentration,
					"leadFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.LeadFlag,
					"mercuryConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.MercuryConcentration,
					"mercuryFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.MercuryFlag,
					"pbbConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.PBBConcentration,
					"pbbFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.PBBFlag,
					"pbdeConcentration": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.PBDEConcentration,
					"pbdeFlag": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.PBDEFlag,
					"epup": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.EPUP,
					"itemSubitemName": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.ItemSubitemName,
					"sourceType": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.SourceType,
					"cachedSource": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.CachedSource,
					"liveSupplierSource": payload.Results.ResultDto.EnvironmentalDto.ChinaRoHS.LiveSupplierSource
				},
				"exemptionDetails": payload.Results.ResultDto.EnvironmentalDto.ExemptionDetails
			},
			"gidepData": {
				"typeOfChange": payload.Results.ResultDto.GidepData.TypeOfChange,
				"gidepDescription": payload.Results.ResultDto.GidepData.GIDEPDescription,
				"notificationDate": payload.Results.ResultDto.GidepData.NotificationDate,
				"documentNumber": payload.Results.ResultDto.GidepData.DocumentNumber
			},
			"pcnData": {
				"pcnDto": {
					"lastPcnNumber": payload.Results.ResultDto.PCNData.PCNDto.LastPCNNumber,
					"lastPcnDate": payload.Results.ResultDto.PCNData.PCNDto.LastPCNDate,
					"lastPcnTypeOfChange": payload.Results.ResultDto.PCNData.PCNDto.LastPCNTypeOfChange,
					"lastPcnSource": payload.Results.ResultDto.PCNData.PCNDto.LastPCNSource,
					"lastEolNumber": payload.Results.ResultDto.PCNData.PCNDto.LastEOLNumber,
					"lastEolDate": payload.Results.ResultDto.PCNData.PCNDto.LastEOLDate,
					"lastEolSource": payload.Results.ResultDto.PCNData.PCNDto.LastEOLSource
				}
			},
			("pcnDetails": {
				"pcnDto":  if (typeOf(payload.Results.ResultDto.PCNDetails.PCNDto) as String == "Array") (payload.Results.ResultDto.PCNDetails.PCNDto map {
					"pcnNumber": $.PCNNumber,
					"typeOfChange": $.TypeOfChange,
					"descriptionOfChange": $.DescriptionOfChange,
					"pcnSource": $.PcnSource,
					"notificationDate": $.NotificationDate,
					"effectiveDate": $.EffectiveDate,
					"lastTimeBuyDate": $.LastTimeBuyDate,
					"lastShipDate": $.LastShipDate,
					"pcnId": $.PCNId
				})
				else if (typeOf(payload.Results.ResultDto.PCNDetails.PCNDto) as String == "Object")
				({
					"pcnNumber": payload.Results.ResultDto.PCNDetails.PCNDto.PCNNumber,
					"typeOfChange": payload.Results.ResultDto.PCNDetails.PCNDto.TypeOfChange,
					"descriptionOfChange": payload.Results.ResultDto.PCNDetails.PCNDto.DescriptionOfChange,
					"pcnSource": payload.Results.ResultDto.PCNDetails.PCNDto.PcnSource,
					"notificationDate": payload.Results.ResultDto.PCNDetails.PCNDto.NotificationDate,
					"effectiveDate": payload.Results.ResultDto.PCNDetails.PCNDto.EffectiveDate,
					"lastTimeBuyDate": payload.Results.ResultDto.PCNDetails.PCNDto.LastTimeBuyDate,
					"lastShipDate": payload.Results.ResultDto.PCNDetails.PCNDto.LastShipDate,
					"pcnId": payload.Results.ResultDto.PCNDetails.PCNDto.PCNId
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.PCNDetails))),
			"replacementData": {
				"replacementDto": {
					"replacementComId": payload.Results.ResultDto.ReplacementData.ReplacementDto.ReplacementComId,
					"replacementPartNumber": payload.Results.ResultDto.ReplacementData.ReplacementDto.ReplacementPartNumber,
					"replacementType": payload.Results.ResultDto.ReplacementData.ReplacementDto.ReplacementType
				}
			},
			("crossData": {
				"crossDto": if (typeOf(payload.Results.ResultDto.CrossData.CrossDto) as String == "Array") (payload.Results.ResultDto.CrossData.CrossDto map {
					"crossComId": $.CrossComId,
					"crossPartNumber": $.CrossPartNumber,
					"crossManufacturer": $.CrossManufacturer,
					"crossType": $.CrossType,
					"comment": $.Comment
				})
				else if (typeOf(payload.Results.ResultDto.CrossData.CrossDto) as String == "Object")
				({
					"crossComId": payload.Results.ResultDto.CrossData.CrossDto.CrossComId,
					"crossPartNumber": payload.Results.ResultDto.CrossData.CrossDto.CrossPartNumber,
					"crossManufacturer": payload.Results.ResultDto.CrossData.CrossDto.CrossManufacturer,
					"crossType": payload.Results.ResultDto.CrossData.CrossDto.CrossType,
					"comment": payload.Results.ResultDto.CrossData.CrossDto.Comment
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.CrossData))),
			"averageInventory": payload.Results.ResultDto.averageInventory,
			("franchisedInventoryData": {
				"franchisedInventoryDto": if (typeOf(payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto) as String == "Array") (payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto map {
					"distributor": $.Distributor,
					"quantity": $.Quantity,
					"buyNowLink": $.BuyNowLink
				})
				else if (typeOf(payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto) as String == "Object")
				({
					"distributor": payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto.Distributor,
					"quantity": payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto.Quantity,
					"buyNowLink": payload.Results.ResultDto.FranchisedInventoryData.FranchisedInventoryDto.BuyNowLink
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.FranchisedInventoryData))),
			"pricingData": {
				"minimumPrice": payload.Results.ResultDto.PricingData.MinimumPrice,
				"averagePrice": payload.Results.ResultDto.PricingData.AveragePrice,
				"minLeadtime": payload.Results.ResultDto.PricingData.MinLeadtime,
				"maxleadtime": payload.Results.ResultDto.PricingData.Maxleadtime,
				"lastUpdatedate": payload.Results.ResultDto.PricingData.LastUpdatedate
			},
			"riskData": {
				"rohsRisk": payload.Results.ResultDto.RiskData.RohsRisk,
				"multiSourcingRisk": payload.Results.ResultDto.RiskData.MultiSourcingRisk,
				"inventoryRisk": payload.Results.ResultDto.RiskData.InventoryRisk,
				"lifecycleRisk": payload.Results.ResultDto.RiskData.LifecycleRisk,
				"predictedObsolescenceYear": payload.Results.ResultDto.RiskData.PredictedObsolescenceYear,
				"lifecycleStage": payload.Results.ResultDto.RiskData.LifecycleStage,
				"yearsEol": payload.Results.ResultDto.RiskData.YearsEOL,
				"numberOfDistributors": payload.Results.ResultDto.RiskData.NumberOfDistributors,
				"numberOfOtherSources": payload.Results.ResultDto.RiskData.NumberOfOtherSources,
				"crossesPartCategory": payload.Results.ResultDto.RiskData.CrossesPartCategory,
				"seGrade": payload.Results.ResultDto.RiskData.SEGrade,
				"lastUpdateDate": payload.Results.ResultDto.RiskData.LastUpdateDate,
				"yeolComment": payload.Results.ResultDto.RiskData.YeolComment
			},
			"history": {
				("datasheet": if (typeOf(payload.Results.ResultDto.History.Datasheet) as String == "Array") (payload.Results.ResultDto.History.Datasheet map {
					"date": $.date,
					"url": $.url
				})
				else if (typeOf(payload.Results.ResultDto.History.Datasheet) as String == "Object") 
				({
					"date": payload.Results.ResultDto.History.Datasheet.date,
					"url": payload.Results.ResultDto.History.Datasheet.url
				})
				else null)  if (not (isEmpty(payload.Results.ResultDto.History.Datasheet))),
				("lifecycle": if (typeOf(payload.Results.ResultDto.History.Lifecycle) as String == "Array") (payload.Results.ResultDto.History.Lifecycle map {
					"date": $.Date,
					"lifecycle": $.Lifecycle,
					"partNumber": $.PartNumber,
					"manufacturerName": $.ManufacturerName,
					"reasonOfChange": $.ReasonOfChange,
					"sourceName": $.SourceName,
					"sourceUrl": $.SourceURL
				}) 
				else if (typeOf(payload.Results.ResultDto.History.Lifecycle) as String == "Object") 
				({
					"date": payload.Results.ResultDto.History.Lifecycle.Date,
					"lifecycle": payload.Results.ResultDto.History.Lifecycle.Lifecycle,
					"partNumber": payload.Results.ResultDto.History.Lifecycle.PartNumber,
					"manufacturerName": payload.Results.ResultDto.History.Lifecycle.ManufacturerName,
					"reasonOfChange": payload.Results.ResultDto.History.Lifecycle.ReasonOfChange,
					"sourceName": payload.Results.ResultDto.History.Lifecycle.SourceName,
					"sourceUrl": payload.Results.ResultDto.History.Lifecycle.SourceURL
				})
				else null) if (not (isEmpty(payload.Results.ResultDto.History.Lifecycle)))
			},
			"productImage": {
				"productImageSmall": payload.Results.ResultDto.ProductImage.ProductImageSmall,
				"productImageLarge": payload.Results.ResultDto.ProductImage.ProductImageLarge
			},
			"ecadModelsData": {
				"ecadModelsDto": {
					"ecadurl": payload.Results.ResultDto.ECADModelsData.ECADModelsDto.ECADURL
				}
			},
			"designResourcesData": {
				"pinOutData": {
					"pinOuts": payload.Results.ResultDto.DesignResourcesData.PinOutData.PinOuts,
					"cadPinOuts": payload.Results.ResultDto.DesignResourcesData.PinOutData.CadPinOuts
				},
				"refDesignData": payload.Results.ResultDto.DesignResourcesData.RefDesignData
			},
			("priceBreaksData": {
				"priceBreaksDto": if (typeOf(payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto) as String == "Array") (payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto map {
					"priceBreaK": $.PriceBreaK,
					"averagePrice": $.AveragePrice,
					"minPrice": $.MinPrice
				})
				else if (typeOf(payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto) as String == "Object")
				({
					"priceBreaK": payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto.PriceBreaK,
					"averagePrice": payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto.AveragePrice,
					"minPrice": payload.Results.ResultDto.PriceBreaksData.PriceBreaksDto.MinPrice
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.PriceBreaksData))),
			("allPackageData": {
				"feature": if (typeOf(payload.Results.ResultDto.AllPackageData.Feature) as String == "Array") (payload.Results.ResultDto.AllPackageData.Feature map {
					"featureName": $.FeatureName,
					"featureValue": $.FeatureValue,
					"featureUnit": $.FeatureUnit,
					"featureId": $.FeatureId,
					"featureValueDetails": {
						"value": $.FeatureValueDetails.value,
						"sign": $.FeatureValueDetails.sign,
						"unit": $.FeatureValueDetails.unit,
						"multiplier": $.FeatureValueDetails.multiplier,
						"multiplierValue": $.FeatureValueDetails.multiplierValue
					}
				})
				else if (typeOf(payload.Results.ResultDto.AllPackageData.Feature) as String == "Object") 
				({
					"featureName": payload.Results.ResultDto.AllPackageData.Feature.FeatureName,
					"featureValue": payload.Results.ResultDto.AllPackageData.Feature.FeatureValue,
					"featureUnit": payload.Results.ResultDto.AllPackageData.Feature.FeatureUnit,
					"featureId": payload.Results.ResultDto.AllPackageData.Feature.FeatureId,
					"featureValueDetails": {
						"value": payload.Results.ResultDto.AllPackageData.Feature.FeatureValueDetails.value,
						"sign": payload.Results.ResultDto.AllPackageData.Feature.FeatureValueDetails.sign,
						"unit": payload.Results.ResultDto.AllPackageData.Feature.FeatureValueDetails.unit,
						"multiplier": payload.Results.ResultDto.AllPackageData.Feature.FeatureValueDetails.multiplier,
						"multiplierValue": payload.Results.ResultDto.AllPackageData.Feature.FeatureValueDetails.multiplierValue
					}
				})
				else null
			}) if (not (isEmpty(payload.Results.ResultDto.AllPackageData)))
		})
		else null
	}) if (payload.Status.Code == "0")
}