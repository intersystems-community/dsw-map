Class CZ.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("CZCube",0)
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("CZ.Area", "%KillExtent")
	do ..ImportXData("CZ.Region", "RegionXData")
	do ..ImportXData("CZ.Parameter", "ParameterXData")
	do ..ImportXData("CZ.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("CZ.Utils"_"||"_xDataName).Data
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
        <Name>Zlínský kraj</Name>
        <Guid>CZ072</Guid>
        <DataUrl>Zlínský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Hlavní město Praha</Name>
        <Guid>CZ010</Guid>
        <DataUrl>Hlavní město Praha</DataUrl>
    </Region>
    <Region>
        <Name>Jihočeský kraj</Name>
        <Guid>CZ031</Guid>
        <DataUrl>Jihočeský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Kraj Vysočina</Name>
        <Guid>CZ063</Guid>
        <DataUrl>Kraj Vysočina</DataUrl>
    </Region>
    <Region>
        <Name>Jihomoravský kraj</Name>
        <Guid>CZ064</Guid>
        <DataUrl>Jihomoravský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Karlovarský kraj</Name>
        <Guid>CZ041</Guid>
        <DataUrl>Karlovarský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Ústecký kraj</Name>
        <Guid>CZ042</Guid>
        <DataUrl>Ústecký kraj</DataUrl>
    </Region>
    <Region>
        <Name>Moravskoslezský kraj</Name>
        <Guid>CZ080</Guid>
        <DataUrl>Moravskoslezský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Plzeňský kraj</Name>
        <Guid>CZ032</Guid>
        <DataUrl>Plzeňský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Středočeský kraj</Name>
        <Guid>CZ020</Guid>
        <DataUrl>Středočeský kraj</DataUrl>
    </Region>
    <Region>
        <Name>Liberecký kraj</Name>
        <Guid>CZ051</Guid>
        <DataUrl>Liberecký kraj</DataUrl>
    </Region>
    <Region>
        <Name>Královéhradecký kraj</Name>
        <Guid>CZ052</Guid>
        <DataUrl>Královéhradecký kraj</DataUrl>
    </Region>
    <Region>
        <Name>Olomoucký kraj</Name>
        <Guid>CZ071</Guid>
        <DataUrl>Olomoucký kraj</DataUrl>
    </Region>
    <Region>
        <Name>Pardubický kraj</Name>
        <Guid>CZ053</Guid>
        <DataUrl>Pardubický kraj</DataUrl>
    </Region>
    <Region>
        <Name>okres Vsetín</Name>
        <Guid>CZ0723</Guid>
        <DataUrl>okres Vsetín</DataUrl>
        <ParentRegion>CZ072</ParentRegion>
    </Region>
    <Region>
        <Name>okres Ostrava-město</Name>
        <Guid>CZ0806</Guid>
        <DataUrl>okres Ostrava-město</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Brno-město</Name>
        <Guid>CZ0642</Guid>
        <DataUrl>okres Brno-město</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Frýdek-Místek</Name>
        <Guid>CZ0802</Guid>
        <DataUrl>okres Frýdek-Místek</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Chrudim</Name>
        <Guid>CZ0531</Guid>
        <DataUrl>okres Chrudim</DataUrl>
        <ParentRegion>CZ053</ParentRegion>
    </Region>
    <Region>
        <Name>okres Mělník</Name>
        <Guid>CZ0206</Guid>
        <DataUrl>okres Mělník</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Český Krumlov</Name>
        <Guid>CZ0312</Guid>
        <DataUrl>okres Český Krumlov</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Přerov</Name>
        <Guid>CZ0714</Guid>
        <DataUrl>okres Přerov</DataUrl>
        <ParentRegion>CZ071</ParentRegion>
    </Region>
    <Region>
        <Name>okres Plzeň-město</Name>
        <Guid>CZ0323</Guid>
        <DataUrl>okres Plzeň-město</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Karlovy Vary</Name>
        <Guid>CZ0412</Guid>
        <DataUrl>okres Karlovy Vary</DataUrl>
        <ParentRegion>CZ041</ParentRegion>
    </Region>
    <Region>
        <Name>okres Nový Jičín</Name>
        <Guid>CZ0804</Guid>
        <DataUrl>okres Nový Jičín</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Klatovy</Name>
        <Guid>CZ0322</Guid>
        <DataUrl>okres Klatovy</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres České Budějovice</Name>
        <Guid>CZ0311</Guid>
        <DataUrl>okres České Budějovice</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Sokolov</Name>
        <Guid>CZ0413</Guid>
        <DataUrl>okres Sokolov</DataUrl>
        <ParentRegion>CZ041</ParentRegion>
    </Region>
    <Region>
        <Name>okres Znojmo</Name>
        <Guid>CZ0647</Guid>
        <DataUrl>okres Znojmo</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Karviná</Name>
        <Guid>CZ0803</Guid>
        <DataUrl>okres Karviná</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Praha-východ</Name>
        <Guid>CZ0209</Guid>
        <DataUrl>okres Praha-východ</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Praha-západ</Name>
        <Guid>CZ020A</Guid>
        <DataUrl>okres Praha-západ</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Hlavní město Praha</Name>
        <Guid>CZ0100</Guid>
        <DataUrl>okres Hlavní město Praha</DataUrl>
        <ParentRegion>CZ010</ParentRegion>
    </Region>
    <Region>
        <Name>okres Prachatice</Name>
        <Guid>CZ0315</Guid>
        <DataUrl>okres Prachatice</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Strakonice</Name>
        <Guid>CZ0316</Guid>
        <DataUrl>okres Strakonice</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Písek</Name>
        <Guid>CZ0314</Guid>
        <DataUrl>okres Písek</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Příbram</Name>
        <Guid>CZ020B</Guid>
        <DataUrl>okres Příbram</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Benešov</Name>
        <Guid>CZ0201</Guid>
        <DataUrl>okres Benešov</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Pardubice</Name>
        <Guid>CZ0532</Guid>
        <DataUrl>okres Pardubice</DataUrl>
        <ParentRegion>CZ053</ParentRegion>
    </Region>
    <Region>
        <Name>okres Kutná Hora</Name>
        <Guid>CZ0205</Guid>
        <DataUrl>okres Kutná Hora</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Havlíčkův Brod</Name>
        <Guid>CZ0631</Guid>
        <DataUrl>okres Havlíčkův Brod</DataUrl>
        <ParentRegion>CZ063</ParentRegion>
    </Region>
    <Region>
        <Name>okres Žďár nad Sázavou</Name>
        <Guid>CZ0635</Guid>
        <DataUrl>okres Žďár nad Sázavou</DataUrl>
        <ParentRegion>CZ063</ParentRegion>
    </Region>
    <Region>
        <Name>okres Třebíč</Name>
        <Guid>CZ0634</Guid>
        <DataUrl>okres Třebíč</DataUrl>
        <ParentRegion>CZ063</ParentRegion>
    </Region>
    <Region>
        <Name>okres Louny</Name>
        <Guid>CZ0424</Guid>
        <DataUrl>okres Louny</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Kladno</Name>
        <Guid>CZ0203</Guid>
        <DataUrl>okres Kladno</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Kolín</Name>
        <Guid>CZ0204</Guid>
        <DataUrl>okres Kolín</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Nymburk</Name>
        <Guid>CZ0208</Guid>
        <DataUrl>okres Nymburk</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Semily</Name>
        <Guid>CZ0514</Guid>
        <DataUrl>okres Semily</DataUrl>
        <ParentRegion>CZ051</ParentRegion>
    </Region>
    <Region>
        <Name>okres Vyškov</Name>
        <Guid>CZ0646</Guid>
        <DataUrl>okres Vyškov</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Prostějov</Name>
        <Guid>CZ0713</Guid>
        <DataUrl>okres Prostějov</DataUrl>
        <ParentRegion>CZ071</ParentRegion>
    </Region>
    <Region>
        <Name>okres Litoměřice</Name>
        <Guid>CZ0423</Guid>
        <DataUrl>okres Litoměřice</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Cheb</Name>
        <Guid>CZ0411</Guid>
        <DataUrl>okres Cheb</DataUrl>
        <ParentRegion>CZ041</ParentRegion>
    </Region>
    <Region>
        <Name>okres Pelhřimov</Name>
        <Guid>CZ0633</Guid>
        <DataUrl>okres Pelhřimov</DataUrl>
        <ParentRegion>CZ063</ParentRegion>
    </Region>
    <Region>
        <Name>okres Jihlava</Name>
        <Guid>CZ0632</Guid>
        <DataUrl>okres Jihlava</DataUrl>
        <ParentRegion>CZ063</ParentRegion>
    </Region>
    <Region>
        <Name>okres Kroměříž</Name>
        <Guid>CZ0721</Guid>
        <DataUrl>okres Kroměříž</DataUrl>
        <ParentRegion>CZ072</ParentRegion>
    </Region>
    <Region>
        <Name>okres Plzeň-jih</Name>
        <Guid>CZ0324</Guid>
        <DataUrl>okres Plzeň-jih</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Děčín</Name>
        <Guid>CZ0421</Guid>
        <DataUrl>okres Děčín</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Hodonín</Name>
        <Guid>CZ0645</Guid>
        <DataUrl>okres Hodonín</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Břeclav</Name>
        <Guid>CZ0644</Guid>
        <DataUrl>okres Břeclav</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Teplice</Name>
        <Guid>CZ0426</Guid>
        <DataUrl>okres Teplice</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Ústí nad Labem</Name>
        <Guid>CZ0427</Guid>
        <DataUrl>okres Ústí nad Labem</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Olomouc</Name>
        <Guid>CZ0712</Guid>
        <DataUrl>okres Olomouc</DataUrl>
        <ParentRegion>CZ071</ParentRegion>
    </Region>
    <Region>
        <Name>okres Zlín</Name>
        <Guid>CZ0724</Guid>
        <DataUrl>okres Zlín</DataUrl>
        <ParentRegion>CZ072</ParentRegion>
    </Region>
    <Region>
        <Name>okres Uherské Hradiště</Name>
        <Guid>CZ0722</Guid>
        <DataUrl>okres Uherské Hradiště</DataUrl>
        <ParentRegion>CZ072</ParentRegion>
    </Region>
    <Region>
        <Name>okres Plzeň-sever</Name>
        <Guid>CZ0325</Guid>
        <DataUrl>okres Plzeň-sever</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Rakovník</Name>
        <Guid>CZ020C</Guid>
        <DataUrl>okres Rakovník</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Hradec Králové</Name>
        <Guid>CZ0521</Guid>
        <DataUrl>okres Hradec Králové</DataUrl>
        <ParentRegion>CZ052</ParentRegion>
    </Region>
    <Region>
        <Name>okres Jičín</Name>
        <Guid>CZ0522</Guid>
        <DataUrl>okres Jičín</DataUrl>
        <ParentRegion>CZ052</ParentRegion>
    </Region>
    <Region>
        <Name>okres Tábor</Name>
        <Guid>CZ0317</Guid>
        <DataUrl>okres Tábor</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Jindřichův Hradec</Name>
        <Guid>CZ0313</Guid>
        <DataUrl>okres Jindřichův Hradec</DataUrl>
        <ParentRegion>CZ031</ParentRegion>
    </Region>
    <Region>
        <Name>okres Bruntál</Name>
        <Guid>CZ0801</Guid>
        <DataUrl>okres Bruntál</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Opava</Name>
        <Guid>CZ0805</Guid>
        <DataUrl>okres Opava</DataUrl>
        <ParentRegion>CZ080</ParentRegion>
    </Region>
    <Region>
        <Name>okres Rokycany</Name>
        <Guid>CZ0326</Guid>
        <DataUrl>okres Rokycany</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Beroun</Name>
        <Guid>CZ0202</Guid>
        <DataUrl>okres Beroun</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Chomutov</Name>
        <Guid>CZ0422</Guid>
        <DataUrl>okres Chomutov</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Most</Name>
        <Guid>CZ0425</Guid>
        <DataUrl>okres Most</DataUrl>
        <ParentRegion>CZ042</ParentRegion>
    </Region>
    <Region>
        <Name>okres Domažlice</Name>
        <Guid>CZ0321</Guid>
        <DataUrl>okres Domažlice</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Tachov</Name>
        <Guid>CZ0327</Guid>
        <DataUrl>okres Tachov</DataUrl>
        <ParentRegion>CZ032</ParentRegion>
    </Region>
    <Region>
        <Name>okres Blansko</Name>
        <Guid>CZ0641</Guid>
        <DataUrl>okres Blansko</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Brno-venkov</Name>
        <Guid>CZ0643</Guid>
        <DataUrl>okres Brno-venkov</DataUrl>
        <ParentRegion>CZ064</ParentRegion>
    </Region>
    <Region>
        <Name>okres Mladá Boleslav</Name>
        <Guid>CZ0207</Guid>
        <DataUrl>okres Mladá Boleslav</DataUrl>
        <ParentRegion>CZ020</ParentRegion>
    </Region>
    <Region>
        <Name>okres Česká Lípa</Name>
        <Guid>CZ0511</Guid>
        <DataUrl>okres Česká Lípa</DataUrl>
        <ParentRegion>CZ051</ParentRegion>
    </Region>
    <Region>
        <Name>okres Trutnov</Name>
        <Guid>CZ0525</Guid>
        <DataUrl>okres Trutnov</DataUrl>
        <ParentRegion>CZ052</ParentRegion>
    </Region>
    <Region>
        <Name>okres Náchod</Name>
        <Guid>CZ0523</Guid>
        <DataUrl>okres Náchod</DataUrl>
        <ParentRegion>CZ052</ParentRegion>
    </Region>
    <Region>
        <Name>okres Jeseník</Name>
        <Guid>CZ0711</Guid>
        <DataUrl>okres Jeseník</DataUrl>
        <ParentRegion>CZ071</ParentRegion>
    </Region>
    <Region>
        <Name>okres Ústí nad Orlicí</Name>
        <Guid>CZ0534</Guid>
        <DataUrl>okres Ústí nad Orlicí</DataUrl>
        <ParentRegion>CZ053</ParentRegion>
    </Region>
    <Region>
        <Name>okres Rychnov nad Kněžnou</Name>
        <Guid>CZ0524</Guid>
        <DataUrl>okres Rychnov nad Kněžnou</DataUrl>
        <ParentRegion>CZ052</ParentRegion>
    </Region>
    <Region>
        <Name>okres Šumperk</Name>
        <Guid>CZ0715</Guid>
        <DataUrl>okres Šumperk</DataUrl>
        <ParentRegion>CZ071</ParentRegion>
    </Region>
    <Region>
        <Name>okres Svitavy</Name>
        <Guid>CZ0533</Guid>
        <DataUrl>okres Svitavy</DataUrl>
        <ParentRegion>CZ053</ParentRegion>
    </Region>
    <Region>
        <Name>okres Liberec</Name>
        <Guid>CZ0513</Guid>
        <DataUrl>okres Liberec</DataUrl>
        <ParentRegion>CZ051</ParentRegion>
    </Region>
    <Region>
        <Name>okres Jablonec nad Nisou</Name>
        <Guid>CZ0512</Guid>
        <DataUrl>okres Jablonec nad Nisou</DataUrl>
        <ParentRegion>CZ051</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>CZ072</Region>
        <Parameter>1</Parameter>
        <Value>587693</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ072</Region>
        <Parameter>2</Parameter>
        <Value>3963</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ010</Region>
        <Parameter>1</Parameter>
        <Value>1246780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ010</Region>
        <Parameter>2</Parameter>
        <Value>496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ031</Region>
        <Parameter>1</Parameter>
        <Value>636611</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ031</Region>
        <Parameter>2</Parameter>
        <Value>10056</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ063</Region>
        <Parameter>1</Parameter>
        <Value>511207</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ063</Region>
        <Parameter>2</Parameter>
        <Value>6796</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ064</Region>
        <Parameter>1</Parameter>
        <Value>1168650</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ064</Region>
        <Parameter>2</Parameter>
        <Value>7195</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ041</Region>
        <Parameter>1</Parameter>
        <Value>301726</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ041</Region>
        <Parameter>2</Parameter>
        <Value>3314</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ042</Region>
        <Parameter>1</Parameter>
        <Value>826764</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ042</Region>
        <Parameter>2</Parameter>
        <Value>5335</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ080</Region>
        <Parameter>1</Parameter>
        <Value>1226602</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ080</Region>
        <Parameter>2</Parameter>
        <Value>5427</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ032</Region>
        <Parameter>1</Parameter>
        <Value>572687</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ032</Region>
        <Parameter>2</Parameter>
        <Value>7649</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020</Region>
        <Parameter>1</Parameter>
        <Value>1291816</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020</Region>
        <Parameter>2</Parameter>
        <Value>10927</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ051</Region>
        <Parameter>1</Parameter>
        <Value>438594</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ051</Region>
        <Parameter>2</Parameter>
        <Value>3163</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ052</Region>
        <Parameter>1</Parameter>
        <Value>552946</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ052</Region>
        <Parameter>2</Parameter>
        <Value>4759</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ071</Region>
        <Parameter>1</Parameter>
        <Value>637609</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ071</Region>
        <Parameter>2</Parameter>
        <Value>5267</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ053</Region>
        <Parameter>1</Parameter>
        <Value>516440</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ053</Region>
        <Parameter>2</Parameter>
        <Value>4519</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0723</Region>
        <Parameter>1</Parameter>
        <Value>144675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0723</Region>
        <Parameter>2</Parameter>
        <Value>1142.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0806</Region>
        <Parameter>1</Parameter>
        <Value>328323</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0806</Region>
        <Parameter>2</Parameter>
        <Value>331.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0642</Region>
        <Parameter>1</Parameter>
        <Value>378327</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0642</Region>
        <Parameter>2</Parameter>
        <Value>230.22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0802</Region>
        <Parameter>1</Parameter>
        <Value>212448</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0802</Region>
        <Parameter>2</Parameter>
        <Value>1208.49</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0531</Region>
        <Parameter>1</Parameter>
        <Value>104206</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0531</Region>
        <Parameter>2</Parameter>
        <Value>992.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0206</Region>
        <Parameter>1</Parameter>
        <Value>104148</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0206</Region>
        <Parameter>2</Parameter>
        <Value>701.08</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0312</Region>
        <Parameter>1</Parameter>
        <Value>61231</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0312</Region>
        <Parameter>2</Parameter>
        <Value>1615.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0714</Region>
        <Parameter>1</Parameter>
        <Value>132662</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0714</Region>
        <Parameter>2</Parameter>
        <Value>844.74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0323</Region>
        <Parameter>1</Parameter>
        <Value>185275</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0323</Region>
        <Parameter>2</Parameter>
        <Value>261.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0412</Region>
        <Parameter>1</Parameter>
        <Value>117868</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0412</Region>
        <Parameter>2</Parameter>
        <Value>1514.95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0804</Region>
        <Parameter>1</Parameter>
        <Value>151960</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0804</Region>
        <Parameter>2</Parameter>
        <Value>881.59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0322</Region>
        <Parameter>1</Parameter>
        <Value>87340</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0322</Region>
        <Parameter>2</Parameter>
        <Value>1945.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0311</Region>
        <Parameter>1</Parameter>
        <Value>188264</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0311</Region>
        <Parameter>2</Parameter>
        <Value>1638.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0413</Region>
        <Parameter>1</Parameter>
        <Value>91301</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0413</Region>
        <Parameter>2</Parameter>
        <Value>753.6</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0647</Region>
        <Parameter>1</Parameter>
        <Value>113432</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0647</Region>
        <Parameter>2</Parameter>
        <Value>1590.5</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0803</Region>
        <Parameter>1</Parameter>
        <Value>260919</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0803</Region>
        <Parameter>2</Parameter>
        <Value>356.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0209</Region>
        <Parameter>1</Parameter>
        <Value>155588</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0209</Region>
        <Parameter>2</Parameter>
        <Value>754.91</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020A</Region>
        <Parameter>1</Parameter>
        <Value>128326</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020A</Region>
        <Parameter>2</Parameter>
        <Value>580.63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0100</Region>
        <Parameter>1</Parameter>
        <Value>1246780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0100</Region>
        <Parameter>2</Parameter>
        <Value>496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0315</Region>
        <Parameter>1</Parameter>
        <Value>51030</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0315</Region>
        <Parameter>2</Parameter>
        <Value>1375.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0316</Region>
        <Parameter>1</Parameter>
        <Value>70657</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0316</Region>
        <Parameter>2</Parameter>
        <Value>1032.1</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0314</Region>
        <Parameter>1</Parameter>
        <Value>70524</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0314</Region>
        <Parameter>2</Parameter>
        <Value>1138</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020B</Region>
        <Parameter>1</Parameter>
        <Value>113905</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020B</Region>
        <Parameter>2</Parameter>
        <Value>1562.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0201</Region>
        <Parameter>1</Parameter>
        <Value>95883</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0201</Region>
        <Parameter>2</Parameter>
        <Value>1474.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0532</Region>
        <Parameter>1</Parameter>
        <Value>168237</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0532</Region>
        <Parameter>2</Parameter>
        <Value>880.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0205</Region>
        <Parameter>1</Parameter>
        <Value>74359</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0205</Region>
        <Parameter>2</Parameter>
        <Value>916.93</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0631</Region>
        <Parameter>1</Parameter>
        <Value>95053</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0631</Region>
        <Parameter>2</Parameter>
        <Value>1264.95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0635</Region>
        <Parameter>1</Parameter>
        <Value>118646</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0635</Region>
        <Parameter>2</Parameter>
        <Value>1578.51</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0634</Region>
        <Parameter>1</Parameter>
        <Value>112833</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0634</Region>
        <Parameter>2</Parameter>
        <Value>1463</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0424</Region>
        <Parameter>1</Parameter>
        <Value>86613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0424</Region>
        <Parameter>2</Parameter>
        <Value>1117.59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0203</Region>
        <Parameter>1</Parameter>
        <Value>159984</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0203</Region>
        <Parameter>2</Parameter>
        <Value>719.61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0204</Region>
        <Parameter>1</Parameter>
        <Value>97279</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0204</Region>
        <Parameter>2</Parameter>
        <Value>743.57</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0208</Region>
        <Parameter>1</Parameter>
        <Value>95279</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0208</Region>
        <Parameter>2</Parameter>
        <Value>850.07</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0514</Region>
        <Parameter>1</Parameter>
        <Value>74563</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0514</Region>
        <Parameter>2</Parameter>
        <Value>698.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0646</Region>
        <Parameter>1</Parameter>
        <Value>89765</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0646</Region>
        <Parameter>2</Parameter>
        <Value>869</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0713</Region>
        <Parameter>1</Parameter>
        <Value>109346</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0713</Region>
        <Parameter>2</Parameter>
        <Value>777.32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0423</Region>
        <Parameter>1</Parameter>
        <Value>119318</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0423</Region>
        <Parameter>2</Parameter>
        <Value>1032.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0411</Region>
        <Parameter>1</Parameter>
        <Value>92557</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0411</Region>
        <Parameter>2</Parameter>
        <Value>1045.94</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0633</Region>
        <Parameter>1</Parameter>
        <Value>72411</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0633</Region>
        <Parameter>2</Parameter>
        <Value>1290</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0632</Region>
        <Parameter>1</Parameter>
        <Value>112264</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0632</Region>
        <Parameter>2</Parameter>
        <Value>1199.32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0721</Region>
        <Parameter>1</Parameter>
        <Value>106995</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0721</Region>
        <Parameter>2</Parameter>
        <Value>795.67</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0324</Region>
        <Parameter>1</Parameter>
        <Value>62163</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0324</Region>
        <Parameter>2</Parameter>
        <Value>996.55</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0421</Region>
        <Parameter>1</Parameter>
        <Value>132540</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0421</Region>
        <Parameter>2</Parameter>
        <Value>908.58</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0645</Region>
        <Parameter>1</Parameter>
        <Value>156165</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0645</Region>
        <Parameter>2</Parameter>
        <Value>1099.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0644</Region>
        <Parameter>1</Parameter>
        <Value>114940</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0644</Region>
        <Parameter>2</Parameter>
        <Value>1038.25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0426</Region>
        <Parameter>1</Parameter>
        <Value>128266</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0426</Region>
        <Parameter>2</Parameter>
        <Value>469.27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0427</Region>
        <Parameter>1</Parameter>
        <Value>119716</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0427</Region>
        <Parameter>2</Parameter>
        <Value>404.44</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0712</Region>
        <Parameter>1</Parameter>
        <Value>232267</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0712</Region>
        <Parameter>2</Parameter>
        <Value>1620.28</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0724</Region>
        <Parameter>1</Parameter>
        <Value>192529</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0724</Region>
        <Parameter>2</Parameter>
        <Value>1033.59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0722</Region>
        <Parameter>1</Parameter>
        <Value>143494</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0722</Region>
        <Parameter>2</Parameter>
        <Value>991.37</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0325</Region>
        <Parameter>1</Parameter>
        <Value>76232</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0325</Region>
        <Parameter>2</Parameter>
        <Value>1286.79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020C</Region>
        <Parameter>1</Parameter>
        <Value>55411</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ020C</Region>
        <Parameter>2</Parameter>
        <Value>896.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0521</Region>
        <Parameter>1</Parameter>
        <Value>162689</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0521</Region>
        <Parameter>2</Parameter>
        <Value>891.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0522</Region>
        <Parameter>1</Parameter>
        <Value>79314</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0522</Region>
        <Parameter>2</Parameter>
        <Value>886.63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0317</Region>
        <Parameter>1</Parameter>
        <Value>102683</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0317</Region>
        <Parameter>2</Parameter>
        <Value>1326.01</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0313</Region>
        <Parameter>1</Parameter>
        <Value>92222</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0313</Region>
        <Parameter>2</Parameter>
        <Value>1943.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0801</Region>
        <Parameter>1</Parameter>
        <Value>95873</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0801</Region>
        <Parameter>2</Parameter>
        <Value>1536.06</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0805</Region>
        <Parameter>1</Parameter>
        <Value>177079</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0805</Region>
        <Parameter>2</Parameter>
        <Value>1113.11</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0326</Region>
        <Parameter>1</Parameter>
        <Value>47770</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0326</Region>
        <Parameter>2</Parameter>
        <Value>629.57</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0202</Region>
        <Parameter>1</Parameter>
        <Value>87184</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0202</Region>
        <Parameter>2</Parameter>
        <Value>703.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0422</Region>
        <Parameter>1</Parameter>
        <Value>125306</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0422</Region>
        <Parameter>2</Parameter>
        <Value>935.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0425</Region>
        <Parameter>1</Parameter>
        <Value>115005</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0425</Region>
        <Parameter>2</Parameter>
        <Value>467.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0321</Region>
        <Parameter>1</Parameter>
        <Value>60858</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0321</Region>
        <Parameter>2</Parameter>
        <Value>1123.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0327</Region>
        <Parameter>1</Parameter>
        <Value>53049</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0327</Region>
        <Parameter>2</Parameter>
        <Value>1378.68</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0641</Region>
        <Parameter>1</Parameter>
        <Value>107354</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0641</Region>
        <Parameter>2</Parameter>
        <Value>862.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0643</Region>
        <Parameter>1</Parameter>
        <Value>208667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0643</Region>
        <Parameter>2</Parameter>
        <Value>1498.95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0207</Region>
        <Parameter>1</Parameter>
        <Value>124470</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0207</Region>
        <Parameter>2</Parameter>
        <Value>1022.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0511</Region>
        <Parameter>1</Parameter>
        <Value>103037</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0511</Region>
        <Parameter>2</Parameter>
        <Value>1072.91</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0525</Region>
        <Parameter>1</Parameter>
        <Value>119900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0525</Region>
        <Parameter>2</Parameter>
        <Value>1146.78</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0523</Region>
        <Parameter>1</Parameter>
        <Value>111874</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0523</Region>
        <Parameter>2</Parameter>
        <Value>851.57</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0711</Region>
        <Parameter>1</Parameter>
        <Value>40189</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0711</Region>
        <Parameter>2</Parameter>
        <Value>718.96</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0534</Region>
        <Parameter>1</Parameter>
        <Value>139026</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0534</Region>
        <Parameter>2</Parameter>
        <Value>1258.31</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0524</Region>
        <Parameter>1</Parameter>
        <Value>79169</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0524</Region>
        <Parameter>2</Parameter>
        <Value>981.78</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0715</Region>
        <Parameter>1</Parameter>
        <Value>123145</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0715</Region>
        <Parameter>2</Parameter>
        <Value>1313.06</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0533</Region>
        <Parameter>1</Parameter>
        <Value>104971</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0533</Region>
        <Parameter>2</Parameter>
        <Value>1378.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0513</Region>
        <Parameter>1</Parameter>
        <Value>171007</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0513</Region>
        <Parameter>2</Parameter>
        <Value>988.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0512</Region>
        <Parameter>1</Parameter>
        <Value>89987</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>CZ0512</Region>
        <Parameter>2</Parameter>
        <Value>402.3</Value>
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
