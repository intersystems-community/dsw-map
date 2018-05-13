Class KZ.Area Extends (%Persistent, %XML.Adaptor)
{

/// Name of the Region
Property Name As %String(MAXLEN = 500) [ Required ];

/// Guid for polygons in js file
Property Guid As %String [ Required ];

/// Link to Wiki article
Property DataUrl As %String(MAXLEN = 500);

/// All values
Relationship Parameters As ParameterValue [ Cardinality = many, Inverse = Region ];

Index GuidIdx On Guid [ IdKey, Unique ];

Storage Default
{
<Data name="AreaDefaultData">
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
<DataLocation>^KZ.AreaD</DataLocation>
<DefaultData>AreaDefaultData</DefaultData>
<IdLocation>^KZ.AreaD</IdLocation>
<IndexLocation>^KZ.AreaI</IndexLocation>
<StreamLocation>^KZ.AreaS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

