/// Значение для определенного параметра, региона
Class RF.ParameterValue Extends (%Persistent, %XML.Adaptor)
{

Property Region As RF.Region(XMLREFERENCE = "ID") [ Required ];

Property Parameter As RF.Parameter(XMLREFERENCE = "ID") [ Required ];

Index RegionParameterIndex On (Region, Parameter) [ Unique ];

Property Value As %Float;

Storage Default
{
<Data name="ParameterValueDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Region</Value>
</Value>
<Value name="3">
<Value>Parameter</Value>
</Value>
<Value name="4">
<Value>Value</Value>
</Value>
<Value name="5">
<Value>RegionName</Value>
</Value>
</Data>
<DataLocation>^RF.ParameterValueD</DataLocation>
<DefaultData>ParameterValueDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^RF.ParameterValueD</IdLocation>
<IndexLocation>^RF.ParameterValueI</IndexLocation>
<StreamLocation>^RF.ParameterValueS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

