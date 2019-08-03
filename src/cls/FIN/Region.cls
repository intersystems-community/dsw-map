/// State or county
Class FIN.Region Extends Area
{

/// Parent of region. For state=null, for county=state
Relationship ParentRegion As Region(XMLPROJECTION = "XELEMENT", XMLREFERENCE = "ID") [ Cardinality = one, Inverse = ChildrenRegions ];

/// Region childrens. For state=counties, for county=0
Relationship ChildrenRegions As Region [ Cardinality = many, Inverse = ParentRegion ];

Index ParentRegionIdx On ParentRegion;

Storage Default
{
<Data name="RegionDefaultData">
<Subscript>"Region"</Subscript>
<Value name="1">
<Value>Capital</Value>
</Value>
<Value name="2">
<Value>DefaultZoom</Value>
</Value>
<Value name="3">
<Value>HLevel</Value>
</Value>
<Value name="4">
<Value>ParentRegion</Value>
</Value>
</Data>
<DefaultData>RegionDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

