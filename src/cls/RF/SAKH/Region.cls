/// State or county
Class RF.SAKH.Region Extends %Persistent
{

Property Name As %String(MAXLEN = 500) [ Required ];

Property Population As %Integer;

ClassMethod Populate()
{
	for i="Невельский район","Южно-Сахалинск","Поронайский район","Александровск-Сахалинский район","Охинский район","Углегорский район","Холмский район","Корсаковский район","Томаринский район","Южно-Курильский район","Смирныховский район","Анивский район","Ногликский район","Долинский район","Тымовский район","Макаровский район","Северо-Курильский район","Курильский район"
	 {
	  set obj=##class(RF.SAKH.Region).%New()
	  set obj.Name=i
	  set obj.Population=$R(100000)
	  d obj.%Save()
	  w obj.Name," created",!
	 }
}

Storage Default
{
<Data name="RegionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Population</Value>
</Value>
</Data>
<DataLocation>^RF.SAKH.RegionD</DataLocation>
<DefaultData>RegionDefaultData</DefaultData>
<IdLocation>^RF.SAKH.RegionD</IdLocation>
<IndexLocation>^RF.SAKH.RegionI</IndexLocation>
<StreamLocation>^RF.SAKH.RegionS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

