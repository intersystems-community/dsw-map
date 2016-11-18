/// 
Class RF.BI.RFCube Extends %DeepSee.CubeDefinition [ DependsOn = RF.Region, ProcedureBlock ]
{

Parameter DOMAIN;

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="RFCube" displayName="RFCube" disabled="false" abstract="false" sourceClass="RF.Region" buildRestriction="hlevel=3" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0">
  <dimension name="HLevel" disabled="false" hasAll="false" allCaption="All HLevel" allDisplayName="HLevel" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false">
      <level sourceExpression="%cube.GetRegion(%source.Guid,0)" name="Part" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceExpression="%cube.GetNameforLevel(%source.Guid,0)" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,0,1)" name="Population" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,0,2)" name="Area" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,70000000,%cube.ValueforLevel(%source.Guid,0,1))" name="PopColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,7000000,%cube.ValueforLevel(%source.Guid,0,2))" name="AreaColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLatitudeforLevel(%source.Guid,0)" name="Latitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLongitudeforLevel(%source.Guid,0)" name="Longitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetGUIDforLevel(%source.Guid,0)" name="Guid" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;Marker hint=&quot;_%cube.GetNameforLevel(%source.Guid,0)" name="MarkerTitle" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;&lt;b&gt; Marker Popup Content &lt;/b&gt; &lt;p&gt;&quot;_%cube.GetNameforLevel(%source.Guid,0)" name="MarkerPopupContent" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
      </level>
      <level sourceExpression="%cube.GetRegion(%source.Guid,1)" name="District" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceExpression="%cube.GetNameforLevel(%source.Guid,1)" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,1,1)" name="Population" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,1,2)" name="Area" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,16000000,%cube.ValueforLevel(%source.Guid,1,1))" name="PopColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,25000000,%cube.ValueforLevel(%source.Guid,1,2))" name="AreaColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLatitudeforLevel(%source.Guid,1)" name="Latitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLongitudeforLevel(%source.Guid,1)" name="Longitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetGUIDforLevel(%source.Guid,1)" name="Guid" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;Marker hint=&quot;_%cube.GetNameforLevel(%source.Guid,1)" name="MarkerTitle" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
             <property sourceExpression="&quot;&lt;b&gt; Marker Popup Content &lt;/b&gt; &lt;p&gt;&quot;_%cube.GetNameforLevel(%source.Guid,1)" name="MarkerPopupContent" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>

      </level>
      <level sourceExpression="%cube.GetRegion(%source.Guid,2)" name="Region" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceExpression="%cube.GetNameforLevel(%source.Guid,2)" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,2,1)" name="Population" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.ValueforLevel(%source.Guid,2,2)" name="Area" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,16000000,%cube.ValueforLevel(%source.Guid,2,1))" name="PopColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetColor(0,1000000,%cube.ValueforLevel(%source.Guid,2,2))" name="AreaColor" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLatitudeforLevel(%source.Guid,2)" name="Latitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetLongitudeforLevel(%source.Guid,2)" name="Longitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetGUIDforLevel(%source.Guid,2)" name="Guid" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;Marker hint=&quot;_%cube.GetNameforLevel(%source.Guid,2)" name="MarkerTitle" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
            <property sourceExpression="&quot;&lt;b&gt; Marker Popup Content &lt;/b&gt; &lt;p&gt;&quot;_%cube.GetNameforLevel(%source.Guid,2)" name="MarkerPopupContent" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>

      </level>
      <level sourceExpression="%cube.GetRegion(%source.Guid,3)" name="City" disabled="false" list="false" useDisplayValue="true" useAsFilter="true">
        <property sourceExpression="%cube.GetNameforLevel(%source.Guid,3)" name="Name" disabled="false" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceProperty="Latitude" name="Latitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceProperty="Longitude" name="Longitude" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="%cube.GetGUIDforLevel(%source.Guid,2)" name="Guid" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
        <property sourceExpression="&quot;Marker hint=&quot;_%cube.GetNameforLevel(%source.Guid,3)" name="MarkerTitle" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>
          <property sourceExpression="&quot;&lt;b&gt; Marker Popup Content &lt;/b&gt; &lt;p&gt;&quot;_%cube.GetNameforLevel(%source.Guid,3)" name="MarkerPopupContent" disabled="false" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false"></property>

      </level>
    </hierarchy>
  </dimension>
</cube>
}

ClassMethod RegionforLevel(guid, level) As %String
{
	s region=##class(RF.Region).%OpenId(guid)
	if '$IsObject(region) return ""
	return $Case(level,
	0:region.ParentGuid.ParentGuid.ParentGuid.Guid,
	1:region.ParentGuid.ParentGuid.Guid,
	2:region.ParentGuid.Guid,
	3:region.Guid,:"")
}

ClassMethod ValueforLevel(guid, level, type) As %Integer
{
	
	//b "L"
	//type=1 - population
	//type=2 - area
	s region=##class(RF.Region).%OpenId(..RegionforLevel(guid,level))
	
	s parameter=##class(RF.ParameterValue).RegionParameterIndexOpen(region.Guid,type)
	return parameter.Value
}

ClassMethod GetNameforLevel(guid, level)
{
	s region=##class(RF.Region).%OpenId(..RegionforLevel(guid,level))
	return region.Name
}

ClassMethod GetGUIDforLevel(guid, level)
{
	s region=##class(RF.Region).%OpenId(..RegionforLevel(guid,level))
	return region.Guid
}

ClassMethod GetLatitudeforLevel(guid, level)
{
	s region=##class(RF.Region).%OpenId(..RegionforLevel(guid,level))
	return region.Latitude
}

ClassMethod GetLongitudeforLevel(guid, level)
{
	s region=##class(RF.Region).%OpenId(..RegionforLevel(guid,level))
	return region.Longitude
}

ClassMethod GetRegion(id, level) As %String
{
	return ..RegionforLevel(id,level)
	
	s region=##class(RF.Region).%OpenId(id)
	
	//s ^AAA(level,region.Name)=id
	//s ^AAA(level,region.Name,0)=region.ParentGuid.ParentGuid.Guid
	//s ^AAA(level,region.Name,1)=region.ParentGuid.Guid
	//s ^AAA(level,region.Name,2)=region.Guid
	
	return ""
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

}

