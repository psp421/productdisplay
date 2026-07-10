/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
  Projection (Consumption) CDS View for Material Display
  Based on cloud-released standard view: I_Material
  Package : ZPSP421_MATERIAL
  Author  : PSP421
 *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

@EndUserText.label: 'Material Display - Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory:   #M,
  dataClass:      #MASTER
}

@UI.headerInfo: {
  typeName:       'Material',
  typeNamePlural: 'Materials',
  title:          { type: #STANDARD, value: 'Material' },
  description:    { type: #STANDARD, value: 'MaterialName' }
}

@Search.searchable: true

define root view entity ZC_Material_PSP421
  as projection on I_Material
{
      /*-- Key --*/
  key Material,

      /*-- Classification --*/
      @EndUserText.label: 'Material Type'
      MaterialType,

      @EndUserText.label: 'Industry Sector'
      IndustrySector,

      @EndUserText.label: 'Material Group'
      MaterialGroup,

      @EndUserText.label: 'Old Material Number'
      OldMaterialNumber,

      /*-- Units --*/
      @EndUserText.label: 'Base Unit of Measure'
      @Semantics.unitOfMeasure: true
      BaseUnit,

      @EndUserText.label: 'Weight Unit'
      @Semantics.unitOfMeasure: true
      WeightUnit,

      @EndUserText.label: 'Gross Weight'
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      GrossWeight,

      @EndUserText.label: 'Net Weight'
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      NetWeight,

      @EndUserText.label: 'Volume Unit'
      @Semantics.unitOfMeasure: true
      VolumeUnit,

      @EndUserText.label: 'Volume'
      @Semantics.quantity.unitOfMeasure: 'VolumeUnit'
      Volume,

      /*-- Dates --*/
      @EndUserText.label: 'Created On'
      MaterialCreationDate,

      @EndUserText.label: 'Last Changed On'
      @UI.lineItem: [{ position: 110, importance: #LOW }]
      LastChangeDate,

      /*-- Status --*/
      @EndUserText.label: 'Deletion Indicator'
      @UI.hidden: true
      MaterialIsMarkedForDeletion,

      /*-- Text (localised) --*/
      @EndUserText.label: 'Material Description'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      _MaterialText.MaterialName : localized,

      /*-- Associations --*/
      _MaterialText,
      _MaterialType,
      _MaterialGroup
}
