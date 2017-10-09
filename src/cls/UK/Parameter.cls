Class UK.Parameter Extends (%Persistent, %XML.Adaptor)
{

Property Name As %String;

Property UnitName As %String;

Relationship Values As ParameterValue [ Cardinality = many, Inverse = Parameter ];

Storage Default
{
<Data name="ParameterDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>UnitName</Value>
</Value>
</Data>
<DataLocation>^UK.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^UK.ParameterD</IdLocation>
<IndexLocation>^UK.ParameterI</IndexLocation>
<StreamLocation>^UK.ParameterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

