Class KZ.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("KZCube",0)
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("KZ.Area", "%KillExtent")
	do ..ImportXData("KZ.Region", "RegionXData")
	do ..ImportXData("KZ.Parameter", "ParameterXData")
	do ..ImportXData("KZ.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("KZ.Utils"_"||"_xDataName).Data
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
        <Name>Алматинская область</Name>
        <Guid>KAZ.1_1</Guid>
        <DataUrl>Алматинская область</DataUrl>
    </Region>
    <Region>
        <Name>Акмолинская область</Name>
        <Guid>KAZ.2_1</Guid>
        <DataUrl>Акмолинская область</DataUrl>
    </Region>
    <Region>
        <Name>Актюбинская область</Name>
        <Guid>KAZ.3_1</Guid>
        <DataUrl>Актюбинская область</DataUrl>
    </Region>
    <Region>
        <Name>Атырауская область</Name>
        <Guid>KAZ.4_1</Guid>
        <DataUrl>Атырауская область</DataUrl>
    </Region>
    <Region>
        <Name>Восточно-Казахстанская область</Name>
        <Guid>KAZ.5_1</Guid>
        <DataUrl>Восточно-Казахстанская область</DataUrl>
    </Region>
    <Region>
        <Name>Мангистауская область</Name>
        <Guid>KAZ.6_1</Guid>
        <DataUrl>Мангистауская область</DataUrl>
    </Region>
    <Region>
        <Name>Северо-Казахстанская область</Name>
        <Guid>KAZ.7_1</Guid>
        <DataUrl>Северо-Казахстанская область</DataUrl>
    </Region>
    <Region>
        <Name>Павлодарская область</Name>
        <Guid>KAZ.8_1</Guid>
        <DataUrl>Павлодарская область</DataUrl>
    </Region>
    <Region>
        <Name>Карагандинская область</Name>
        <Guid>KAZ.9_1</Guid>
        <DataUrl>Карагандинская область</DataUrl>
    </Region>
    <Region>
        <Name>Костанайская область</Name>
        <Guid>KAZ.10_1</Guid>
        <DataUrl>Костанайская область</DataUrl>
    </Region>
    <Region>
        <Name>Кызылординская область</Name>
        <Guid>KAZ.11_1</Guid>
        <DataUrl>Кызылординская область</DataUrl>
    </Region>
    <Region>
        <Name>Южно-Казахстанская область</Name>
        <Guid>KAZ.12_1</Guid>
        <DataUrl>Южно-Казахстанская область</DataUrl>
    </Region>
    <Region>
        <Name>Западно-Казахстанская область</Name>
        <Guid>KAZ.13_1</Guid>
        <DataUrl>Западно-Казахстанская область</DataUrl>
    </Region>
    <Region>
        <Name>Жамбылская область</Name>
        <Guid>KAZ.14_1</Guid>
        <DataUrl>Жамбылская область</DataUrl>
    </Region>
    <Region>
        <Name>Аксуский район</Name>
        <Guid>KAZ.1.1_1</Guid>
        <DataUrl>Аксуский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алакольский район</Name>
        <Guid>KAZ.1.2_1</Guid>
        <DataUrl>Алакольский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алматинский район</Name>
        <Guid>KAZ.1.3_1</Guid>
        <DataUrl>Алматинский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Балхашский район</Name>
        <Guid>KAZ.1.4_1</Guid>
        <DataUrl>Балхашский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Енбекшиказахский район</Name>
        <Guid>KAZ.1.5_1</Guid>
        <DataUrl>Енбекшиказахский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Илийский район</Name>
        <Guid>KAZ.1.6_1</Guid>
        <DataUrl>Илийский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Карасайский район</Name>
        <Guid>KAZ.1.7_1</Guid>
        <DataUrl>Карасайский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каратальский район</Name>
        <Guid>KAZ.1.8_1</Guid>
        <DataUrl>Каратальский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кербулакский район</Name>
        <Guid>KAZ.1.9_1</Guid>
        <DataUrl>Кербулакский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коксуский район</Name>
        <Guid>KAZ.1.10_1</Guid>
        <DataUrl>Коксуский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Панфиловский район</Name>
        <Guid>KAZ.1.11_1</Guid>
        <DataUrl>Панфиловский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Райымбекский район</Name>
        <Guid>KAZ.1.12_1</Guid>
        <DataUrl>Райымбекский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Саркандский район</Name>
        <Guid>KAZ.1.13_1</Guid>
        <DataUrl>Саркандский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Талдыкорган</Name>
        <Guid>KAZ.1.14_1</Guid>
        <DataUrl>Талдыкорган</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Талгарский район</Name>
        <Guid>KAZ.1.15_1</Guid>
        <DataUrl>Талгарский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Уйгурский район</Name>
        <Guid>KAZ.1.16_1</Guid>
        <DataUrl>Уйгурский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жамбылский район</Name>
        <Guid>KAZ.1.17_1</Guid>
        <DataUrl>Жамбылский район</DataUrl>
        <ParentRegion>KAZ.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аккольский район</Name>
        <Guid>KAZ.2.1_1</Guid>
        <DataUrl>Аккольский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аршалынский район</Name>
        <Guid>KAZ.2.2_1</Guid>
        <DataUrl>Аршалынский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Астраханский район</Name>
        <Guid>KAZ.2.3_1</Guid>
        <DataUrl>Астраханский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Атбасарский район</Name>
        <Guid>KAZ.2.4_1</Guid>
        <DataUrl>Атбасарский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Буландынский район</Name>
        <Guid>KAZ.2.5_1</Guid>
        <DataUrl>Буландынский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Егиндыкольский район</Name>
        <Guid>KAZ.2.6_1</Guid>
        <DataUrl>Егиндыкольский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Енбекшильдерский район</Name>
        <Guid>KAZ.2.7_1</Guid>
        <DataUrl>Енбекшильдерский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ерейментауский район</Name>
        <Guid>KAZ.2.8_1</Guid>
        <DataUrl>Ерейментауский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Есильский район</Name>
        <Guid>KAZ.2.9_1</Guid>
        <DataUrl>Есильский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коргалжынский район</Name>
        <Guid>KAZ.2.10_1</Guid>
        <DataUrl>Коргалжынский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сандыктауский район</Name>
        <Guid>KAZ.2.11_1</Guid>
        <DataUrl>Сандыктауский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шортандинский район</Name>
        <Guid>KAZ.2.12_1</Guid>
        <DataUrl>Шортандинский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бурабайский район</Name>
        <Guid>KAZ.2.13_1</Guid>
        <DataUrl>Бурабайский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Целиноградский район</Name>
        <Guid>KAZ.2.14_1</Guid>
        <DataUrl>Целиноградский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зерендинский район</Name>
        <Guid>KAZ.2.15_1</Guid>
        <DataUrl>Зерендинский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жаксынский район</Name>
        <Guid>KAZ.2.16_1</Guid>
        <DataUrl>Жаксынский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жаркаинский район</Name>
        <Guid>KAZ.2.17_1</Guid>
        <DataUrl>Жаркаинский район</DataUrl>
        <ParentRegion>KAZ.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алгинский район</Name>
        <Guid>KAZ.3.1_1</Guid>
        <DataUrl>Алгинский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Актобе</Name>
        <Guid>KAZ.3.2_1</Guid>
        <DataUrl>Актобе</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Айтекебийский район</Name>
        <Guid>KAZ.3.3_1</Guid>
        <DataUrl>Айтекебийский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Байганинский район</Name>
        <Guid>KAZ.3.4_1</Guid>
        <DataUrl>Байганинский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Иргизский район район</Name>
        <Guid>KAZ.3.5_1</Guid>
        <DataUrl>Иргизский район район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каргалинский район</Name>
        <Guid>KAZ.3.6_1</Guid>
        <DataUrl>Каргалинский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хобдинский район</Name>
        <Guid>KAZ.3.7_1</Guid>
        <DataUrl>Хобдинский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хромтауский район</Name>
        <Guid>KAZ.3.8_1</Guid>
        <DataUrl>Хромтауский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мартукский район</Name>
        <Guid>KAZ.3.9_1</Guid>
        <DataUrl>Мартукский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мугалжарский район</Name>
        <Guid>KAZ.3.10_1</Guid>
        <DataUrl>Мугалжарский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шалкарский район</Name>
        <Guid>KAZ.3.11_1</Guid>
        <DataUrl>Шалкарский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Темирский район</Name>
        <Guid>KAZ.3.12_1</Guid>
        <DataUrl>Темирский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Уилский район</Name>
        <Guid>KAZ.3.13_1</Guid>
        <DataUrl>Уилский район</DataUrl>
        <ParentRegion>KAZ.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Атырау</Name>
        <Guid>KAZ.4.1_1</Guid>
        <DataUrl>Атырау</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Индерский район</Name>
        <Guid>KAZ.4.2_1</Guid>
        <DataUrl>Индерский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Исатайский район</Name>
        <Guid>KAZ.4.3_1</Guid>
        <DataUrl>Исатайский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Курмангазинский район</Name>
        <Guid>KAZ.4.4_1</Guid>
        <DataUrl>Курмангазинский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кзылкогинский район</Name>
        <Guid>KAZ.4.5_1</Guid>
        <DataUrl>Кзылкогинский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Макатский район</Name>
        <Guid>KAZ.4.6_1</Guid>
        <DataUrl>Макатский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Махамбетский район</Name>
        <Guid>KAZ.4.7_1</Guid>
        <DataUrl>Махамбетский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жылыойский район</Name>
        <Guid>KAZ.4.8_1</Guid>
        <DataUrl>Жылыойский район</DataUrl>
        <ParentRegion>KAZ.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Абайский район</Name>
        <Guid>KAZ.5.1_1</Guid>
        <DataUrl>Абайский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аягозский район</Name>
        <Guid>KAZ.5.2_1</Guid>
        <DataUrl>Аягозский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бескарагайский район</Name>
        <Guid>KAZ.5.3_1</Guid>
        <DataUrl>Бескарагайский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бородулихинский район</Name>
        <Guid>KAZ.5.4_1</Guid>
        <DataUrl>Бородулихинский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Глубоковский район</Name>
        <Guid>KAZ.5.5_1</Guid>
        <DataUrl>Глубоковский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Катон-Карагайский район</Name>
        <Guid>KAZ.5.6_1</Guid>
        <DataUrl>Катон-Карагайский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кокпектинский район</Name>
        <Guid>KAZ.5.7_1</Guid>
        <DataUrl>Кокпектинский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Куршимский район</Name>
        <Guid>KAZ.5.8_1</Guid>
        <DataUrl>Куршимский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Риддер</Name>
        <Guid>KAZ.5.9_1</Guid>
        <DataUrl>Риддер</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Семей</Name>
        <Guid>KAZ.5.10_1</Guid>
        <DataUrl>Семей</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шемонаихинский район</Name>
        <Guid>KAZ.5.11_1</Guid>
        <DataUrl>Шемонаихинский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тарбагатайский район</Name>
        <Guid>KAZ.5.12_1</Guid>
        <DataUrl>Тарбагатайский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Уланский район</Name>
        <Guid>KAZ.5.13_1</Guid>
        <DataUrl>Уланский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Урджарский район</Name>
        <Guid>KAZ.5.14_1</Guid>
        <DataUrl>Урджарский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зайсанский район</Name>
        <Guid>KAZ.5.15_1</Guid>
        <DataUrl>Зайсанский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жарминский район</Name>
        <Guid>KAZ.5.16_1</Guid>
        <DataUrl>Жарминский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зыряновский район</Name>
        <Guid>KAZ.5.17_1</Guid>
        <DataUrl>Зыряновский район</DataUrl>
        <ParentRegion>KAZ.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Актау</Name>
        <Guid>KAZ.6.1_1</Guid>
        <DataUrl>Актау</DataUrl>
        <ParentRegion>KAZ.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бейнеуский район</Name>
        <Guid>KAZ.6.2_1</Guid>
        <DataUrl>Бейнеуский район</DataUrl>
        <ParentRegion>KAZ.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каракиянский район</Name>
        <Guid>KAZ.6.3_1</Guid>
        <DataUrl>Каракиянский район</DataUrl>
        <ParentRegion>KAZ.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мангистауский район</Name>
        <Guid>KAZ.6.4_1</Guid>
        <DataUrl>Мангистауский район</DataUrl>
        <ParentRegion>KAZ.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тупкараганский район</Name>
        <Guid>KAZ.6.5_1</Guid>
        <DataUrl>Тупкараганский район</DataUrl>
        <ParentRegion>KAZ.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Акжарский район</Name>
        <Guid>KAZ.7.1_1</Guid>
        <DataUrl>Акжарский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Айыртауский район</Name>
        <Guid>KAZ.7.2_1</Guid>
        <DataUrl>Айыртауский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Район Магжана Жумабаева</Name>
        <Guid>KAZ.7.3_1</Guid>
        <DataUrl>Район Магжана Жумабаева</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Есильский район</Name>
        <Guid>KAZ.7.4_1</Guid>
        <DataUrl>Есильский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кызылжарский район</Name>
        <Guid>KAZ.7.5_1</Guid>
        <DataUrl>Кызылжарский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мамлютский район</Name>
        <Guid>KAZ.7.6_1</Guid>
        <DataUrl>Мамлютский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Район Шал Акына</Name>
        <Guid>KAZ.7.7_1</Guid>
        <DataUrl>Район Шал Акына</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аккайынский район</Name>
        <Guid>KAZ.7.8_1</Guid>
        <DataUrl>Аккайынский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тайыншинский район</Name>
        <Guid>KAZ.7.9_1</Guid>
        <DataUrl>Тайыншинский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тимирязевский район</Name>
        <Guid>KAZ.7.10_1</Guid>
        <DataUrl>Тимирязевский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Район имени Габита Мусрепова</Name>
        <Guid>KAZ.7.11_1</Guid>
        <DataUrl>Район имени Габита Мусрепова</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Уалихановский район</Name>
        <Guid>KAZ.7.12_1</Guid>
        <DataUrl>Уалихановский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жамбылский район</Name>
        <Guid>KAZ.7.13_1</Guid>
        <DataUrl>Жамбылский район</DataUrl>
        <ParentRegion>KAZ.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аксуский район</Name>
        <Guid>KAZ.8.1_1</Guid>
        <DataUrl>Аксуский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Актогайский район</Name>
        <Guid>KAZ.8.2_1</Guid>
        <DataUrl>Актогайский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Баянаулький район</Name>
        <Guid>KAZ.8.3_1</Guid>
        <DataUrl>Баянаулький район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Экибастуз</Name>
        <Guid>KAZ.8.4_1</Guid>
        <DataUrl>Экибастуз</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Иртышский район</Name>
        <Guid>KAZ.8.5_1</Guid>
        <DataUrl>Иртышский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Качирский район</Name>
        <Guid>KAZ.8.6_1</Guid>
        <DataUrl>Качирский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лебяжинский район</Name>
        <Guid>KAZ.8.7_1</Guid>
        <DataUrl>Лебяжинский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Майский район</Name>
        <Guid>KAZ.8.8_1</Guid>
        <DataUrl>Майский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Павлодарский район</Name>
        <Guid>KAZ.8.9_1</Guid>
        <DataUrl>Павлодарский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Щербактинский район</Name>
        <Guid>KAZ.8.10_1</Guid>
        <DataUrl>Щербактинский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Успенский район</Name>
        <Guid>KAZ.8.11_1</Guid>
        <DataUrl>Успенский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Железинский район</Name>
        <Guid>KAZ.8.12_1</Guid>
        <DataUrl>Железинский район</DataUrl>
        <ParentRegion>KAZ.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Абайский район</Name>
        <Guid>KAZ.9.1_1</Guid>
        <DataUrl>Абайский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Актогайский район</Name>
        <Guid>KAZ.9.2_1</Guid>
        <DataUrl>Актогайский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бухар-Жырауский район</Name>
        <Guid>KAZ.9.3_1</Guid>
        <DataUrl>Бухар-Жырауский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каркаралинский район</Name>
        <Guid>KAZ.9.4_1</Guid>
        <DataUrl>Каркаралинский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нуринский район</Name>
        <Guid>KAZ.9.5_1</Guid>
        <DataUrl>Нуринский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Осакаровский район</Name>
        <Guid>KAZ.9.6_1</Guid>
        <DataUrl>Осакаровский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шетский район</Name>
        <Guid>KAZ.9.7_1</Guid>
        <DataUrl>Шетский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Улытауский район</Name>
        <Guid>KAZ.9.8_1</Guid>
        <DataUrl>Улытауский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жанааркинский район</Name>
        <Guid>KAZ.9.9_1</Guid>
        <DataUrl>Жанааркинский район</DataUrl>
        <ParentRegion>KAZ.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алтынсаринский район</Name>
        <Guid>KAZ.10.1_1</Guid>
        <DataUrl>Алтынсаринский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Амангельдинский район</Name>
        <Guid>KAZ.10.2_1</Guid>
        <DataUrl>Амангельдинский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аркалык</Name>
        <Guid>KAZ.10.3_1</Guid>
        <DataUrl>Аркалык</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аулиекольский район</Name>
        <Guid>KAZ.10.4_1</Guid>
        <DataUrl>Аулиекольский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Денисовский район</Name>
        <Guid>KAZ.10.5_1</Guid>
        <DataUrl>Денисовский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Джангельдинский район</Name>
        <Guid>KAZ.10.6_1</Guid>
        <DataUrl>Джангельдинский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Федоровский райо</Name>
        <Guid>KAZ.10.7_1</Guid>
        <DataUrl>Федоровский райо</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Камыстинский район</Name>
        <Guid>KAZ.10.8_1</Guid>
        <DataUrl>Камыстинский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Карабалыкский район</Name>
        <Guid>KAZ.10.9_1</Guid>
        <DataUrl>Карабалыкский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Карасуский район</Name>
        <Guid>KAZ.10.10_1</Guid>
        <DataUrl>Карасуский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мендыкаринский район</Name>
        <Guid>KAZ.10.11_1</Guid>
        <DataUrl>Мендыкаринский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Наурзумский район</Name>
        <Guid>KAZ.10.12_1</Guid>
        <DataUrl>Наурзумский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Костанай</Name>
        <Guid>KAZ.10.13_1</Guid>
        <DataUrl>Костанай</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сарыкольский район</Name>
        <Guid>KAZ.10.14_1</Guid>
        <DataUrl>Сарыкольский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тарановский район</Name>
        <Guid>KAZ.10.15_1</Guid>
        <DataUrl>Тарановский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Узункольский район</Name>
        <Guid>KAZ.10.16_1</Guid>
        <DataUrl>Узункольский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Житикаринский район</Name>
        <Guid>KAZ.10.17_1</Guid>
        <DataUrl>Житикаринский район</DataUrl>
        <ParentRegion>KAZ.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Аральский район</Name>
        <Guid>KAZ.11.1_1</Guid>
        <DataUrl>Аральский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кармакшинский район</Name>
        <Guid>KAZ.11.2_1</Guid>
        <DataUrl>Кармакшинский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Казалинский район</Name>
        <Guid>KAZ.11.3_1</Guid>
        <DataUrl>Казалинский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кызылорда</Name>
        <Guid>KAZ.11.4_1</Guid>
        <DataUrl>Кызылорда</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шиелийский район</Name>
        <Guid>KAZ.11.5_1</Guid>
        <DataUrl>Шиелийский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шиелийский район</Name>
        <Guid>KAZ.11.6_1</Guid>
        <DataUrl>Шиелийский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жалагашский район</Name>
        <Guid>KAZ.11.7_1</Guid>
        <DataUrl>Жалагашский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жанакорганский район</Name>
        <Guid>KAZ.11.8_1</Guid>
        <DataUrl>Жанакорганский район</DataUrl>
        <ParentRegion>KAZ.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Арысский район</Name>
        <Guid>KAZ.12.1_1</Guid>
        <DataUrl>Арысский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Байдибекский район</Name>
        <Guid>KAZ.12.2_1</Guid>
        <DataUrl>Байдибекский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шардаринский район</Name>
        <Guid>KAZ.12.3_1</Guid>
        <DataUrl>Шардаринский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Казыгуртский район</Name>
        <Guid>KAZ.12.4_1</Guid>
        <DataUrl>Казыгуртский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мактааралский район</Name>
        <Guid>KAZ.12.5_1</Guid>
        <DataUrl>Мактааралский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ордабасынский район</Name>
        <Guid>KAZ.12.6_1</Guid>
        <DataUrl>Ордабасынский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Отырарский район</Name>
        <Guid>KAZ.12.7_1</Guid>
        <DataUrl>Отырарский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сарыагашский район</Name>
        <Guid>KAZ.12.8_1</Guid>
        <DataUrl>Сарыагашский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сайрамский район</Name>
        <Guid>KAZ.12.9_1</Guid>
        <DataUrl>Сайрамский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шымкент</Name>
        <Guid>KAZ.12.10_1</Guid>
        <DataUrl>Шымкент</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сузакский район</Name>
        <Guid>KAZ.12.11_1</Guid>
        <DataUrl>Сузакский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Толебийский район</Name>
        <Guid>KAZ.12.12_1</Guid>
        <DataUrl>Толебийский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Туркестан</Name>
        <Guid>KAZ.12.13_1</Guid>
        <DataUrl>Туркестан</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тюлькубасский район</Name>
        <Guid>KAZ.12.14_1</Guid>
        <DataUrl>Тюлькубасский район</DataUrl>
        <ParentRegion>KAZ.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Акжаикский район</Name>
        <Guid>KAZ.13.1_1</Guid>
        <DataUrl>Акжаикский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бурлинский район</Name>
        <Guid>KAZ.13.2_1</Guid>
        <DataUrl>Бурлинский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чингирлауский район</Name>
        <Guid>KAZ.13.3_1</Guid>
        <DataUrl>Чингирлауский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жангалинский район</Name>
        <Guid>KAZ.13.4_1</Guid>
        <DataUrl>Жангалинский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жанибекский район</Name>
        <Guid>KAZ.13.5_1</Guid>
        <DataUrl>Жанибекский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каратобинский район</Name>
        <Guid>KAZ.13.6_1</Guid>
        <DataUrl>Каратобинский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Казталовский район</Name>
        <Guid>KAZ.13.7_1</Guid>
        <DataUrl>Казталовский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сырымский район</Name>
        <Guid>KAZ.13.8_1</Guid>
        <DataUrl>Сырымский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Таскалинский район</Name>
        <Guid>KAZ.13.9_1</Guid>
        <DataUrl>Таскалинский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Теректинский район</Name>
        <Guid>KAZ.13.10_1</Guid>
        <DataUrl>Теректинский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бокейординский район</Name>
        <Guid>KAZ.13.11_1</Guid>
        <DataUrl>Бокейординский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зеленовский район</Name>
        <Guid>KAZ.13.12_1</Guid>
        <DataUrl>Зеленовский район</DataUrl>
        <ParentRegion>KAZ.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Байзакский район</Name>
        <Guid>KAZ.14.1_1</Guid>
        <DataUrl>Байзакский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кордайский район</Name>
        <Guid>KAZ.14.2_1</Guid>
        <DataUrl>Кордайский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>район имени Тура Рыскулова</Name>
        <Guid>KAZ.14.3_1</Guid>
        <DataUrl>район имени Тура Рыскулова</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Меркенский район</Name>
        <Guid>KAZ.14.4_1</Guid>
        <DataUrl>Меркенский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мойынкумский район</Name>
        <Guid>KAZ.14.5_1</Guid>
        <DataUrl>Мойынкумский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сарысуский район</Name>
        <Guid>KAZ.14.6_1</Guid>
        <DataUrl>Сарысуский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шуский район</Name>
        <Guid>KAZ.14.7_1</Guid>
        <DataUrl>Шуский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Таласский район</Name>
        <Guid>KAZ.14.8_1</Guid>
        <DataUrl>Таласский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Таласский район</Name>
        <Guid>KAZ.14.9_1</Guid>
        <DataUrl>Таласский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Таласский район</Name>
        <Guid>KAZ.14.10_1</Guid>
        <DataUrl>Таласский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жуалынский район</Name>
        <Guid>KAZ.14.11_1</Guid>
        <DataUrl>Жуалынский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жуалынский район</Name>
        <Guid>KAZ.14.12_1</Guid>
        <DataUrl>Жуалынский район</DataUrl>
        <ParentRegion>KAZ.14_1</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>KAZ.1_1</Region>
        <Parameter>1</Parameter>
        <Value>1949837</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1_1</Region>
        <Parameter>2</Parameter>
        <Value>223911</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2_1</Region>
        <Parameter>1</Parameter>
        <Value>715000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2_1</Region>
        <Parameter>2</Parameter>
        <Value>146219</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3_1</Region>
        <Parameter>1</Parameter>
        <Value>797036</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3_1</Region>
        <Parameter>2</Parameter>
        <Value>300629</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4_1</Region>
        <Parameter>1</Parameter>
        <Value>556388</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4_1</Region>
        <Parameter>2</Parameter>
        <Value>118631</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5_1</Region>
        <Parameter>1</Parameter>
        <Value>1393932</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5_1</Region>
        <Parameter>2</Parameter>
        <Value>283226</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6_1</Region>
        <Parameter>1</Parameter>
        <Value>596706</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6_1</Region>
        <Parameter>2</Parameter>
        <Value>165642</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7_1</Region>
        <Parameter>1</Parameter>
        <Value>579403</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7_1</Region>
        <Parameter>2</Parameter>
        <Value>97993</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8_1</Region>
        <Parameter>1</Parameter>
        <Value>749516</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8_1</Region>
        <Parameter>2</Parameter>
        <Value>124800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9_1</Region>
        <Parameter>1</Parameter>
        <Value>1363638</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9_1</Region>
        <Parameter>2</Parameter>
        <Value>427982</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10_1</Region>
        <Parameter>1</Parameter>
        <Value>882961</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10_1</Region>
        <Parameter>2</Parameter>
        <Value>196001</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11_1</Region>
        <Parameter>1</Parameter>
        <Value>727990</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11_1</Region>
        <Parameter>2</Parameter>
        <Value>226019</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12_1</Region>
        <Parameter>1</Parameter>
        <Value>2685009</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12_1</Region>
        <Parameter>2</Parameter>
        <Value>117249</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13_1</Region>
        <Parameter>1</Parameter>
        <Value>618261</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13_1</Region>
        <Parameter>2</Parameter>
        <Value>151339</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14_1</Region>
        <Parameter>1</Parameter>
        <Value>1071645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14_1</Region>
        <Parameter>2</Parameter>
        <Value>144264</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.1_1</Region>
        <Parameter>1</Parameter>
        <Value>40594</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.1_1</Region>
        <Parameter>2</Parameter>
        <Value>12000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.2_1</Region>
        <Parameter>1</Parameter>
        <Value>76662</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.2_1</Region>
        <Parameter>2</Parameter>
        <Value>23700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.3_1</Region>
        <Parameter>1</Parameter>
        <Value>379943</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.3_1</Region>
        <Parameter>2</Parameter>
        <Value>154.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.4_1</Region>
        <Parameter>1</Parameter>
        <Value>29996</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.4_1</Region>
        <Parameter>2</Parameter>
        <Value>37400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.5_1</Region>
        <Parameter>1</Parameter>
        <Value>291176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.5_1</Region>
        <Parameter>2</Parameter>
        <Value>8300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.6_1</Region>
        <Parameter>1</Parameter>
        <Value>154124</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.6_1</Region>
        <Parameter>2</Parameter>
        <Value>7800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.7_1</Region>
        <Parameter>1</Parameter>
        <Value>230064</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.7_1</Region>
        <Parameter>2</Parameter>
        <Value>2000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.8_1</Region>
        <Parameter>1</Parameter>
        <Value>48663</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.8_1</Region>
        <Parameter>2</Parameter>
        <Value>24200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.9_1</Region>
        <Parameter>1</Parameter>
        <Value>50189</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.9_1</Region>
        <Parameter>2</Parameter>
        <Value>11500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.10_1</Region>
        <Parameter>1</Parameter>
        <Value>40869</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.10_1</Region>
        <Parameter>2</Parameter>
        <Value>7100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.11_1</Region>
        <Parameter>1</Parameter>
        <Value>126992</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.11_1</Region>
        <Parameter>2</Parameter>
        <Value>10600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.12_1</Region>
        <Parameter>1</Parameter>
        <Value>76696</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.12_1</Region>
        <Parameter>2</Parameter>
        <Value>14200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.13_1</Region>
        <Parameter>1</Parameter>
        <Value>41796</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.13_1</Region>
        <Parameter>2</Parameter>
        <Value>24400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.14_1</Region>
        <Parameter>1</Parameter>
        <Value>173000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.14_1</Region>
        <Parameter>2</Parameter>
        <Value>100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.15_1</Region>
        <Parameter>1</Parameter>
        <Value>186545</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.15_1</Region>
        <Parameter>2</Parameter>
        <Value>3000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.16_1</Region>
        <Parameter>1</Parameter>
        <Value>63366</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.16_1</Region>
        <Parameter>2</Parameter>
        <Value>8787</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.17_1</Region>
        <Parameter>1</Parameter>
        <Value>153946</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.1.17_1</Region>
        <Parameter>2</Parameter>
        <Value>19300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.1_1</Region>
        <Parameter>1</Parameter>
        <Value>29462</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.1_1</Region>
        <Parameter>2</Parameter>
        <Value>9400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.2_1</Region>
        <Parameter>1</Parameter>
        <Value>24330</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.2_1</Region>
        <Parameter>2</Parameter>
        <Value>5847</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.3_1</Region>
        <Parameter>1</Parameter>
        <Value>27159</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.3_1</Region>
        <Parameter>2</Parameter>
        <Value>7400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.4_1</Region>
        <Parameter>1</Parameter>
        <Value>52190</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.4_1</Region>
        <Parameter>2</Parameter>
        <Value>10635</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.5_1</Region>
        <Parameter>1</Parameter>
        <Value>36638</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.5_1</Region>
        <Parameter>2</Parameter>
        <Value>6400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.6_1</Region>
        <Parameter>1</Parameter>
        <Value>6826</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.6_1</Region>
        <Parameter>2</Parameter>
        <Value>5400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.7_1</Region>
        <Parameter>1</Parameter>
        <Value>17513</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.7_1</Region>
        <Parameter>2</Parameter>
        <Value>11000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.8_1</Region>
        <Parameter>1</Parameter>
        <Value>33908</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.8_1</Region>
        <Parameter>2</Parameter>
        <Value>17500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.9_1</Region>
        <Parameter>1</Parameter>
        <Value>28890</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.9_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.10_1</Region>
        <Parameter>1</Parameter>
        <Value>9855</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.10_1</Region>
        <Parameter>2</Parameter>
        <Value>9300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.11_1</Region>
        <Parameter>1</Parameter>
        <Value>22341</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.11_1</Region>
        <Parameter>2</Parameter>
        <Value>6400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.12_1</Region>
        <Parameter>1</Parameter>
        <Value>30055</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.12_1</Region>
        <Parameter>2</Parameter>
        <Value>4700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.13_1</Region>
        <Parameter>1</Parameter>
        <Value>73545</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.13_1</Region>
        <Parameter>2</Parameter>
        <Value>5900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.14_1</Region>
        <Parameter>1</Parameter>
        <Value>43063</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.14_1</Region>
        <Parameter>2</Parameter>
        <Value>7887</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.15_1</Region>
        <Parameter>1</Parameter>
        <Value>39497</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.15_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.16_1</Region>
        <Parameter>1</Parameter>
        <Value>23963</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.16_1</Region>
        <Parameter>2</Parameter>
        <Value>9700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.17_1</Region>
        <Parameter>1</Parameter>
        <Value>17805</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.2.17_1</Region>
        <Parameter>2</Parameter>
        <Value>12100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.1_1</Region>
        <Parameter>1</Parameter>
        <Value>40069</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.1_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.2_1</Region>
        <Parameter>1</Parameter>
        <Value>417471</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.2_1</Region>
        <Parameter>2</Parameter>
        <Value>297</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.3_1</Region>
        <Parameter>1</Parameter>
        <Value>26240</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.3_1</Region>
        <Parameter>2</Parameter>
        <Value>36000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.4_1</Region>
        <Parameter>1</Parameter>
        <Value>22691</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.4_1</Region>
        <Parameter>2</Parameter>
        <Value>61000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.5_1</Region>
        <Parameter>1</Parameter>
        <Value>14981</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.5_1</Region>
        <Parameter>2</Parameter>
        <Value>41500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.6_1</Region>
        <Parameter>1</Parameter>
        <Value>17156</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.6_1</Region>
        <Parameter>2</Parameter>
        <Value>5000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.7_1</Region>
        <Parameter>1</Parameter>
        <Value>18724</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.7_1</Region>
        <Parameter>2</Parameter>
        <Value>14000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.8_1</Region>
        <Parameter>1</Parameter>
        <Value>42351</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.8_1</Region>
        <Parameter>2</Parameter>
        <Value>12900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.9_1</Region>
        <Parameter>1</Parameter>
        <Value>30146</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.9_1</Region>
        <Parameter>2</Parameter>
        <Value>6600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.10_1</Region>
        <Parameter>1</Parameter>
        <Value>67106</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.10_1</Region>
        <Parameter>2</Parameter>
        <Value>29530</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.11_1</Region>
        <Parameter>1</Parameter>
        <Value>45818</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.11_1</Region>
        <Parameter>2</Parameter>
        <Value>62200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.12_1</Region>
        <Parameter>1</Parameter>
        <Value>37667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.12_1</Region>
        <Parameter>2</Parameter>
        <Value>12600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.13_1</Region>
        <Parameter>1</Parameter>
        <Value>18658</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.3.13_1</Region>
        <Parameter>2</Parameter>
        <Value>11500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.1_1</Region>
        <Parameter>1</Parameter>
        <Value>235175</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.2_1</Region>
        <Parameter>1</Parameter>
        <Value>33505</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.2_1</Region>
        <Parameter>2</Parameter>
        <Value>10900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.3_1</Region>
        <Parameter>1</Parameter>
        <Value>26600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.3_1</Region>
        <Parameter>2</Parameter>
        <Value>14700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.4_1</Region>
        <Parameter>1</Parameter>
        <Value>58103</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.4_1</Region>
        <Parameter>2</Parameter>
        <Value>20800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.5_1</Region>
        <Parameter>1</Parameter>
        <Value>31777</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.5_1</Region>
        <Parameter>2</Parameter>
        <Value>24900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.6_1</Region>
        <Parameter>1</Parameter>
        <Value>30112</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.6_1</Region>
        <Parameter>2</Parameter>
        <Value>4900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.7_1</Region>
        <Parameter>1</Parameter>
        <Value>33739</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.7_1</Region>
        <Parameter>2</Parameter>
        <Value>9600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.8_1</Region>
        <Parameter>1</Parameter>
        <Value>79319</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.4.8_1</Region>
        <Parameter>2</Parameter>
        <Value>29400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.1_1</Region>
        <Parameter>1</Parameter>
        <Value>15371</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.1_1</Region>
        <Parameter>2</Parameter>
        <Value>20093</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.2_1</Region>
        <Parameter>1</Parameter>
        <Value>73992</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.2_1</Region>
        <Parameter>2</Parameter>
        <Value>49558</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.3_1</Region>
        <Parameter>1</Parameter>
        <Value>20604</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.3_1</Region>
        <Parameter>2</Parameter>
        <Value>11400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.4_1</Region>
        <Parameter>1</Parameter>
        <Value>36786</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.4_1</Region>
        <Parameter>2</Parameter>
        <Value>6989</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.5_1</Region>
        <Parameter>1</Parameter>
        <Value>64245</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.5_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.6_1</Region>
        <Parameter>1</Parameter>
        <Value>25745</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.6_1</Region>
        <Parameter>2</Parameter>
        <Value>13167</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.7_1</Region>
        <Parameter>1</Parameter>
        <Value>31415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.7_1</Region>
        <Parameter>2</Parameter>
        <Value>14575</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.8_1</Region>
        <Parameter>1</Parameter>
        <Value>27104</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.8_1</Region>
        <Parameter>2</Parameter>
        <Value>23000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.9_1</Region>
        <Parameter>1</Parameter>
        <Value>49695</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.9_1</Region>
        <Parameter>2</Parameter>
        <Value>4880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.10_1</Region>
        <Parameter>1</Parameter>
        <Value>340000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.10_1</Region>
        <Parameter>2</Parameter>
        <Value>210</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.11_1</Region>
        <Parameter>1</Parameter>
        <Value>45709</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.11_1</Region>
        <Parameter>2</Parameter>
        <Value>4000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.12_1</Region>
        <Parameter>1</Parameter>
        <Value>42681</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.12_1</Region>
        <Parameter>2</Parameter>
        <Value>23731.9</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.13_1</Region>
        <Parameter>1</Parameter>
        <Value>40352</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.13_1</Region>
        <Parameter>2</Parameter>
        <Value>9610</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.14_1</Region>
        <Parameter>1</Parameter>
        <Value>79652</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.14_1</Region>
        <Parameter>2</Parameter>
        <Value>23400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.15_1</Region>
        <Parameter>1</Parameter>
        <Value>37940</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.15_1</Region>
        <Parameter>2</Parameter>
        <Value>10000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.16_1</Region>
        <Parameter>1</Parameter>
        <Value>41033</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.16_1</Region>
        <Parameter>2</Parameter>
        <Value>22600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.17_1</Region>
        <Parameter>1</Parameter>
        <Value>71229</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.5.17_1</Region>
        <Parameter>2</Parameter>
        <Value>10500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.1_1</Region>
        <Parameter>1</Parameter>
        <Value>183350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.1_1</Region>
        <Parameter>2</Parameter>
        <Value>76</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.2_1</Region>
        <Parameter>1</Parameter>
        <Value>68075</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.2_1</Region>
        <Parameter>2</Parameter>
        <Value>40519</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.3_1</Region>
        <Parameter>1</Parameter>
        <Value>34066</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.3_1</Region>
        <Parameter>2</Parameter>
        <Value>64297</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.4_1</Region>
        <Parameter>1</Parameter>
        <Value>38306</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.4_1</Region>
        <Parameter>2</Parameter>
        <Value>47018</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.5_1</Region>
        <Parameter>1</Parameter>
        <Value>24128</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.6.5_1</Region>
        <Parameter>2</Parameter>
        <Value>8520</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.1_1</Region>
        <Parameter>1</Parameter>
        <Value>15887</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.1_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.2_1</Region>
        <Parameter>1</Parameter>
        <Value>39621</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.2_1</Region>
        <Parameter>2</Parameter>
        <Value>9620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.3_1</Region>
        <Parameter>1</Parameter>
        <Value>32313</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.3_1</Region>
        <Parameter>2</Parameter>
        <Value>7810</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.4_1</Region>
        <Parameter>1</Parameter>
        <Value>25367</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.4_1</Region>
        <Parameter>2</Parameter>
        <Value>5140</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.5_1</Region>
        <Parameter>1</Parameter>
        <Value>44564</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.5_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.6_1</Region>
        <Parameter>1</Parameter>
        <Value>19488</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.6_1</Region>
        <Parameter>2</Parameter>
        <Value>4100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.7_1</Region>
        <Parameter>1</Parameter>
        <Value>20179</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.7_1</Region>
        <Parameter>2</Parameter>
        <Value>4841</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.8_1</Region>
        <Parameter>1</Parameter>
        <Value>20847</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.8_1</Region>
        <Parameter>2</Parameter>
        <Value>4500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.9_1</Region>
        <Parameter>1</Parameter>
        <Value>45564</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.9_1</Region>
        <Parameter>2</Parameter>
        <Value>11430</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.10_1</Region>
        <Parameter>1</Parameter>
        <Value>13542</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.10_1</Region>
        <Parameter>2</Parameter>
        <Value>4510</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.11_1</Region>
        <Parameter>1</Parameter>
        <Value>43183</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.11_1</Region>
        <Parameter>2</Parameter>
        <Value>11090</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.12_1</Region>
        <Parameter>1</Parameter>
        <Value>16951</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.12_1</Region>
        <Parameter>2</Parameter>
        <Value>12876</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.13_1</Region>
        <Parameter>1</Parameter>
        <Value>22210</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.7.13_1</Region>
        <Parameter>2</Parameter>
        <Value>7470</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.1_1</Region>
        <Parameter>1</Parameter>
        <Value>40594</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.1_1</Region>
        <Parameter>2</Parameter>
        <Value>12000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.2_1</Region>
        <Parameter>1</Parameter>
        <Value>14030</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.2_1</Region>
        <Parameter>2</Parameter>
        <Value>9800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.3_1</Region>
        <Parameter>1</Parameter>
        <Value>27787</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.3_1</Region>
        <Parameter>2</Parameter>
        <Value>18000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.4_1</Region>
        <Parameter>1</Parameter>
        <Value>159760</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.4_1</Region>
        <Parameter>2</Parameter>
        <Value>188</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.5_1</Region>
        <Parameter>1</Parameter>
        <Value>17477</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.5_1</Region>
        <Parameter>2</Parameter>
        <Value>10200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.6_1</Region>
        <Parameter>1</Parameter>
        <Value>21291</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.6_1</Region>
        <Parameter>2</Parameter>
        <Value>6800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.7_1</Region>
        <Parameter>1</Parameter>
        <Value>13003</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.7_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.8_1</Region>
        <Parameter>1</Parameter>
        <Value>11974</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.8_1</Region>
        <Parameter>2</Parameter>
        <Value>18100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.9_1</Region>
        <Parameter>1</Parameter>
        <Value>29222</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.9_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.10_1</Region>
        <Parameter>1</Parameter>
        <Value>21349</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.10_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.11_1</Region>
        <Parameter>1</Parameter>
        <Value>14439</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.11_1</Region>
        <Parameter>2</Parameter>
        <Value>5500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.12_1</Region>
        <Parameter>1</Parameter>
        <Value>19389</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.8.12_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.1_1</Region>
        <Parameter>1</Parameter>
        <Value>54725</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.1_1</Region>
        <Parameter>2</Parameter>
        <Value>65000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.2_1</Region>
        <Parameter>1</Parameter>
        <Value>18729</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.2_1</Region>
        <Parameter>2</Parameter>
        <Value>52000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.3_1</Region>
        <Parameter>1</Parameter>
        <Value>57577</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.3_1</Region>
        <Parameter>2</Parameter>
        <Value>14576</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.4_1</Region>
        <Parameter>1</Parameter>
        <Value>39098</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.4_1</Region>
        <Parameter>2</Parameter>
        <Value>65000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.5_1</Region>
        <Parameter>1</Parameter>
        <Value>28550</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.5_1</Region>
        <Parameter>2</Parameter>
        <Value>46326</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.6_1</Region>
        <Parameter>1</Parameter>
        <Value>34771</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.6_1</Region>
        <Parameter>2</Parameter>
        <Value>12694</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.7_1</Region>
        <Parameter>1</Parameter>
        <Value>45610</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.7_1</Region>
        <Parameter>2</Parameter>
        <Value>65694</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.8_1</Region>
        <Parameter>1</Parameter>
        <Value>12590</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.8_1</Region>
        <Parameter>2</Parameter>
        <Value>121694</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.9.9_1</Region>
        <Parameter>1</Parameter>
        <Value>28396</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.1_1</Region>
        <Parameter>1</Parameter>
        <Value>14778</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.1_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.2_1</Region>
        <Parameter>1</Parameter>
        <Value>17353</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.2_1</Region>
        <Parameter>2</Parameter>
        <Value>22000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.3_1</Region>
        <Parameter>1</Parameter>
        <Value>29662</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.3_1</Region>
        <Parameter>2</Parameter>
        <Value>15587</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.4_1</Region>
        <Parameter>1</Parameter>
        <Value>43849</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.4_1</Region>
        <Parameter>2</Parameter>
        <Value>11000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.5_1</Region>
        <Parameter>1</Parameter>
        <Value>19504</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.5_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.6_1</Region>
        <Parameter>1</Parameter>
        <Value>13457</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.6_1</Region>
        <Parameter>2</Parameter>
        <Value>37000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.7_1</Region>
        <Parameter>1</Parameter>
        <Value>26698</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.7_1</Region>
        <Parameter>2</Parameter>
        <Value>7200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.8_1</Region>
        <Parameter>1</Parameter>
        <Value>13497</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.8_1</Region>
        <Parameter>2</Parameter>
        <Value>12000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.9_1</Region>
        <Parameter>1</Parameter>
        <Value>28761</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.9_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.10_1</Region>
        <Parameter>1</Parameter>
        <Value>26827</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.10_1</Region>
        <Parameter>2</Parameter>
        <Value>12800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.11_1</Region>
        <Parameter>1</Parameter>
        <Value>29202</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.11_1</Region>
        <Parameter>2</Parameter>
        <Value>6000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.12_1</Region>
        <Parameter>1</Parameter>
        <Value>11932</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.12_1</Region>
        <Parameter>2</Parameter>
        <Value>15000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.13_1</Region>
        <Parameter>1</Parameter>
        <Value>239652</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.13_1</Region>
        <Parameter>2</Parameter>
        <Value>240</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.14_1</Region>
        <Parameter>1</Parameter>
        <Value>21591</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.14_1</Region>
        <Parameter>2</Parameter>
        <Value>6116</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.15_1</Region>
        <Parameter>1</Parameter>
        <Value>26369</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.15_1</Region>
        <Parameter>2</Parameter>
        <Value>7600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.16_1</Region>
        <Parameter>1</Parameter>
        <Value>22637</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.16_1</Region>
        <Parameter>2</Parameter>
        <Value>7157</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.17_1</Region>
        <Parameter>1</Parameter>
        <Value>49997</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.10.17_1</Region>
        <Parameter>2</Parameter>
        <Value>7311.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.1_1</Region>
        <Parameter>1</Parameter>
        <Value>77059</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.1_1</Region>
        <Parameter>2</Parameter>
        <Value>68000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.2_1</Region>
        <Parameter>1</Parameter>
        <Value>53857</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.2_1</Region>
        <Parameter>2</Parameter>
        <Value>31000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.3_1</Region>
        <Parameter>1</Parameter>
        <Value>75907</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.3_1</Region>
        <Parameter>2</Parameter>
        <Value>37000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.4_1</Region>
        <Parameter>1</Parameter>
        <Value>265466</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.4_1</Region>
        <Parameter>2</Parameter>
        <Value>240</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.5_1</Region>
        <Parameter>1</Parameter>
        <Value>80649</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.5_1</Region>
        <Parameter>2</Parameter>
        <Value>34000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.6_1</Region>
        <Parameter>1</Parameter>
        <Value>39864</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.6_1</Region>
        <Parameter>2</Parameter>
        <Value>39100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.7_1</Region>
        <Parameter>1</Parameter>
        <Value>36867</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.7_1</Region>
        <Parameter>2</Parameter>
        <Value>27100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.8_1</Region>
        <Parameter>1</Parameter>
        <Value>81329</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.11.8_1</Region>
        <Parameter>2</Parameter>
        <Value>16000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.1_1</Region>
        <Parameter>1</Parameter>
        <Value>67122</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.1_1</Region>
        <Parameter>2</Parameter>
        <Value>6300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.2_1</Region>
        <Parameter>1</Parameter>
        <Value>63000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.2_1</Region>
        <Parameter>2</Parameter>
        <Value>7200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.3_1</Region>
        <Parameter>1</Parameter>
        <Value>100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.3_1</Region>
        <Parameter>2</Parameter>
        <Value>13000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.4_1</Region>
        <Parameter>1</Parameter>
        <Value>108826</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.4_1</Region>
        <Parameter>2</Parameter>
        <Value>4100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.5_1</Region>
        <Parameter>1</Parameter>
        <Value>304294</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.5_1</Region>
        <Parameter>2</Parameter>
        <Value>180</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.6_1</Region>
        <Parameter>1</Parameter>
        <Value>144100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.6_1</Region>
        <Parameter>2</Parameter>
        <Value>2726</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.7_1</Region>
        <Parameter>1</Parameter>
        <Value>54597</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.7_1</Region>
        <Parameter>2</Parameter>
        <Value>18100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.8_1</Region>
        <Parameter>1</Parameter>
        <Value>325780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.8_1</Region>
        <Parameter>2</Parameter>
        <Value>7613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.9_1</Region>
        <Parameter>1</Parameter>
        <Value>195495</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.10_1</Region>
        <Parameter>1</Parameter>
        <Value>951605</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1170</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.11_1</Region>
        <Parameter>1</Parameter>
        <Value>61718</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.11_1</Region>
        <Parameter>2</Parameter>
        <Value>41000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.12_1</Region>
        <Parameter>1</Parameter>
        <Value>118</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.12_1</Region>
        <Parameter>2</Parameter>
        <Value>3150</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.13_1</Region>
        <Parameter>1</Parameter>
        <Value>160530</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.13_1</Region>
        <Parameter>2</Parameter>
        <Value>9400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.14_1</Region>
        <Parameter>1</Parameter>
        <Value>110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.12.14_1</Region>
        <Parameter>2</Parameter>
        <Value>2300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.1_1</Region>
        <Parameter>1</Parameter>
        <Value>44311</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.1_1</Region>
        <Parameter>2</Parameter>
        <Value>25000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.2_1</Region>
        <Parameter>1</Parameter>
        <Value>55330</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.2_1</Region>
        <Parameter>2</Parameter>
        <Value>5600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.3_1</Region>
        <Parameter>1</Parameter>
        <Value>17893</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.3_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.4_1</Region>
        <Parameter>1</Parameter>
        <Value>23883</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.4_1</Region>
        <Parameter>2</Parameter>
        <Value>20000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.5_1</Region>
        <Parameter>1</Parameter>
        <Value>16785</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.5_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.6_1</Region>
        <Parameter>1</Parameter>
        <Value>19216</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.6_1</Region>
        <Parameter>2</Parameter>
        <Value>10000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.7_1</Region>
        <Parameter>1</Parameter>
        <Value>35345</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.7_1</Region>
        <Parameter>2</Parameter>
        <Value>18000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.8_1</Region>
        <Parameter>1</Parameter>
        <Value>25036</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.8_1</Region>
        <Parameter>2</Parameter>
        <Value>11000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.9_1</Region>
        <Parameter>1</Parameter>
        <Value>18867</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.9_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.10_1</Region>
        <Parameter>1</Parameter>
        <Value>42813</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.10_1</Region>
        <Parameter>2</Parameter>
        <Value>8</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.11_1</Region>
        <Parameter>1</Parameter>
        <Value>17947</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.11_1</Region>
        <Parameter>2</Parameter>
        <Value>19</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.12_1</Region>
        <Parameter>1</Parameter>
        <Value>55186</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.13.12_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.1_1</Region>
        <Parameter>1</Parameter>
        <Value>68719</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.1_1</Region>
        <Parameter>2</Parameter>
        <Value>4000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.2_1</Region>
        <Parameter>1</Parameter>
        <Value>128358</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.2_1</Region>
        <Parameter>2</Parameter>
        <Value>8000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.3_1</Region>
        <Parameter>1</Parameter>
        <Value>61700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.3_1</Region>
        <Parameter>2</Parameter>
        <Value>10500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.4_1</Region>
        <Parameter>1</Parameter>
        <Value>74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.4_1</Region>
        <Parameter>2</Parameter>
        <Value>7000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.5_1</Region>
        <Parameter>1</Parameter>
        <Value>33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.5_1</Region>
        <Parameter>2</Parameter>
        <Value>50000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.6_1</Region>
        <Parameter>1</Parameter>
        <Value>41761</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.6_1</Region>
        <Parameter>2</Parameter>
        <Value>31</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.7_1</Region>
        <Parameter>1</Parameter>
        <Value>94452</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.7_1</Region>
        <Parameter>2</Parameter>
        <Value>12000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.8_1</Region>
        <Parameter>1</Parameter>
        <Value>51168</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.8_1</Region>
        <Parameter>2</Parameter>
        <Value>12200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.9_1</Region>
        <Parameter>1</Parameter>
        <Value>78613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.9_1</Region>
        <Parameter>2</Parameter>
        <Value>4300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.10_1</Region>
        <Parameter>1</Parameter>
        <Value>78613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.10_1</Region>
        <Parameter>2</Parameter>
        <Value>4300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.11_1</Region>
        <Parameter>1</Parameter>
        <Value>48453</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.11_1</Region>
        <Parameter>2</Parameter>
        <Value>4000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.12_1</Region>
        <Parameter>1</Parameter>
        <Value>48453</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>KAZ.14.12_1</Region>
        <Parameter>2</Parameter>
        <Value>4000</Value>
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
