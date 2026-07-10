@EndUserText.label: 'Material Display - Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZC_MATERIAL_PSP421
  as projection on I_Product
{
  key Product,
      ProductType,
      IndustrySector,
      ProductGroup,
      OldMaterialNumber,
      ProductHierarchy,
      @Semantics.unitOfMeasure: true
      BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      GrossWeight,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      NetWeight,
      @Semantics.unitOfMeasure: true
      WeightUnit,
      @Semantics.quantity.unitOfMeasure: 'VolumeUnit'
      Volume,
      @Semantics.unitOfMeasure: true
      VolumeUnit,
      ProductCreationDate,
      LastChangeDate,
      IsMarkedForDeletion,
      _ProductDescription.ProductDescription : localized,
      _ProductDescription,
      _ProductType,
      _ProductGroup
}
