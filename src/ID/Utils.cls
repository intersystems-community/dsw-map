Class ID.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("IDCube",0)
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("ID.Area", "%KillExtent")
	do ..ImportXData("ID.Region", "RegionXData")
	do ..ImportXData("ID.Parameter", "ParameterXData")
	do ..ImportXData("ID.ParameterValue", "ParameterValueXData")
	quit $$$OK
}

ClassMethod ImportXData(className As %String, xDataName As %String) As %Status
{
	#dim sc As %Status = $$$OK
	set sc= $CLASSMETHOD(className, "%KillExtent")

	set itemsCount = 0

	try{

		if $$$ISERR(sc)
		{
			write !, $System.Status.DisplayError(sc)
			$$$THROWONERROR(sc,sc)
		}

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("ID.Utils"_"||"_xDataName).Data
		#dim reader As %XML.Reader = ##class(%XML.Reader).%New()

		set sc = reader.OpenStream(stream, "literal")
		$$$THROWONERROR(sc,sc)

		do reader.Correlate($piece(className, ".", 2), className)

		while reader.Next(.obj, .sc)
		{
			if $$$ISERR(sc)
			{
				write !, $System.Status.DisplayError(sc)
				$$$THROWONERROR(sc,sc)
			}

			set sc = obj.%Save()

			if $$$ISERR(sc)
			{
				write !, $System.Status.DisplayError(sc)
				$$$THROWONERROR(sc,sc)
			}

			set obj = ""
			set itemsCount = itemsCount + 1
		}
	}
	catch(ex){
		w !, ex.Name_" "_ex.Location
	}

	write !,"Import - "_itemsCount_" objects of class "_className

	Quit $$$OK
}

XData RegionXData
{
<RegionXData>
    <Region>
        <Name>North Sulawesi</Name>
        <Guid>1</Guid>
        <DataUrl>North Sulawesi</DataUrl>
    </Region>
	<Region>
        <Name>Gorontalo</Name>
        <Guid>1.1</Guid>
        <DataUrl>Gorontalo</DataUrl>
		<ParentRegion>1</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>1</Region>
        <Parameter>1</Parameter>
        <Value>2621923</Value>
    </ParameterValue>
	<ParameterValue>
        <Region>1.1</Region>
        <Parameter>1</Parameter>
        <Value>1171681</Value>
    </ParameterValue>
</ParameterValueXData>
}

XData ParameterXData
{
<ParameterXData>
    <Parameter>
        <Name>Population</Name>
    </Parameter>
    <Parameter>
        <Name>Area</Name>
        <UnitName>sq km</UnitName>
    </Parameter>
</ParameterXData>
}

}
