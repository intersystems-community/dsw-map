/// Параметер
Class RF.Parameter Extends (%Persistent, %XML.Adaptor)
{

/// Имя параметра
Property Name As %String [ Required ];

/// Имя единицы измерения
Property UnitName As %String [ Required ];

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
<DataLocation>^RF.ParameterD</DataLocation>
<DefaultData>ParameterDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^RF.ParameterD</IdLocation>
<IndexLocation>^RF.ParameterI</IndexLocation>
<StreamLocation>^RF.ParameterS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

