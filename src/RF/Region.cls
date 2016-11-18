/// Федаральные округа, субъекты, районы и населенные пункты
Class RF.Region Extends (%Persistent, %XML.Adaptor)
{

/// Название админ. единицы 
Property Name As %String(MAXLEN = 750) [ Required ];

/// Идектификатор GUID. вместо ID
Property Guid As %String [ Required ];

/// Идектификатор GUID Родителя
Property ParentGuid As Region(XMLREFERENCE = "ID");

/// Широта
Property Latitude As %String;

/// Долгота
Property Longitude As %String;

/// Масштаб по умолчанию
Property DefaultZoom As %Integer;

/// Возможность drill down
Property CanDrillDown As %Boolean [ InitialExpression = "0", Required ];

/// Название адм. центра
Property CenterName As %String;

/// Город является административным центром
Property SpecialIcon As %Boolean [ InitialExpression = "0", Required ];

/// Уровень в иерархии
Property HLevel As %Integer [ Required ];

/// Прозрачность обводки полигона после углубления, 1 - 100% видимость, 0 - это не полигон.
/// Значение 0 - только у городов(маркеров)
Property PolygonStrokeOpacity As %Float(MAXVAL = 1, MINVAL = 0) [ InitialExpression = 0, Required ];

Index GuidIndex On Guid [ IdKey, Unique ];

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
<Value>ParentName</Value>
</Value>
<Value name="4">
<Value>GrandParentName</Value>
</Value>
<Value name="5">
<Value>OKATO</Value>
</Value>
<Value name="6">
<Value>ParentOKATO</Value>
</Value>
<Value name="7">
<Value>MainCity</Value>
</Value>
<Value name="8">
<Value>Latitude</Value>
</Value>
<Value name="9">
<Value>Longitude</Value>
</Value>
<Value name="10">
<Value>DefaultZoom</Value>
</Value>
<Value name="11">
<Value>CanDrillDown</Value>
</Value>
<Value name="12">
<Value>HLevelRF</Value>
</Value>
<Value name="13">
<Value>Guid</Value>
</Value>
<Value name="14">
<Value>ParentGuid</Value>
</Value>
<Value name="15">
<Value>Area</Value>
</Value>
<Value name="16">
<Value>OKTMO</Value>
</Value>
<Value name="17">
<Value>NameCenter</Value>
</Value>
<Value name="18">
<Value>GuidCenter</Value>
</Value>
<Value name="19">
<Value>HLevel</Value>
</Value>
<Value name="20">
<Value>CenterName</Value>
</Value>
<Value name="21">
<Value>IsCenter</Value>
</Value>
<Value name="22">
<Value>SpecialIcon</Value>
</Value>
<Value name="23">
<Value>PolygonStrokeOpacity</Value>
</Value>
</Data>
<DataLocation>^RF.RegionD</DataLocation>
<DefaultData>RegionDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^RF.RegionD</IdLocation>
<IndexLocation>^RF.RegionI</IndexLocation>
<StreamLocation>^RF.RegionS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

