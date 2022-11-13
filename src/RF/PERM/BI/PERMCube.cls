/// 
Class RF.PERM.BI.PERMCube Extends %DeepSee.CubeDefinition [ DependsOn = RF.PERM.Region, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="PERMCube" displayName="PERMCube" disabled="false" abstract="false" sourceClass="RF.PERM.Region" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="Guid" disabled="false" hasAll="false" allCaption="All Guid" allDisplayName="Guid" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Region" disabled="false" sourceProperty="Guid" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="Name" disabled="false" sourceProperty="Name" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="Population" disabled="false" sourceExpression="%cube.GetValue(%source.Guid,1)" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="Area" disabled="false" sourceExpression="%cube.GetValue(%source.Guid,2)" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="Density" disabled="false" sourceExpression="%cube.GetValue(%source.Guid,3)" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="%ID,DataUrl,Name,ParentRegion-&gt;Guid,ParentRegion-&gt;Name">
  </listing>
</cube>
}

ClassMethod GetColor(min, max, value) As %String
{
	if ('value) return "rgb(0,0,0)"
	
	// Крайние границы: красный и зеленый, цвет для середины - желтый
	set middle = (max + min) / 2
	
	if (value <= middle)
    {
        set redPart = (value - min) / (middle - min)
        return "rgb(" _ (255 * redPart\1) _ ",255, 0)"
    }
    else
    {
        set greenPart = (max - value) / (max - middle)
        return "rgb(255," _(255 * greenPart\1) _ ", 0)"
    }
}

ClassMethod GetValue(guid, type) As %Integer
{
	
	//b "L"
	//type=1 - population
	//type=2 - area
	// density
	s region=##class(RF.PERM.Region).%OpenId(guid)
	if $IsObject(region) {
	s parameter=##class(RF.PERM.ParameterValue).RegionParameterIndexOpen(region.Guid,type)
	if $IsObject(parameter) return parameter.Value}
	return ""
}

Parameter DOMAIN;

}

