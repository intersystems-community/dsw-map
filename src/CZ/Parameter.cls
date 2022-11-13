Class CZ.Parameter Extends (%Persistent, %XML.Adaptor)
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
<DataLocation>^CZ.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^CZ.ParameterD</IdLocation>
<IndexLocation>^CZ.ParameterI</IndexLocation>
<StreamLocation>^CZ.ParameterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

