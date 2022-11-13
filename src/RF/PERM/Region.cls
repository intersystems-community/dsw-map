Class RF.PERM.Region Extends (%Persistent, %XML.Adaptor)
{

/// Name of the Region
Property Name As %String(MAXLEN = 500) [ Required ];

/// Guid for polygons in js file
Property Guid As %String(MAXLEN = "") [ Required ];

/// All values
Relationship Parameters As ParameterValue [ Cardinality = many, Inverse = Region ];

Index GuidIdx On Guid [ IdKey, Unique ];

Storage Default
{
<Data name="RegionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>DataUrl</Value>
</Value>
</Data>
<DataLocation>^RF.PERM.RegionD</DataLocation>
<DefaultData>RegionDefaultData</DefaultData>
<IdLocation>^RF.PERM.RegionD</IdLocation>
<IndexLocation>^RF.PERM.RegionI</IndexLocation>
<StreamLocation>^RF.PERM.RegionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

