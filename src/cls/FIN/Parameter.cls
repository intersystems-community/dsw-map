Class FIN.Parameter Extends (%Persistent, %XML.Adaptor)
{

Property Name As %String;

Property UnitName As %String;

Relationship Values As FIN.ParameterValue [ Cardinality = many, Inverse = Parameter ];

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
<DataLocation>^FIN.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^FIN.ParameterD</IdLocation>
<IndexLocation>^FIN.ParameterI</IndexLocation>
<StreamLocation>^FIN.ParameterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

