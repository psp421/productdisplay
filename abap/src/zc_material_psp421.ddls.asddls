/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
  Projection (Consumption) CDS View for Material Display
  Based on cloud-released standard view: I_Product (API_PRODUCT_SRV)
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
  title:          { type: #STANDARD, value: 'Product' },
  description:    { type: #STANDARD, value: 'ProductDescription' }
}

@Search.searchable: true

define root view entity ZC_Material_PSP421
  as projection on I_Product
{
      /*-- Key --*/
  key Product,

      /*-- Classification --*/
      @EndUserText.label: 'Material Type'
      ProductType,

      @EndUserText.label: 'Industry Sector'
      IndustrySector,

      @EndUserText.label: 'Material Group'
      ProductGroup,

      @EndUserText.label: 'Old Material Number'
      OldMaterialNumber,

      @EndUserText.label: 'Product Hierarchy'
      ProductHierarchy,

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
      ProductCreationDate,

      @EndUserText.label: 'Last Changed On'
      LastChangeDate,

      /*-- Status --*/
      @EndUserText.label: 'Deletion Indicator'
      @UI.hidden: true
      IsMarkedForDeletion,

      /*-- Text (localised) --*/
      @EndUserText.label: 'Material Description'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      _ProductDescription.ProductDescription : localized,

      /*-- Associations --*/
      _ProductDescription,
      _ProductType,
      _ProductGroup
}
