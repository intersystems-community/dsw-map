/// 
Class USA.BI.USCube Extends %DeepSee.CubeDefinition [ DependsOn = USA.Region, ProcedureBlock ]
{

Parameter DOMAIN;

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="USCube" displayName="USCube" disabled="false" abstract="false" sourceClass="USA.Region" buildRestriction="hlevel=1" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0">
  <dimension name="Region" disabled="false" hasAll="false" allCaption="All Guid" allDisplayName="Guid" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceProperty="ParentRegion" name="State" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceProperty="ParentRegion.Name" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;rgb(0,255,0)&quot;" name="Color" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.ParentRegion.Guid,1)" name="Population" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.ParentRegion.Guid,2)" name="Area" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.ParentRegion.Guid,3)" name="Density" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
      </level>
      <level sourceProperty="Guid" name="County" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceProperty="Name" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.Guid,1)" name="Population" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.Guid,2)" name="Area" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetValue(%source.Guid,3)" name="Density" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
      </level>
    </hierarchy>
  </dimension>
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
	s region=##class(USA.Region).%OpenId(guid)
	if $IsObject(region) {
	s parameter=##class(USA.ParameterValue).RegionParameterIndexOpen(region.Guid,type)
	if $IsObject(parameter) return parameter.Value}
	return ""
}

ClassMethod TermListSetup()
{
 s ^DeepSee.TermList("USMAPSOURCES","caption")	=	"Map Sources"
 s ^DeepSee.TermList("USMAPSOURCES","data","Area","VALUE")	=	"US Map Area.pivot"
 s ^DeepSee.TermList("USMAPSOURCES","data","Density","VALUE")	= "US Map Density.pivot"
 s ^DeepSee.TermList("USMAPSOURCES","data","Population","VALUE")	=	"US Map Population.pivot"
 s ^DeepSee.TermList("USMAPSOURCES","modDate")	=	"2016-03-11 01:36:04"
 s ^DeepSee.TermList("USMAPSOURCES","name")	=	"USMapSources"
 quit
}

}

