Class RSA.Parameter Extends (%Persistent, %XML.Adaptor)
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
<DataLocation>^RSA.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^RSA.ParameterD</IdLocation>
<IndexLocation>^RSA.ParameterI</IndexLocation>
<StreamLocation>^RSA.ParameterS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

