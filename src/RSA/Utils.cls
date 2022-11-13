Class RSA.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("RSACube")
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("RSA.Area", "%KillExtent")
	do ..ImportXData("RSA.Region", "RegionXData")
	do ..ImportXData("RSA.Parameter", "ParameterXData")
	do ..ImportXData("RSA.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("RSA.Utils"_"||"_xDataName).Data
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
        <Name>Gauteng</Name>
        <Guid>Gauteng</Guid>
        <DataUrl>Gauteng</DataUrl>
    </Region>
    <Region>
        <Name>North West</Name>
        <Guid>North West</Guid>
        <DataUrl>North West</DataUrl>
    </Region>
    <Region>
        <Name>Mpumalanga</Name>
        <Guid>Mpumalanga</Guid>
        <DataUrl>Mpumalanga</DataUrl>
    </Region>
    <Region>
        <Name>Limpopo</Name>
        <Guid>Limpopo</Guid>
        <DataUrl>Limpopo</DataUrl>
    </Region>
    <Region>
        <Name>KwaZulu-Natal</Name>
        <Guid>KwaZulu-Natal</Guid>
        <DataUrl>KwaZulu-Natal</DataUrl>
    </Region>
    <Region>
        <Name>Free State</Name>
        <Guid>Free State</Guid>
        <DataUrl>Free State</DataUrl>
    </Region>
    <Region>
        <Name>Eastern Cape</Name>
        <Guid>Eastern Cape</Guid>
        <DataUrl>Eastern Cape</DataUrl>
    </Region>
    <Region>
        <Name>Western Cape</Name>
        <Guid>Western Cape</Guid>
        <DataUrl>Western Cape</DataUrl>
    </Region>
    <Region>
        <Name>Northern Cape</Name>
        <Guid>Northern Cape</Guid>
        <DataUrl>Northern Cape</DataUrl>
    </Region>
    <Region>
        <Name>ZF Mgcawu District Municipality</Name>
        <Guid>ZF Mgcawu District Municipality</Guid>
        <DataUrl>ZF Mgcawu District Municipality</DataUrl>
        <ParentRegion>Northern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Nelson Mandela Bay Metropolitan Municipality</Name>
        <Guid>Nelson Mandela Bay Metropolitan Municipality</Guid>
        <DataUrl>Nelson Mandela Bay Metropolitan Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Buffalo City Metropolitan Municipality</Name>
        <Guid>Buffalo City Metropolitan Municipality</Guid>
        <DataUrl>Buffalo City Metropolitan Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Chris Hani District Municipality</Name>
        <Guid>Chris Hani District Municipality</Guid>
        <DataUrl>Chris Hani District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Xhariep District Municipality</Name>
        <Guid>Xhariep District Municipality</Guid>
        <DataUrl>Xhariep District Municipality</DataUrl>
        <ParentRegion>Free State</ParentRegion>
    </Region>
    <Region>
        <Name>Mangaung Metropolitan Municipality</Name>
        <Guid>Mangaung Metropolitan Municipality</Guid>
        <DataUrl>Mangaung Metropolitan Municipality</DataUrl>
        <ParentRegion>Free State</ParentRegion>
    </Region>
    <Region>
        <Name>Ekurhuleni Metropolitan Municipality</Name>
        <Guid>Ekurhuleni Metropolitan Municipality</Guid>
        <DataUrl>Ekurhuleni Metropolitan Municipality</DataUrl>
        <ParentRegion>Gauteng</ParentRegion>
    </Region>
    <Region>
        <Name>City of Johannesburg Metropolitan Municipality</Name>
        <Guid>City of Johannesburg Metropolitan Municipality</Guid>
        <DataUrl>City of Johannesburg Metropolitan Municipality</DataUrl>
        <ParentRegion>Gauteng</ParentRegion>
    </Region>
    <Region>
        <Name>Uthukela District Municipality</Name>
        <Guid>Uthukela District Municipality</Guid>
        <DataUrl>Uthukela District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Umkhanyakude District Municipality</Name>
        <Guid>Umkhanyakude District Municipality</Guid>
        <DataUrl>Umkhanyakude District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>eThekwini Metropolitan Municipality</Name>
        <Guid>eThekwini Metropolitan Municipality</Guid>
        <DataUrl>eThekwini Metropolitan Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>uThungulu District Municipality</Name>
        <Guid>uThungulu District Municipality</Guid>
        <DataUrl>uThungulu District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Umzinyathi District Municipality</Name>
        <Guid>Umzinyathi District Municipality</Guid>
        <DataUrl>Umzinyathi District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>uMgungundlovu District Municipality</Name>
        <Guid>uMgungundlovu District Municipality</Guid>
        <DataUrl>uMgungundlovu District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Capricorn District Municipality</Name>
        <Guid>Capricorn District Municipality</Guid>
        <DataUrl>Capricorn District Municipality</DataUrl>
        <ParentRegion>Limpopo</ParentRegion>
    </Region>
    <Region>
        <Name>Amajuba District Municipality</Name>
        <Guid>Amajuba District Municipality</Guid>
        <DataUrl>Amajuba District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Sedibeng District Municipality</Name>
        <Guid>Sedibeng District Municipality</Guid>
        <DataUrl>Sedibeng District Municipality</DataUrl>
        <ParentRegion>Gauteng</ParentRegion>
    </Region>
    <Region>
        <Name>Nkangala</Name>
        <Guid>Nkangala</Guid>
        <DataUrl>Nkangala</DataUrl>
        <ParentRegion>Mpumalanga</ParentRegion>
    </Region>
    <Region>
        <Name>Sekhukhune District Municipality</Name>
        <Guid>Sekhukhune District Municipality</Guid>
        <DataUrl>Sekhukhune District Municipality</DataUrl>
        <ParentRegion>Limpopo</ParentRegion>
    </Region>
    <Region>
        <Name>City of Tshwane Metropolitan Municipality</Name>
        <Guid>City of Tshwane Metropolitan Municipality</Guid>
        <DataUrl>City of Tshwane Metropolitan Municipality</DataUrl>
        <ParentRegion>Gauteng</ParentRegion>
    </Region>
    <Region>
        <Name>Waterberg District Municipality</Name>
        <Guid>Waterberg District Municipality</Guid>
        <DataUrl>Waterberg District Municipality</DataUrl>
        <ParentRegion>Limpopo</ParentRegion>
    </Region>
    <Region>
        <Name>John Taolo Gaetsewe District Municipality</Name>
        <Guid>John Taolo Gaetsewe District Municipality</Guid>
        <DataUrl>John Taolo Gaetsewe District Municipality</DataUrl>
        <ParentRegion>Northern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Bojanala Platinum District Municipality</Name>
        <Guid>Bojanala Platinum District Municipality</Guid>
        <DataUrl>Bojanala Platinum District Municipality</DataUrl>
        <ParentRegion>North West</ParentRegion>
    </Region>
    <Region>
        <Name>West Rand District Municipality</Name>
        <Guid>West Rand District Municipality</Guid>
        <DataUrl>West Rand District Municipality</DataUrl>
        <ParentRegion>Gauteng</ParentRegion>
    </Region>
    <Region>
        <Name>Fezile Dabi District Municipality</Name>
        <Guid>Fezile Dabi District Municipality</Guid>
        <DataUrl>Fezile Dabi District Municipality</DataUrl>
        <ParentRegion>Free State</ParentRegion>
    </Region>
    <Region>
        <Name>Lejweleputswa District Municipality</Name>
        <Guid>Lejweleputswa District Municipality</Guid>
        <DataUrl>Lejweleputswa District Municipality</DataUrl>
        <ParentRegion>Free State</ParentRegion>
    </Region>
    <Region>
        <Name>Ngaka Modiri Molema District Municipality</Name>
        <Guid>Ngaka Modiri Molema District Municipality</Guid>
        <DataUrl>Ngaka Modiri Molema District Municipality</DataUrl>
        <ParentRegion>North West</ParentRegion>
    </Region>
    <Region>
        <Name>Dr Ruth Segomotsi Mompati District Municipality</Name>
        <Guid>Dr Ruth Segomotsi Mompati District Municipality</Guid>
        <DataUrl>Dr Ruth Segomotsi Mompati District Municipality</DataUrl>
        <ParentRegion>North West</ParentRegion>
    </Region>
    <Region>
        <Name>Dr Kenneth Kaunda District Municipality</Name>
        <Guid>Dr Kenneth Kaunda District Municipality</Guid>
        <DataUrl>Dr Kenneth Kaunda District Municipality</DataUrl>
        <ParentRegion>North West</ParentRegion>
    </Region>
    <Region>
        <Name>Vhembe District Municipality</Name>
        <Guid>Vhembe District Municipality</Guid>
        <DataUrl>Vhembe District Municipality</DataUrl>
        <ParentRegion>Limpopo</ParentRegion>
    </Region>
    <Region>
        <Name>Gert Sibande</Name>
        <Guid>Gert Sibande</Guid>
        <DataUrl>Gert Sibande</DataUrl>
        <ParentRegion>Mpumalanga</ParentRegion>
    </Region>
    <Region>
        <Name>Frances Baard District Municipality</Name>
        <Guid>Frances Baard District Municipality</Guid>
        <DataUrl>Frances Baard District Municipality</DataUrl>
        <ParentRegion>Northern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Alfred Nzo District Municipality</Name>
        <Guid>Alfred Nzo District Municipality</Guid>
        <DataUrl>Alfred Nzo District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Ugu District Municipality</Name>
        <Guid>Ugu District Municipality</Guid>
        <DataUrl>Ugu District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>iLembe District Municipality</Name>
        <Guid>iLembe District Municipality</Guid>
        <DataUrl>iLembe District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Mopani District Municipality</Name>
        <Guid>Mopani District Municipality</Guid>
        <DataUrl>Mopani District Municipality</DataUrl>
        <ParentRegion>Limpopo</ParentRegion>
    </Region>
    <Region>
        <Name>Ehlanzeni</Name>
        <Guid>Ehlanzeni</Guid>
        <DataUrl>Ehlanzeni</DataUrl>
        <ParentRegion>Mpumalanga</ParentRegion>
    </Region>
    <Region>
        <Name>Zululand District Municipality</Name>
        <Guid>Zululand District Municipality</Guid>
        <DataUrl>Zululand District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Sisonke District Municipality</Name>
        <Guid>Sisonke District Municipality</Guid>
        <DataUrl>Sisonke District Municipality</DataUrl>
        <ParentRegion>KwaZulu-Natal</ParentRegion>
    </Region>
    <Region>
        <Name>Amathole District Municipality</Name>
        <Guid>Amathole District Municipality</Guid>
        <DataUrl>Amathole District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>O.R. Tambo District Municipality</Name>
        <Guid>O.R. Tambo District Municipality</Guid>
        <DataUrl>O.R. Tambo District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Thabo Mofutsanyana District Municipality</Name>
        <Guid>Thabo Mofutsanyana District Municipality</Guid>
        <DataUrl>Thabo Mofutsanyana District Municipality</DataUrl>
        <ParentRegion>Free State</ParentRegion>
    </Region>
    <Region>
        <Name>Joe Gqabi District Municipality</Name>
        <Guid>Joe Gqabi District Municipality</Guid>
        <DataUrl>Joe Gqabi District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Cape Winelands District Municipality</Name>
        <Guid>Cape Winelands District Municipality</Guid>
        <DataUrl>Cape Winelands District Municipality</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Overberg District Municipality</Name>
        <Guid>Overberg District Municipality</Guid>
        <DataUrl>Overberg District Municipality</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Eden District Municipality</Name>
        <Guid>Eden District Municipality</Guid>
        <DataUrl>Eden District Municipality</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Pixley ka Seme District Municipality</Name>
        <Guid>Pixley ka Seme District Municipality</Guid>
        <DataUrl>Pixley ka Seme District Municipality</DataUrl>
        <ParentRegion>Northern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Sarah Baartman District Municipality</Name>
        <Guid>Sarah Baartman District Municipality</Guid>
        <DataUrl>Sarah Baartman District Municipality</DataUrl>
        <ParentRegion>Eastern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Central Karoo District Municipality</Name>
        <Guid>Central Karoo District Municipality</Guid>
        <DataUrl>Central Karoo District Municipality</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
    <Region>
        <Name>Namakwa District Municipality</Name>
        <Guid>Namakwa District Municipality</Guid>
        <DataUrl>Namakwa District Municipality</DataUrl>
        <ParentRegion>Northern Cape</ParentRegion>
    </Region>
    <Region>
        <Name>West Coast District Municipality</Name>
        <Guid>West Coast District Municipality</Guid>
        <DataUrl>West Coast District Municipality</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
    <Region>
        <Name>City of Cape Town</Name>
        <Guid>City of Cape Town</Guid>
        <DataUrl>City of Cape Town</DataUrl>
        <ParentRegion>Western Cape</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>Gauteng</Region>
        <Parameter>1</Parameter>
        <Value>12272263</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Gauteng</Region>
        <Parameter>2</Parameter>
        <Value>18176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North West</Region>
        <Parameter>1</Parameter>
        <Value>3509953</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>North West</Region>
        <Parameter>2</Parameter>
        <Value>104882</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mpumalanga</Region>
        <Parameter>1</Parameter>
        <Value>4039939</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mpumalanga</Region>
        <Parameter>2</Parameter>
        <Value>76495</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Limpopo</Region>
        <Parameter>1</Parameter>
        <Value>5404868</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Limpopo</Region>
        <Parameter>2</Parameter>
        <Value>125754</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KwaZulu-Natal</Region>
        <Parameter>1</Parameter>
        <Value>10267300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KwaZulu-Natal</Region>
        <Parameter>2</Parameter>
        <Value>94361</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Free State</Region>
        <Parameter>1</Parameter>
        <Value>2745590</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Free State</Region>
        <Parameter>2</Parameter>
        <Value>129825</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eastern Cape</Region>
        <Parameter>1</Parameter>
        <Value>6562053</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eastern Cape</Region>
        <Parameter>2</Parameter>
        <Value>168966</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Western Cape</Region>
        <Parameter>1</Parameter>
        <Value>5822734</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Western Cape</Region>
        <Parameter>2</Parameter>
        <Value>129462</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Northern Cape</Region>
        <Parameter>1</Parameter>
        <Value>1145861</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Northern Cape</Region>
        <Parameter>2</Parameter>
        <Value>372889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>ZF Mgcawu District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>236783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>ZF Mgcawu District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>102524</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Nelson Mandela Bay Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1152115</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Nelson Mandela Bay Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>1959</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Buffalo City Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>755200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Buffalo City Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>2536</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Chris Hani District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>795461</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Chris Hani District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>36144</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Xhariep District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>146259</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Xhariep District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>37674</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mangaung Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>747431</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mangaung Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>6284</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ekurhuleni Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>3178470</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ekurhuleni Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>1975</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Johannesburg Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>4434827</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Johannesburg Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>1645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Uthukela District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>668848</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Uthukela District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>11326</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Umkhanyakude District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>625846</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Umkhanyakude District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>12821</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>eThekwini Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>3442361</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>eThekwini Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>2291</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>uThungulu District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>907519</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>uThungulu District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>8213</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Umzinyathi District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>510838</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Umzinyathi District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>8589</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>uMgungundlovu District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1017763</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>uMgungundlovu District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>9513</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Capricorn District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1261463</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Capricorn District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>21705</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Amajuba District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>499839</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Amajuba District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>6911</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sedibeng District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>916484</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sedibeng District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>4173</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Nkangala</Region>
        <Parameter>1</Parameter>
        <Value>1308129</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Nkangala</Region>
        <Parameter>2</Parameter>
        <Value>16758</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sekhukhune District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1076840</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sekhukhune District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>13528</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Tshwane Metropolitan Municipality</Region>
        <Parameter>1</Parameter>
        <Value>2921488</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Tshwane Metropolitan Municipality</Region>
        <Parameter>2</Parameter>
        <Value>6298</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Waterberg District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>679336</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Waterberg District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>44913</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>John Taolo Gaetsewe District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>224799</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>John Taolo Gaetsewe District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>27283</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Bojanala Platinum District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1507505</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Bojanala Platinum District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>18333</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Rand District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>820995</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Rand District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>4087</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fezile Dabi District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>488036</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Fezile Dabi District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>20668</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Lejweleputswa District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>627626</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Lejweleputswa District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>31930</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ngaka Modiri Molema District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>842699</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ngaka Modiri Molema District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>28206</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dr Ruth Segomotsi Mompati District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>463815</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dr Ruth Segomotsi Mompati District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>43700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dr Kenneth Kaunda District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>695933</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Dr Kenneth Kaunda District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>14642</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Vhembe District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1294722</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Vhembe District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>25597</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Gert Sibande</Region>
        <Parameter>1</Parameter>
        <Value>1043194</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Gert Sibande</Region>
        <Parameter>2</Parameter>
        <Value>31841</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Frances Baard District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>382086</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Frances Baard District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>12836</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Alfred Nzo District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>801344</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Alfred Nzo District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>10731</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ugu District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>722484</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ugu District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>5047</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>iLembe District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>606809</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>iLembe District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>3269</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mopani District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1092507</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Mopani District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>20011</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ehlanzeni</Region>
        <Parameter>1</Parameter>
        <Value>1688615</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Ehlanzeni</Region>
        <Parameter>2</Parameter>
        <Value>27896</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Zululand District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>803575</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Zululand District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>14799</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sisonke District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>461419</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sisonke District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>10547</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Amathole District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>892637</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Amathole District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>21595</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>O.R. Tambo District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>1364943</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>O.R. Tambo District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>12096</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Thabo Mofutsanyana District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>736238</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Thabo Mofutsanyana District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>33269</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Joe Gqabi District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>349768</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Joe Gqabi District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>25663</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Cape Winelands District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>787490</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Cape Winelands District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>21473</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Overberg District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>258176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Overberg District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>12241</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eden District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>574265</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Eden District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>23331</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Pixley ka Seme District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>186351</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Pixley ka Seme District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>103410</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sarah Baartman District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>450584</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Sarah Baartman District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>58194</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Central Karoo District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>71011</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Central Karoo District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>38854</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Namakwa District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>115842</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>Namakwa District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>126836</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Coast District Municipality</Region>
        <Parameter>1</Parameter>
        <Value>391766</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>West Coast District Municipality</Region>
        <Parameter>2</Parameter>
        <Value>31119</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Cape Town</Region>
        <Parameter>1</Parameter>
        <Value>3740026</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>City of Cape Town</Region>
        <Parameter>2</Parameter>
        <Value>2445</Value>
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

