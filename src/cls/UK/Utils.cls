Class UK.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("UKCube")
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("UK.Area", "%KillExtent")
	do ..ImportXData("UK.Region", "RegionXData")
	do ..ImportXData("UK.Parameter", "ParameterXData")
	do ..ImportXData("UK.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("UK.Utils"_"||"_xDataName).Data
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
        <Name>Scotland</Name>
        <Guid>Scotland</Guid>
        <DataUrl>Scotland</DataUrl>
    </Region>
    <Region>
        <Name>Northern Ireland</Name>
        <Guid>Northern Ireland</Guid>
        <DataUrl>Northern Ireland</DataUrl>
    </Region>
    <Region>
        <Name>Wales</Name>
        <Guid>Wales</Guid>
        <DataUrl>Wales</DataUrl>
    </Region>
    <Region>
        <Name>England</Name>
        <Guid>England</Guid>
        <DataUrl>England</DataUrl>
    </Region>
    <Region>
        <Name>North East</Name>
        <Guid>North East</Guid>
        <DataUrl>North East</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>North West</Name>
        <Guid>North West</Guid>
        <DataUrl>North West</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>Yorkshire and The Humber</Name>
        <Guid>Yorkshire and The Humber</Guid>
        <DataUrl>Yorkshire and The Humber</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>East Midlands</Name>
        <Guid>East Midlands</Guid>
        <DataUrl>East Midlands</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>West Midlands</Name>
        <Guid>West Midlands</Guid>
        <DataUrl>West Midlands</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>Eastern</Name>
        <Guid>Eastern</Guid>
        <DataUrl>Eastern</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>London</Name>
        <Guid>London</Guid>
        <DataUrl>London</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>South East</Name>
        <Guid>South East</Guid>
        <DataUrl>South East</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>South West</Name>
        <Guid>South West</Guid>
        <DataUrl>South West</DataUrl>
        <ParentRegion>England</ParentRegion>
    </Region>
    <Region>
        <Name>Clackmannanshire</Name>
        <Guid>Clackmannanshire</Guid>
        <DataUrl>Clackmannanshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Dumfries and Galloway</Name>
        <Guid>Dumfries and Galloway</Guid>
        <DataUrl>Dumfries and Galloway</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>East Ayrshire</Name>
        <Guid>East Ayrshire</Guid>
        <DataUrl>East Ayrshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>East Lothian</Name>
        <Guid>East Lothian</Guid>
        <DataUrl>East Lothian</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>East Renfrewshire</Name>
        <Guid>East Renfrewshire</Guid>
        <DataUrl>East Renfrewshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Eilean Siar</Name>
        <Guid>Eilean Siar</Guid>
        <DataUrl>Eilean Siar</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Falkirk</Name>
        <Guid>Falkirk</Guid>
        <DataUrl>Falkirk</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Fife</Name>
        <Guid>Fife</Guid>
        <DataUrl>Fife</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Highland</Name>
        <Guid>Highland</Guid>
        <DataUrl>Highland</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Inverclyde</Name>
        <Guid>Inverclyde</Guid>
        <DataUrl>Inverclyde</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Midlothian</Name>
        <Guid>Midlothian</Guid>
        <DataUrl>Midlothian</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Moray</Name>
        <Guid>Moray</Guid>
        <DataUrl>Moray</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>North Ayrshire</Name>
        <Guid>North Ayrshire</Guid>
        <DataUrl>North Ayrshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Orkney Islands</Name>
        <Guid>Orkney Islands</Guid>
        <DataUrl>Orkney Islands</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Perth and Kinross</Name>
        <Guid>Perth and Kinross</Guid>
        <DataUrl>Perth and Kinross</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Scottish Borders</Name>
        <Guid>Scottish Borders</Guid>
        <DataUrl>Scottish Borders</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Shetland Islands</Name>
        <Guid>Shetland Islands</Guid>
        <DataUrl>Shetland Islands</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>South Ayrshire</Name>
        <Guid>South Ayrshire</Guid>
        <DataUrl>South Ayrshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>South Lanarkshire</Name>
        <Guid>South Lanarkshire</Guid>
        <DataUrl>South Lanarkshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Stirling</Name>
        <Guid>Stirling</Guid>
        <DataUrl>Stirling</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Aberdeen City</Name>
        <Guid>Aberdeen City</Guid>
        <DataUrl>Aberdeen City</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Aberdeenshire</Name>
        <Guid>Aberdeenshire</Guid>
        <DataUrl>Aberdeenshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Argyll and Bute</Name>
        <Guid>Argyll and Bute</Guid>
        <DataUrl>Argyll and Bute</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>City of Edinburgh</Name>
        <Guid>City of Edinburgh</Guid>
        <DataUrl>City of Edinburgh</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Renfrewshire</Name>
        <Guid>Renfrewshire</Guid>
        <DataUrl>Renfrewshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>West Dunbartonshire</Name>
        <Guid>West Dunbartonshire</Guid>
        <DataUrl>West Dunbartonshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>West Lothian</Name>
        <Guid>West Lothian</Guid>
        <DataUrl>West Lothian</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Angus</Name>
        <Guid>Angus</Guid>
        <DataUrl>Angus</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Dundee City</Name>
        <Guid>Dundee City</Guid>
        <DataUrl>Dundee City</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>North Lanarkshire</Name>
        <Guid>North Lanarkshire</Guid>
        <DataUrl>North Lanarkshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>East Dunbartonshire</Name>
        <Guid>East Dunbartonshire</Guid>
        <DataUrl>East Dunbartonshire</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Glasgow City</Name>
        <Guid>Glasgow City</Guid>
        <DataUrl>Glasgow City</DataUrl>
        <ParentRegion>Scotland</ParentRegion>
    </Region>
    <Region>
        <Name>Isle of Anglesey</Name>
        <Guid>Isle of Anglesey</Guid>
        <DataUrl>Isle of Anglesey</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Gwynedd</Name>
        <Guid>Gwynedd</Guid>
        <DataUrl>Gwynedd</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Conwy</Name>
        <Guid>Conwy</Guid>
        <DataUrl>Conwy</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Denbighshire</Name>
        <Guid>Denbighshire</Guid>
        <DataUrl>Denbighshire</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Flintshire</Name>
        <Guid>Flintshire</Guid>
        <DataUrl>Flintshire</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Wrexham</Name>
        <Guid>Wrexham</Guid>
        <DataUrl>Wrexham</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Ceredigion</Name>
        <Guid>Ceredigion</Guid>
        <DataUrl>Ceredigion</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Pembrokeshire</Name>
        <Guid>Pembrokeshire</Guid>
        <DataUrl>Pembrokeshire</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Carmarthenshire</Name>
        <Guid>Carmarthenshire</Guid>
        <DataUrl>Carmarthenshire</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Swansea</Name>
        <Guid>Swansea</Guid>
        <DataUrl>Swansea</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Neath Port Talbot</Name>
        <Guid>Neath Port Talbot</Guid>
        <DataUrl>Neath Port Talbot</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Bridgend</Name>
        <Guid>Bridgend</Guid>
        <DataUrl>Bridgend</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Vale of Glamorgan</Name>
        <Guid>Vale of Glamorgan</Guid>
        <DataUrl>Vale of Glamorgan</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Cardiff</Name>
        <Guid>Cardiff</Guid>
        <DataUrl>Cardiff</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Rhondda Cynon Taf</Name>
        <Guid>Rhondda Cynon Taf</Guid>
        <DataUrl>Rhondda Cynon Taf</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Caerphilly</Name>
        <Guid>Caerphilly</Guid>
        <DataUrl>Caerphilly</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Blaenau Gwent</Name>
        <Guid>Blaenau Gwent</Guid>
        <DataUrl>Blaenau Gwent</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Torfaen</Name>
        <Guid>Torfaen</Guid>
        <DataUrl>Torfaen</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Monmouthshire</Name>
        <Guid>Monmouthshire</Guid>
        <DataUrl>Monmouthshire</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Newport</Name>
        <Guid>Newport</Guid>
        <DataUrl>Newport</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Powys</Name>
        <Guid>Powys</Guid>
        <DataUrl>Powys</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Merthyr Tydfil</Name>
        <Guid>Merthyr Tydfil</Guid>
        <DataUrl>Merthyr Tydfil</DataUrl>
        <ParentRegion>Wales</ParentRegion>
    </Region>
    <Region>
        <Name>Tyrone</Name>
        <Guid>Tyrone</Guid>
        <DataUrl>Tyrone</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
    <Region>
        <Name>Antrim</Name>
        <Guid>Antrim</Guid>
        <DataUrl>Antrim</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
    <Region>
        <Name>Armagh</Name>
        <Guid>Armagh</Guid>
        <DataUrl>Armagh</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
    <Region>
        <Name>Fermanagh</Name>
        <Guid>Fermanagh</Guid>
        <DataUrl>Fermanagh</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
    <Region>
        <Name>Londonderry</Name>
        <Guid>Londonderry</Guid>
        <DataUrl>Londonderry</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
    <Region>
        <Name>Down</Name>
        <Guid>Down</Guid>
        <DataUrl>Down</DataUrl>
        <ParentRegion>Northern Ireland</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>Scotland</Region>
        <Parameter>1</Parameter>
        <Value>5404700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Scotland</Region>
        <Parameter>2</Parameter>
        <Value>77933</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Northern Ireland</Region>
        <Parameter>1</Parameter>
        <Value>1870451</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Northern Ireland</Region>
        <Parameter>2</Parameter>
        <Value>14130</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Wales</Region>
        <Parameter>1</Parameter>
        <Value>3063456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Wales</Region>
        <Parameter>2</Parameter>
        <Value>20779</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>England</Region>
        <Parameter>1</Parameter>
        <Value>54786300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>England</Region>
        <Parameter>2</Parameter>
        <Value>130279</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North East</Region>
        <Parameter>1</Parameter>
        <Value>2597000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North East</Region>
        <Parameter>2</Parameter>
        <Value>8592</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North West</Region>
        <Parameter>1</Parameter>
        <Value>7052000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North West</Region>
        <Parameter>2</Parameter>
        <Value>14165</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Yorkshire and The Humber</Region>
        <Parameter>1</Parameter>
        <Value>5284000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Yorkshire and The Humber</Region>
        <Parameter>2</Parameter>
        <Value>15420</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Midlands</Region>
        <Parameter>1</Parameter>
        <Value>4637000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Midlands</Region>
        <Parameter>2</Parameter>
        <Value>15627</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Midlands</Region>
        <Parameter>1</Parameter>
        <Value>5713000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Midlands</Region>
        <Parameter>2</Parameter>
        <Value>13000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eastern</Region>
        <Parameter>1</Parameter>
        <Value>5847000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eastern</Region>
        <Parameter>2</Parameter>
        <Value>19120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>London</Region>
        <Parameter>1</Parameter>
        <Value>8778500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>London</Region>
        <Parameter>2</Parameter>
        <Value>1569</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South East</Region>
        <Parameter>1</Parameter>
        <Value>8635000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South East</Region>
        <Parameter>2</Parameter>
        <Value>19095</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South West</Region>
        <Parameter>1</Parameter>
        <Value>5289000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South West</Region>
        <Parameter>2</Parameter>
        <Value>23800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Clackmannanshire</Region>
        <Parameter>1</Parameter>
        <Value>51400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Clackmannanshire</Region>
        <Parameter>2</Parameter>
        <Value>159</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dumfries and Galloway</Region>
        <Parameter>1</Parameter>
        <Value>149500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dumfries and Galloway</Region>
        <Parameter>2</Parameter>
        <Value>6426</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Ayrshire</Region>
        <Parameter>1</Parameter>
        <Value>122200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Ayrshire</Region>
        <Parameter>2</Parameter>
        <Value>1262</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Lothian</Region>
        <Parameter>1</Parameter>
        <Value>104100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Lothian</Region>
        <Parameter>2</Parameter>
        <Value>262.2</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Renfrewshire</Region>
        <Parameter>1</Parameter>
        <Value>93800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Renfrewshire</Region>
        <Parameter>2</Parameter>
        <Value>67.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eilean Siar</Region>
        <Parameter>1</Parameter>
        <Value>26900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eilean Siar</Region>
        <Parameter>2</Parameter>
        <Value>3058</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Falkirk</Region>
        <Parameter>1</Parameter>
        <Value>156000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Falkirk</Region>
        <Parameter>2</Parameter>
        <Value>293</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fife</Region>
        <Parameter>1</Parameter>
        <Value>365200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fife</Region>
        <Parameter>2</Parameter>
        <Value>1340</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Highland</Region>
        <Parameter>1</Parameter>
        <Value>232100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Highland</Region>
        <Parameter>2</Parameter>
        <Value>30659</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Inverclyde</Region>
        <Parameter>1</Parameter>
        <Value>81500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Inverclyde</Region>
        <Parameter>2</Parameter>
        <Value>167</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Midlothian</Region>
        <Parameter>1</Parameter>
        <Value>83200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Midlothian</Region>
        <Parameter>2</Parameter>
        <Value>350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Moray</Region>
        <Parameter>1</Parameter>
        <Value>93300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Moray</Region>
        <Parameter>2</Parameter>
        <Value>2237</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North Ayrshire</Region>
        <Parameter>1</Parameter>
        <Value>138200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North Ayrshire</Region>
        <Parameter>2</Parameter>
        <Value>888</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Orkney Islands</Region>
        <Parameter>1</Parameter>
        <Value>21400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Orkney Islands</Region>
        <Parameter>2</Parameter>
        <Value>1025</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Perth and Kinross</Region>
        <Parameter>1</Parameter>
        <Value>146700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Perth and Kinross</Region>
        <Parameter>2</Parameter>
        <Value>5395</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Scottish Borders</Region>
        <Parameter>1</Parameter>
        <Value>113900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Scottish Borders</Region>
        <Parameter>2</Parameter>
        <Value>4727</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Shetland Islands</Region>
        <Parameter>1</Parameter>
        <Value>23200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Shetland Islands</Region>
        <Parameter>2</Parameter>
        <Value>1471</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South Ayrshire</Region>
        <Parameter>1</Parameter>
        <Value>112800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South Ayrshire</Region>
        <Parameter>2</Parameter>
        <Value>1230</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South Lanarkshire</Region>
        <Parameter>1</Parameter>
        <Value>313800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>South Lanarkshire</Region>
        <Parameter>2</Parameter>
        <Value>1778</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Stirling</Region>
        <Parameter>1</Parameter>
        <Value>90200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Stirling</Region>
        <Parameter>2</Parameter>
        <Value>2243</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Aberdeen City</Region>
        <Parameter>1</Parameter>
        <Value>222800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Aberdeen City</Region>
        <Parameter>2</Parameter>
        <Value>182</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Aberdeenshire</Region>
        <Parameter>1</Parameter>
        <Value>253000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Aberdeenshire</Region>
        <Parameter>2</Parameter>
        <Value>6317</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Argyll and Bute</Region>
        <Parameter>1</Parameter>
        <Value>88200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Argyll and Bute</Region>
        <Parameter>2</Parameter>
        <Value>7023</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Edinburgh</Region>
        <Parameter>1</Parameter>
        <Value>476600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Edinburgh</Region>
        <Parameter>2</Parameter>
        <Value>260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Renfrewshire</Region>
        <Parameter>1</Parameter>
        <Value>174900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Renfrewshire</Region>
        <Parameter>2</Parameter>
        <Value>263</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Dunbartonshire</Region>
        <Parameter>1</Parameter>
        <Value>90700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Dunbartonshire</Region>
        <Parameter>2</Parameter>
        <Value>176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Lothian</Region>
        <Parameter>1</Parameter>
        <Value>175100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Lothian</Region>
        <Parameter>2</Parameter>
        <Value>427</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Angus</Region>
        <Parameter>1</Parameter>
        <Value>116000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Angus</Region>
        <Parameter>2</Parameter>
        <Value>2184</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dundee City</Region>
        <Parameter>1</Parameter>
        <Value>147300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dundee City</Region>
        <Parameter>2</Parameter>
        <Value>55</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North Lanarkshire</Region>
        <Parameter>1</Parameter>
        <Value>337800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North Lanarkshire</Region>
        <Parameter>2</Parameter>
        <Value>476</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Dunbartonshire</Region>
        <Parameter>1</Parameter>
        <Value>105000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>East Dunbartonshire</Region>
        <Parameter>2</Parameter>
        <Value>176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Glasgow City</Region>
        <Parameter>1</Parameter>
        <Value>593200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Glasgow City</Region>
        <Parameter>2</Parameter>
        <Value>175</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Isle of Anglesey</Region>
        <Parameter>1</Parameter>
        <Value>69700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Isle of Anglesey</Region>
        <Parameter>2</Parameter>
        <Value>714</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Gwynedd</Region>
        <Parameter>1</Parameter>
        <Value>123600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Gwynedd</Region>
        <Parameter>2</Parameter>
        <Value>2548</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Conwy</Region>
        <Parameter>1</Parameter>
        <Value>116500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Conwy</Region>
        <Parameter>2</Parameter>
        <Value>1130</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Denbighshire</Region>
        <Parameter>1</Parameter>
        <Value>94800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Denbighshire</Region>
        <Parameter>2</Parameter>
        <Value>844</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Flintshire</Region>
        <Parameter>1</Parameter>
        <Value>154400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Flintshire</Region>
        <Parameter>2</Parameter>
        <Value>438</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Wrexham</Region>
        <Parameter>1</Parameter>
        <Value>136700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Wrexham</Region>
        <Parameter>2</Parameter>
        <Value>499</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ceredigion</Region>
        <Parameter>1</Parameter>
        <Value>74100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ceredigion</Region>
        <Parameter>2</Parameter>
        <Value>1783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Pembrokeshire</Region>
        <Parameter>1</Parameter>
        <Value>124000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Pembrokeshire</Region>
        <Parameter>2</Parameter>
        <Value>1590</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Carmarthenshire</Region>
        <Parameter>1</Parameter>
        <Value>185600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Carmarthenshire</Region>
        <Parameter>2</Parameter>
        <Value>2395</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Swansea</Region>
        <Parameter>1</Parameter>
        <Value>244500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Swansea</Region>
        <Parameter>2</Parameter>
        <Value>380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Neath Port Talbot</Region>
        <Parameter>1</Parameter>
        <Value>141600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Neath Port Talbot</Region>
        <Parameter>2</Parameter>
        <Value>442</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Bridgend</Region>
        <Parameter>1</Parameter>
        <Value>143200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Bridgend</Region>
        <Parameter>2</Parameter>
        <Value>246</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Vale of Glamorgan</Region>
        <Parameter>1</Parameter>
        <Value>128500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Vale of Glamorgan</Region>
        <Parameter>2</Parameter>
        <Value>335</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Cardiff</Region>
        <Parameter>1</Parameter>
        <Value>346100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Cardiff</Region>
        <Parameter>2</Parameter>
        <Value>140.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Rhondda Cynon Taf</Region>
        <Parameter>1</Parameter>
        <Value>238300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Rhondda Cynon Taf</Region>
        <Parameter>2</Parameter>
        <Value>424</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Caerphilly</Region>
        <Parameter>1</Parameter>
        <Value>180500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Caerphilly</Region>
        <Parameter>2</Parameter>
        <Value>278</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Blaenau Gwent</Region>
        <Parameter>1</Parameter>
        <Value>69600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Blaenau Gwent</Region>
        <Parameter>2</Parameter>
        <Value>109</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Torfaen</Region>
        <Parameter>1</Parameter>
        <Value>92100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Torfaen</Region>
        <Parameter>2</Parameter>
        <Value>126</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Monmouthshire</Region>
        <Parameter>1</Parameter>
        <Value>92800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Monmouthshire</Region>
        <Parameter>2</Parameter>
        <Value>850</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Newport</Region>
        <Parameter>1</Parameter>
        <Value>149100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Newport</Region>
        <Parameter>2</Parameter>
        <Value>190</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Powys</Region>
        <Parameter>1</Parameter>
        <Value>132200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Powys</Region>
        <Parameter>2</Parameter>
        <Value>5179</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Merthyr Tydfil</Region>
        <Parameter>1</Parameter>
        <Value>59800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Merthyr Tydfil</Region>
        <Parameter>2</Parameter>
        <Value>111</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Tyrone</Region>
        <Parameter>1</Parameter>
        <Value>177986</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Tyrone</Region>
        <Parameter>2</Parameter>
        <Value>3266</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Antrim</Region>
        <Parameter>1</Parameter>
        <Value>618108</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Antrim</Region>
        <Parameter>2</Parameter>
        <Value>3098</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Armagh</Region>
        <Parameter>1</Parameter>
        <Value>174792</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Armagh</Region>
        <Parameter>2</Parameter>
        <Value>1327</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fermanagh</Region>
        <Parameter>1</Parameter>
        <Value>61170</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fermanagh</Region>
        <Parameter>2</Parameter>
        <Value>1851</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Londonderry</Region>
        <Parameter>1</Parameter>
        <Value>247132</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Londonderry</Region>
        <Parameter>2</Parameter>
        <Value>2118</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Down</Region>
        <Parameter>1</Parameter>
        <Value>531665</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Down</Region>
        <Parameter>2</Parameter>
        <Value>2491</Value>
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

