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
	("result": {
		("partData": if (typeOf(payload.Result.PartData) as String == "Array") (payload.Result.PartData map {
			"requestedPart": $.RequestedPart,
			"requestedManufacturer": $.RequestedManufacturer,
			"requestedManufacturerId": $.RequestedManufacturerID,
			"partList": {
				"partDto": if (typeOf($.PartList.PartDto) as String == "Array") ({
					"comId": $.PartList.PartDto.ComID,
					"partNumber": $.PartList.PartDto.PartNumber,
					"manufacturer": $.PartList.PartDto.Manufacturer,
					"plName": $.PartList.PartDto.PlName,
					"description": $.PartList.PartDto.Description,
					"datasheet": $.PartList.PartDto.Datasheet,
					"lifecycle": $.PartList.PartDto.Lifecycle,
					"rohs": $.PartList.PartDto.RoHS,
					"rohsVersion": $.PartList.PartDto.RoHSVersion,
					"matchRating": $.PartList.PartDto.MatchRating,
					"aliasData": $.PartList.PartDto.AliasData,
					"taxonomyPath": $.PartList.PartDto.TaxonomyPath,
					"taxonomyPathId": $.PartList.PartDto.TaxonomyPathID,
					"ecadModels": {
						"schematicSymbol": $.PartList.PartDto.ECADModels.SchematicSymbol,
						"pcbFootprint": $.PartList.PartDto.ECADModels.PCBFootprint,
						"model3d": $.PartList.PartDto.ECADModels.'Model3D'
					}
				})
				else if (typeOf($.PartList.PartDto) as String == "Object") ({
					"comId": $.PartList.PartDto.ComID,
					"partNumber": $.PartList.PartDto.PartNumber,
					"manufacturer": $.PartList.PartDto.Manufacturer,
					"plName": $.PartList.PartDto.PlName,
					"description": $.PartList.PartDto.Description,
					"datasheet": $.PartList.PartDto.Datasheet,
					"lifecycle": $.PartList.PartDto.Lifecycle,
					"rohs": $.PartList.PartDto.RoHS,
					"rohsVersion": $.PartList.PartDto.RoHSVersion,
					"matchRating": $.PartList.PartDto.MatchRating,
					"aliasData": $.PartList.PartDto.AliasData,
					"taxonomyPath": $.PartList.PartDto.TaxonomyPath,
					"taxonomyPathId": $.PartList.PartDto.TaxonomyPathID,
					"ecadModels": {
						"schematicSymbol": $.PartList.PartDto.ECADModels.SchematicSymbol,
						"pcbFootprint": $.PartList.PartDto.ECADModels.PCBFootprint,
						"model3d": $.PartList.PartDto.ECADModels.'Model3D'
					}
				})
				else null
			}
		})
		else if(typeOf(payload.Result.PartData) as String == "Object") ({
			"requestedPart": payload.Result.PartData.RequestedPart,
			"requestedManufacturer": payload.Result.PartData.RequestedManufacturer,
			"requestedManufacturerId": payload.Result.PartData.RequestedManufacturerID,
			"partList": {
				"partDto": if (typeOf(payload.Result.PartData.PartList.PartDto) as String == "Array") ({
					"comId": payload.Result.PartData.PartList.PartDto.ComID,
					"partNumber": payload.Result.PartData.PartList.PartDto.PartNumber,
					"manufacturer": payload.Result.PartData.PartList.PartDto.Manufacturer,
					"plName": payload.Result.PartData.PartList.PartDto.PlName,
					"description": payload.Result.PartData.PartList.PartDto.Description,
					"datasheet": payload.Result.PartData.PartList.PartDto.Datasheet,
					"lifecycle": payload.Result.PartData.PartList.PartDto.Lifecycle,
					"rohs": payload.Result.PartData.PartList.PartDto.RoHS,
					"rohsVersion": payload.Result.PartData.PartList.PartDto.RoHSVersion,
					"matchRating": payload.Result.PartData.PartList.PartDto.MatchRating,
					"aliasData": payload.Result.PartData.PartList.PartDto.AliasData,
					"taxonomyPath": payload.Result.PartData.PartList.PartDto.TaxonomyPath,
					"taxonomyPathId": payload.Result.PartData.PartList.PartDto.TaxonomyPathID,
					"ecadModels": {
						"schematicSymbol": payload.Result.PartData.PartList.PartDto.ECADModels.SchematicSymbol,
						"pcbFootprint": payload.Result.PartData.PartList.PartDto.ECADModels.PCBFootprint,
						"model3d": payload.Result.PartData.PartList.PartDto.ECADModels.'Model3D'
					}
				})
				else if (typeOf(payload.Result.PartData.PartList.PartDto) as String == "Object") ({
					"comId": payload.Result.PartData.PartList.PartDto.ComID,
					"partNumber": payload.Result.PartData.PartList.PartDto.PartNumber,
					"manufacturer": payload.Result.PartData.PartList.PartDto.Manufacturer,
					"plName": payload.Result.PartData.PartList.PartDto.PlName,
					"description": payload.Result.PartData.PartList.PartDto.Description,
					"datasheet": payload.Result.PartData.PartList.PartDto.Datasheet,
					"lifecycle": payload.Result.PartData.PartList.PartDto.Lifecycle,
					"rohs": payload.Result.PartData.PartList.PartDto.RoHS,
					"rohsVersion": payload.Result.PartData.PartList.PartDto.RoHSVersion,
					"matchRating": payload.Result.PartData.PartList.PartDto.MatchRating,
					"aliasData": payload.Result.PartData.PartList.PartDto.AliasData,
					"taxonomyPath": payload.Result.PartData.PartList.PartDto.TaxonomyPath,
					"taxonomyPathId": payload.Result.PartData.PartList.PartDto.TaxonomyPathID,
					"ecadModels": {
						"schematicSymbol": payload.Result.PartData.PartList.PartDto.ECADModels.SchematicSymbol,
						"pcbFootprint": payload.Result.PartData.PartList.PartDto.ECADModels.PCBFootprint,
						"model3d": payload.Result.PartData.PartList.PartDto.ECADModels.'Model3D'
					}
				})
				else null
			}
		})
		else null)
	}) if (payload.Status.Code == "0")
}