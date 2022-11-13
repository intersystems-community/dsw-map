Class UA.Parameter Extends (%Persistent, %XML.Adaptor)
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
<DataLocation>^UA.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^UA.ParameterD</IdLocation>
<IndexLocation>^UA.ParameterI</IndexLocation>
<StreamLocation>^UA.ParameterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

