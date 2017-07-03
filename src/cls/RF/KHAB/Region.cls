Class RF.KHAB.Region Extends %Persistent
{

Property Key As %String;

Property Name As %String;

Property Population As %Integer;

Index KeyIdx On Key [ IdKey, Unique ];

Storage Default
{
<Data name="RegionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Key</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Population</Value>
</Value>
</Data>
<DataLocation>^RF.KHAB.RegionD</DataLocation>
<DefaultData>RegionDefaultData</DefaultData>
<IdLocation>^RF.KHAB.RegionD</IdLocation>
<IndexLocation>^RF.KHAB.RegionI</IndexLocation>
<StreamLocation>^RF.KHAB.RegionS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

