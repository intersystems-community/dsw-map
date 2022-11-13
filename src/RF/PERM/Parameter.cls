Class RF.PERM.Parameter Extends (%Persistent, %XML.Adaptor)
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
<DataLocation>^RF.PERM.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<IdLocation>^RF.PERM.ParameterD</IdLocation>
<IndexLocation>^RF.PERM.ParameterI</IndexLocation>
<StreamLocation>^RF.PERM.ParameterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

