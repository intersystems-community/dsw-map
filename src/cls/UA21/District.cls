Class UA21.District Extends %Persistent
{

Property name As %String(MAXLEN = 250);

Property population As %Integer;

Property guid As %String;

Property region As Region;

Storage Default
{
<Data name="DistrictDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>population</Value>
</Value>
<Value name="4">
<Value>guid</Value>
</Value>
<Value name="5">
<Value>region</Value>
</Value>
</Data>
<DataLocation>^UA21.DistrictD</DataLocation>
<DefaultData>DistrictDefaultData</DefaultData>
<IdLocation>^UA21.DistrictD</IdLocation>
<IndexLocation>^UA21.DistrictI</IndexLocation>
<StreamLocation>^UA21.DistrictS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}