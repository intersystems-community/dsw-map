Class UA21.Region Extends %Persistent
{

Property name As %String(MAXLEN = 250);

Property guid As %String;

Index nameIndex On name;

ClassMethod getId(name, guid = "") As %Integer
{
	if '..nameIndexExists(name, .id) {
		set obj = ..%New()
		set obj.name = name
		set obj.guid = guid
		$$$TOE(sc,obj.%Save())
		set id = obj.%Id()
	}
	quit id
}

Storage Default
{
<Data name="RegionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>guid</Value>
</Value>
</Data>
<DataLocation>^UA21.RegionD</DataLocation>
<DefaultData>RegionDefaultData</DefaultData>
<IdLocation>^UA21.RegionD</IdLocation>
<IndexLocation>^UA21.RegionI</IndexLocation>
<StreamLocation>^UA21.RegionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}