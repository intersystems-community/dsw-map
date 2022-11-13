Class UA.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("UACube")
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("UA.Area", "%KillExtent")
	do ..ImportXData("UA.Region", "RegionXData")
	do ..ImportXData("UA.Parameter", "ParameterXData")
	do ..ImportXData("UA.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("UA.Utils"_"||"_xDataName).Data
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
        <Name>Черкаська область</Name>
        <Guid>UKR.1_1</Guid>
        <DataUrl>Черкаська область</DataUrl>
    </Region>
    <Region>
        <Name>Чернігівська область</Name>
        <Guid>UKR.2_1</Guid>
        <DataUrl>Чернігівська область</DataUrl>
    </Region>
    <Region>
        <Name>Чернівецька область</Name>
        <Guid>UKR.3_1</Guid>
        <DataUrl>Чернівецька область</DataUrl>
    </Region>
    <Region>
        <Name>Автономна Республіка Крим</Name>
        <Guid>UKR.4_1</Guid>
        <DataUrl>Автономна Республіка Крим</DataUrl>
    </Region>
    <Region>
        <Name>Дніпропетровська область</Name>
        <Guid>UKR.5_1</Guid>
        <DataUrl>Дніпропетровська область</DataUrl>
    </Region>
    <Region>
        <Name>Донецька область</Name>
        <Guid>UKR.6_1</Guid>
        <DataUrl>Донецька область</DataUrl>
    </Region>
    <Region>
        <Name>Івано-Франківська область</Name>
        <Guid>UKR.7_1</Guid>
        <DataUrl>Івано-Франківська область</DataUrl>
    </Region>
    <Region>
        <Name>Харківська область</Name>
        <Guid>UKR.8_1</Guid>
        <DataUrl>Харківська область</DataUrl>
    </Region>
    <Region>
        <Name>Херсонська область</Name>
        <Guid>UKR.9_1</Guid>
        <DataUrl>Херсонська область</DataUrl>
    </Region>
    <Region>
        <Name>Хмельницька область</Name>
        <Guid>UKR.10_1</Guid>
        <DataUrl>Хмельницька область</DataUrl>
    </Region>
    <Region>
        <Name>Київська область</Name>
        <Guid>UKR.12_1</Guid>
        <DataUrl>Київська область</DataUrl>
    </Region>
    <Region>
        <Name>Київ</Name>
        <Guid>UKR.11_1</Guid>
        <DataUrl>Київ</DataUrl>
    </Region>
    <Region>
        <Name>Кіровоградська область</Name>
        <Guid>UKR.13_1</Guid>
        <DataUrl>Кіровоградська область</DataUrl>
    </Region>
    <Region>
        <Name>Львівська область</Name>
        <Guid>UKR.14_1</Guid>
        <DataUrl>Львівська область</DataUrl>
    </Region>
    <Region>
        <Name>Луганська область</Name>
        <Guid>UKR.15_1</Guid>
        <DataUrl>Луганська область</DataUrl>
    </Region>
    <Region>
        <Name>Миколаївська область</Name>
        <Guid>UKR.16_1</Guid>
        <DataUrl>Миколаївська область</DataUrl>
    </Region>
    <Region>
        <Name>Одеська область</Name>
        <Guid>UKR.17_1</Guid>
        <DataUrl>Одеська область</DataUrl>
    </Region>
    <Region>
        <Name>Полтавська область</Name>
        <Guid>UKR.18_1</Guid>
        <DataUrl>Полтавська область</DataUrl>
    </Region>
    <Region>
        <Name>Рівненська область</Name>
        <Guid>UKR.19_1</Guid>
        <DataUrl>Рівненська область</DataUrl>
    </Region>
    <Region>
        <Name>Севастополь</Name>
        <Guid>UKR.20_1</Guid>
        <DataUrl>Севастополь</DataUrl>
    </Region>
    <Region>
        <Name>Сумська область</Name>
        <Guid>UKR.21_1</Guid>
        <DataUrl>Сумська область</DataUrl>
    </Region>
    <Region>
        <Name>Тернопільська область</Name>
        <Guid>UKR.22_1</Guid>
        <DataUrl>Тернопільська область</DataUrl>
    </Region>
    <Region>
        <Name>Закарпатська область</Name>
        <Guid>UKR.23_1</Guid>
        <DataUrl>Закарпатська область</DataUrl>
    </Region>
    <Region>
        <Name>Вінницька область</Name>
        <Guid>UKR.24_1</Guid>
        <DataUrl>Вінницька область</DataUrl>
    </Region>
    <Region>
        <Name>Волинська область</Name>
        <Guid>UKR.25_1</Guid>
        <DataUrl>Волинська область</DataUrl>
    </Region>
    <Region>
        <Name>Запорізька область</Name>
        <Guid>UKR.26_1</Guid>
        <DataUrl>Запорізька область</DataUrl>
    </Region>
    <Region>
        <Name>Житомирська область</Name>
        <Guid>UKR.27_1</Guid>
        <DataUrl>Житомирська область</DataUrl>
    </Region>
    <Region>
        <Name>undefined</Name>
        <Guid>undefined</Guid>
        <DataUrl>undefined</DataUrl>
    </Region>
    <Region>
        <Name>Черкаська міська рада</Name>
        <Guid>UKR.1.1_1</Guid>
        <DataUrl>Черкаська міська рада</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Черкаський район</Name>
        <Guid>UKR.1.2_1</Guid>
        <DataUrl>Черкаський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чорнобаївський район</Name>
        <Guid>UKR.1.3_1</Guid>
        <DataUrl>Чорнобаївський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чигиринський район</Name>
        <Guid>UKR.1.4_1</Guid>
        <DataUrl>Чигиринський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Драбівський район</Name>
        <Guid>UKR.1.5_1</Guid>
        <DataUrl>Драбівський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Городищенський район</Name>
        <Guid>UKR.1.6_1</Guid>
        <DataUrl>Городищенський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янський район (Черкаська область)</Name>
        <Guid>UKR.1.7_1</Guid>
        <DataUrl>Кам'янський район (Черкаська область)</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Канів</Name>
        <Guid>UKR.1.8_1</Guid>
        <DataUrl>Канів</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Канівський район</Name>
        <Guid>UKR.1.9_1</Guid>
        <DataUrl>Канівський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Катеринопільський район</Name>
        <Guid>UKR.1.10_1</Guid>
        <DataUrl>Катеринопільський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Христинівський район</Name>
        <Guid>UKR.1.11_1</Guid>
        <DataUrl>Христинівський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Корсунь-Шевченківський район</Name>
        <Guid>UKR.1.12_1</Guid>
        <DataUrl>Корсунь-Шевченківський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лисянський район</Name>
        <Guid>UKR.1.13_1</Guid>
        <DataUrl>Лисянський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Маньківський район</Name>
        <Guid>UKR.1.14_1</Guid>
        <DataUrl>Маньківський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Монастирищенський район</Name>
        <Guid>UKR.1.15_1</Guid>
        <DataUrl>Монастирищенський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шполянський район</Name>
        <Guid>UKR.1.16_1</Guid>
        <DataUrl>Шполянський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Смілянський райо́н</Name>
        <Guid>UKR.1.17_1</Guid>
        <DataUrl>Смілянський райо́н</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тальнівський район</Name>
        <Guid>UKR.1.18_1</Guid>
        <DataUrl>Тальнівський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Умань</Name>
        <Guid>UKR.1.19_1</Guid>
        <DataUrl>Умань</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Уманський район</Name>
        <Guid>UKR.1.20_1</Guid>
        <DataUrl>Уманський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жашківський район</Name>
        <Guid>UKR.1.21_1</Guid>
        <DataUrl>Жашківський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Золотоніський район</Name>
        <Guid>UKR.1.22_1</Guid>
        <DataUrl>Золотоніський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Звенигородський район</Name>
        <Guid>UKR.1.23_1</Guid>
        <DataUrl>Звенигородський район</DataUrl>
        <ParentRegion>UKR.1_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бахмацький район</Name>
        <Guid>UKR.2.1_1</Guid>
        <DataUrl>Бахмацький район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бобровицький район</Name>
        <Guid>UKR.2.2_1</Guid>
        <DataUrl>Бобровицький район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Борзнянський район</Name>
        <Guid>UKR.2.3_1</Guid>
        <DataUrl>Борзнянський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чернігів</Name>
        <Guid>UKR.2.4_1</Guid>
        <DataUrl>Чернігів</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чернігівський район (Чернігівська область)</Name>
        <Guid>UKR.2.5_1</Guid>
        <DataUrl>Чернігівський район (Чернігівська область)</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Городнянський район</Name>
        <Guid>UKR.2.6_1</Guid>
        <DataUrl>Городнянський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ічнянський район</Name>
        <Guid>UKR.2.7_1</Guid>
        <DataUrl>Ічнянський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Корюківський район</Name>
        <Guid>UKR.2.8_1</Guid>
        <DataUrl>Корюківський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коропський район</Name>
        <Guid>UKR.2.9_1</Guid>
        <DataUrl>Коропський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Козелецький район</Name>
        <Guid>UKR.2.10_1</Guid>
        <DataUrl>Козелецький район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Куликівський район</Name>
        <Guid>UKR.2.11_1</Guid>
        <DataUrl>Куликівський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Менський район</Name>
        <Guid>UKR.2.12_1</Guid>
        <DataUrl>Менський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ніжин</Name>
        <Guid>UKR.2.13_1</Guid>
        <DataUrl>Ніжин</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ніжинський район</Name>
        <Guid>UKR.2.14_1</Guid>
        <DataUrl>Ніжинський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Носівський район</Name>
        <Guid>UKR.2.15_1</Guid>
        <DataUrl>Носівський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новгород-Сіверський район</Name>
        <Guid>UKR.2.16_1</Guid>
        <DataUrl>Новгород-Сіверський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Прилуки</Name>
        <Guid>UKR.2.17_1</Guid>
        <DataUrl>Прилуки</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Прилуцький район</Name>
        <Guid>UKR.2.18_1</Guid>
        <DataUrl>Прилуцький район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ріпкинський район</Name>
        <Guid>UKR.2.19_1</Guid>
        <DataUrl>Ріпкинський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Семенівський район (Чернігівська область)</Name>
        <Guid>UKR.2.20_1</Guid>
        <DataUrl>Семенівський район (Чернігівська область)</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сновський район</Name>
        <Guid>UKR.2.21_1</Guid>
        <DataUrl>Сновський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сосницький район</Name>
        <Guid>UKR.2.22_1</Guid>
        <DataUrl>Сосницький район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Срібнянський район</Name>
        <Guid>UKR.2.23_1</Guid>
        <DataUrl>Срібнянський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Талалаївський район</Name>
        <Guid>UKR.2.24_1</Guid>
        <DataUrl>Талалаївський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Варвинський район</Name>
        <Guid>UKR.2.25_1</Guid>
        <DataUrl>Варвинський район</DataUrl>
        <ParentRegion>UKR.2_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чернівці</Name>
        <Guid>UKR.3.1_1</Guid>
        <DataUrl>Чернівці</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Глибоцький район</Name>
        <Guid>UKR.3.2_1</Guid>
        <DataUrl>Глибоцький район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кельменецький район</Name>
        <Guid>UKR.3.3_1</Guid>
        <DataUrl>Кельменецький район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хотинський район</Name>
        <Guid>UKR.3.4_1</Guid>
        <DataUrl>Хотинський район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кіцманський район</Name>
        <Guid>UKR.3.5_1</Guid>
        <DataUrl>Кіцманський район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоселицький район</Name>
        <Guid>UKR.3.6_1</Guid>
        <DataUrl>Новоселицький район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Путильський район</Name>
        <Guid>UKR.3.7_1</Guid>
        <DataUrl>Путильський район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сокирянський район</Name>
        <Guid>UKR.3.8_1</Guid>
        <DataUrl>Сокирянський район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сторожинецький район</Name>
        <Guid>UKR.3.9_1</Guid>
        <DataUrl>Сторожинецький район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вижницький район</Name>
        <Guid>UKR.3.10_1</Guid>
        <DataUrl>Вижницький район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Заставнівський район</Name>
        <Guid>UKR.3.11_1</Guid>
        <DataUrl>Заставнівський район</DataUrl>
        <ParentRegion>UKR.3_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алуштинська міська рада</Name>
        <Guid>UKR.4.1_1</Guid>
        <DataUrl>Алуштинська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бахчисарайський район</Name>
        <Guid>UKR.4.2_1</Guid>
        <DataUrl>Бахчисарайський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білогірський район (Крим)</Name>
        <Guid>UKR.4.3_1</Guid>
        <DataUrl>Білогірський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чорноморський район</Name>
        <Guid>UKR.4.4_1</Guid>
        <DataUrl>Чорноморський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Джанкойська міська рада</Name>
        <Guid>UKR.4.5_1</Guid>
        <DataUrl>Джанкойська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Джанкойський район</Name>
        <Guid>UKR.4.6_1</Guid>
        <DataUrl>Джанкойський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Феодосійська міська рада</Name>
        <Guid>UKR.4.7_1</Guid>
        <DataUrl>Феодосійська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ялтинська міська рада</Name>
        <Guid>UKR.4.8_1</Guid>
        <DataUrl>Ялтинська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Євпаторійська міська рада</Name>
        <Guid>UKR.4.9_1</Guid>
        <DataUrl>Євпаторійська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Керченська міська рада</Name>
        <Guid>UKR.4.10_1</Guid>
        <DataUrl>Керченська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кіровський район (Крим)</Name>
        <Guid>UKR.4.11_1</Guid>
        <DataUrl>Кіровський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Красногвардійський район (Крим)</Name>
        <Guid>UKR.4.12_1</Guid>
        <DataUrl>Красногвардійський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Красноперекопський район</Name>
        <Guid>UKR.4.13_1</Guid>
        <DataUrl>Красноперекопський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ленінський район (Крим)</Name>
        <Guid>UKR.4.14_1</Guid>
        <DataUrl>Ленінський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нижньогірський район</Name>
        <Guid>UKR.4.15_1</Guid>
        <DataUrl>Нижньогірський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Первомайський район (Крим)</Name>
        <Guid>UKR.4.16_1</Guid>
        <DataUrl>Первомайський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Роздольненський район</Name>
        <Guid>UKR.4.17_1</Guid>
        <DataUrl>Роздольненський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Саки (місто)</Name>
        <Guid>UKR.4.18_1</Guid>
        <DataUrl>Саки (місто)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сакський район</Name>
        <Guid>UKR.4.19_1</Guid>
        <DataUrl>Сакський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сімферопольська міська рада</Name>
        <Guid>UKR.4.20_1</Guid>
        <DataUrl>Сімферопольська міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сімферопольський район</Name>
        <Guid>UKR.4.21_1</Guid>
        <DataUrl>Сімферопольський район</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Совєтський район (Крим)</Name>
        <Guid>UKR.4.22_1</Guid>
        <DataUrl>Совєтський район (Крим)</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Судацька міська рада</Name>
        <Guid>UKR.4.23_1</Guid>
        <DataUrl>Судацька міська рада</DataUrl>
        <ParentRegion>UKR.4_1</ParentRegion>
    </Region>
    <Region>
        <Name>Апостолівський район</Name>
        <Guid>UKR.5.1_1</Guid>
        <DataUrl>Апостолівський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янське</Name>
        <Guid>UKR.5.2_1</Guid>
        <DataUrl>Кам'янське</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дніпро (місто)</Name>
        <Guid>UKR.5.3_1</Guid>
        <DataUrl>Дніпро (місто)</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дніпровський район (Дніпропетровська область)</Name>
        <Guid>UKR.5.4_1</Guid>
        <DataUrl>Дніпровський район (Дніпропетровська область)</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Юр'ївський район</Name>
        <Guid>UKR.5.5_1</Guid>
        <DataUrl>Юр'ївський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Криничанський район</Name>
        <Guid>UKR.5.6_1</Guid>
        <DataUrl>Криничанський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Криворізький район</Name>
        <Guid>UKR.5.7_1</Guid>
        <DataUrl>Криворізький район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кривий Ріг</Name>
        <Guid>UKR.5.8_1</Guid>
        <DataUrl>Кривий Ріг</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Магдалинівський район</Name>
        <Guid>UKR.5.9_1</Guid>
        <DataUrl>Магдалинівський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Марганець (місто)</Name>
        <Guid>UKR.5.10_1</Guid>
        <DataUrl>Марганець (місто)</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Межівський район</Name>
        <Guid>UKR.5.11_1</Guid>
        <DataUrl>Межівський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нікополь</Name>
        <Guid>UKR.5.12_1</Guid>
        <DataUrl>Нікополь</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нікопольський район</Name>
        <Guid>UKR.5.13_1</Guid>
        <DataUrl>Нікопольський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новомосковськ</Name>
        <Guid>UKR.5.14_1</Guid>
        <DataUrl>Новомосковськ</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новомосковський район</Name>
        <Guid>UKR.5.15_1</Guid>
        <DataUrl>Новомосковський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Покров</Name>
        <Guid>UKR.5.16_1</Guid>
        <DataUrl>Покров</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Павлоград</Name>
        <Guid>UKR.5.17_1</Guid>
        <DataUrl>Павлоград</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Павлоградський район</Name>
        <Guid>UKR.5.18_1</Guid>
        <DataUrl>Павлоградський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Петропавлівський район</Name>
        <Guid>UKR.5.19_1</Guid>
        <DataUrl>Петропавлівський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Петриківський район</Name>
        <Guid>UKR.5.20_1</Guid>
        <DataUrl>Петриківський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>П'ятихатський район</Name>
        <Guid>UKR.5.21_1</Guid>
        <DataUrl>П'ятихатський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Покровський район (Дніпропетровська область)</Name>
        <Guid>UKR.5.22_1</Guid>
        <DataUrl>Покровський район (Дніпропетровська область)</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Широківський район</Name>
        <Guid>UKR.5.23_1</Guid>
        <DataUrl>Широківський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Софіївський район</Name>
        <Guid>UKR.5.24_1</Guid>
        <DataUrl>Софіївський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Солонянський район</Name>
        <Guid>UKR.5.25_1</Guid>
        <DataUrl>Солонянський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Синельникове</Name>
        <Guid>UKR.5.26_1</Guid>
        <DataUrl>Синельникове</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Синельниківський район</Name>
        <Guid>UKR.5.27_1</Guid>
        <DataUrl>Синельниківський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Томаківський район</Name>
        <Guid>UKR.5.28_1</Guid>
        <DataUrl>Томаківський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Царичанський район</Name>
        <Guid>UKR.5.29_1</Guid>
        <DataUrl>Царичанський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Васильківський район (Дніпропетровська область)</Name>
        <Guid>UKR.5.30_1</Guid>
        <DataUrl>Васильківський район (Дніпропетровська область)</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Верхньодніпровський район</Name>
        <Guid>UKR.5.31_1</Guid>
        <DataUrl>Верхньодніпровський район</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жовті Води</Name>
        <Guid>UKR.5.32_1</Guid>
        <DataUrl>Жовті Води</DataUrl>
        <ParentRegion>UKR.5_1</ParentRegion>
    </Region>
    <Region>
        <Name>Амвросіївський район</Name>
        <Guid>UKR.6.1_1</Guid>
        <DataUrl>Амвросіївський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бахмут</Name>
        <Guid>UKR.6.2_1</Guid>
        <DataUrl>Бахмут</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бахмутський район</Name>
        <Guid>UKR.6.3_1</Guid>
        <DataUrl>Бахмутський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Добропілля</Name>
        <Guid>UKR.6.4_1</Guid>
        <DataUrl>Добропілля</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Добропільський район</Name>
        <Guid>UKR.6.5_1</Guid>
        <DataUrl>Добропільський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Донецьк</Name>
        <Guid>UKR.6.6_1</Guid>
        <DataUrl>Донецьк</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Торецьк</Name>
        <Guid>UKR.6.7_1</Guid>
        <DataUrl>Торецьк</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Горлівка</Name>
        <Guid>UKR.6.8_1</Guid>
        <DataUrl>Горлівка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ясинувата</Name>
        <Guid>UKR.6.9_1</Guid>
        <DataUrl>Ясинувата</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ясинуватський район</Name>
        <Guid>UKR.6.10_1</Guid>
        <DataUrl>Ясинуватський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Єнакієве</Name>
        <Guid>UKR.6.11_1</Guid>
        <DataUrl>Єнакієве</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Харцизьк</Name>
        <Guid>UKR.6.12_1</Guid>
        <DataUrl>Харцизьк</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хрестівка</Name>
        <Guid>UKR.6.13_1</Guid>
        <DataUrl>Хрестівка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Костянтинівка</Name>
        <Guid>UKR.6.14_1</Guid>
        <DataUrl>Костянтинівка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Костянтинівський район</Name>
        <Guid>UKR.6.15_1</Guid>
        <DataUrl>Костянтинівський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Краматорськ</Name>
        <Guid>UKR.6.16_1</Guid>
        <DataUrl>Краматорськ</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Покровськ</Name>
        <Guid>UKR.6.17_1</Guid>
        <DataUrl>Покровськ</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Покровський район (Донецька область)</Name>
        <Guid>UKR.6.18_1</Guid>
        <DataUrl>Покровський район (Донецька область)</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лиман (місто)</Name>
        <Guid>UKR.6.19_1</Guid>
        <DataUrl>Лиман (місто)</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лиманський район (Донецька область)</Name>
        <Guid>UKR.6.20_1</Guid>
        <DataUrl>Лиманський район (Донецька область)</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Макіївка</Name>
        <Guid>UKR.6.21_1</Guid>
        <DataUrl>Макіївка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мар'їнський район</Name>
        <Guid>UKR.6.22_1</Guid>
        <DataUrl>Мар'їнський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Маріуполь</Name>
        <Guid>UKR.6.23_1</Guid>
        <DataUrl>Маріуполь</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 181) </Name>
        <Guid>UKR.6.24_1</Guid>
        <DataUrl>n.a. ( 181) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 319) </Name>
        <Guid>UKR.6.25_1</Guid>
        <DataUrl>n.a. ( 319) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 384) </Name>
        <Guid>UKR.6.26_1</Guid>
        <DataUrl>n.a. ( 384) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 394) </Name>
        <Guid>UKR.6.27_1</Guid>
        <DataUrl>n.a. ( 394) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 488) </Name>
        <Guid>UKR.6.28_1</Guid>
        <DataUrl>n.a. ( 488) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 493) </Name>
        <Guid>UKR.6.29_1</Guid>
        <DataUrl>n.a. ( 493) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 511) </Name>
        <Guid>UKR.6.30_1</Guid>
        <DataUrl>n.a. ( 511) </DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоазовський район</Name>
        <Guid>UKR.6.31_1</Guid>
        <DataUrl>Новоазовський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новогродівка</Name>
        <Guid>UKR.6.32_1</Guid>
        <DataUrl>Новогродівка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Олександрівський район (Донецька область)</Name>
        <Guid>UKR.6.33_1</Guid>
        <DataUrl>Олександрівський район (Донецька область)</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мангушський район</Name>
        <Guid>UKR.6.34_1</Guid>
        <DataUrl>Мангушський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Селидове</Name>
        <Guid>UKR.6.35_1</Guid>
        <DataUrl>Селидове</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шахтарськ</Name>
        <Guid>UKR.6.36_1</Guid>
        <DataUrl>Шахтарськ</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шахтарський район</Name>
        <Guid>UKR.6.37_1</Guid>
        <DataUrl>Шахтарський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Слов'янськ</Name>
        <Guid>UKR.6.38_1</Guid>
        <DataUrl>Слов'янськ</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Слов'янський район</Name>
        <Guid>UKR.6.39_1</Guid>
        <DataUrl>Слов'янський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сніжне</Name>
        <Guid>UKR.6.40_1</Guid>
        <DataUrl>Сніжне</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старобешівський район</Name>
        <Guid>UKR.6.41_1</Guid>
        <DataUrl>Старобешівський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бойківський район</Name>
        <Guid>UKR.6.42_1</Guid>
        <DataUrl>Бойківський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чистякове</Name>
        <Guid>UKR.6.43_1</Guid>
        <DataUrl>Чистякове</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великоновосілківський район</Name>
        <Guid>UKR.6.44_1</Guid>
        <DataUrl>Великоновосілківський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Волноваський район</Name>
        <Guid>UKR.6.45_1</Guid>
        <DataUrl>Волноваський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нікольський район</Name>
        <Guid>UKR.6.46_1</Guid>
        <DataUrl>Нікольський район</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вугледар</Name>
        <Guid>UKR.6.47_1</Guid>
        <DataUrl>Вугледар</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жданівка</Name>
        <Guid>UKR.6.48_1</Guid>
        <DataUrl>Жданівка</DataUrl>
        <ParentRegion>UKR.6_1</ParentRegion>
    </Region>
    <Region>
        <Name>Богородчанський район</Name>
        <Guid>UKR.7.1_1</Guid>
        <DataUrl>Богородчанський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Долинський район (Івано-Франківська область)</Name>
        <Guid>UKR.7.2_1</Guid>
        <DataUrl>Долинський район (Івано-Франківська область)</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Галицький район</Name>
        <Guid>UKR.7.3_1</Guid>
        <DataUrl>Галицький район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Городенківський район</Name>
        <Guid>UKR.7.4_1</Guid>
        <DataUrl>Городенківський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Яремче</Name>
        <Guid>UKR.7.5_1</Guid>
        <DataUrl>Яремче</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Івано-Франківськ</Name>
        <Guid>UKR.7.6_1</Guid>
        <DataUrl>Івано-Франківськ</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Калуський район</Name>
        <Guid>UKR.7.7_1</Guid>
        <DataUrl>Калуський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коломийський район</Name>
        <Guid>UKR.7.8_1</Guid>
        <DataUrl>Коломийський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Косівський район</Name>
        <Guid>UKR.7.9_1</Guid>
        <DataUrl>Косівський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Надвірнянський район</Name>
        <Guid>UKR.7.10_1</Guid>
        <DataUrl>Надвірнянський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рогатинський район</Name>
        <Guid>UKR.7.11_1</Guid>
        <DataUrl>Рогатинський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рожнятівський район</Name>
        <Guid>UKR.7.12_1</Guid>
        <DataUrl>Рожнятівський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Снятинський район</Name>
        <Guid>UKR.7.13_1</Guid>
        <DataUrl>Снятинський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тлумацький район</Name>
        <Guid>UKR.7.14_1</Guid>
        <DataUrl>Тлумацький район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тисменицький район</Name>
        <Guid>UKR.7.15_1</Guid>
        <DataUrl>Тисменицький район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Верховинський район</Name>
        <Guid>UKR.7.16_1</Guid>
        <DataUrl>Верховинський район</DataUrl>
        <ParentRegion>UKR.7_1</ParentRegion>
    </Region>
    <Region>
        <Name>Балаклійський район</Name>
        <Guid>UKR.8.1_1</Guid>
        <DataUrl>Балаклійський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Барвінківський район</Name>
        <Guid>UKR.8.2_1</Guid>
        <DataUrl>Барвінківський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Близнюківський район</Name>
        <Guid>UKR.8.3_1</Guid>
        <DataUrl>Близнюківський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Богодухівський район</Name>
        <Guid>UKR.8.4_1</Guid>
        <DataUrl>Богодухівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Борівський район</Name>
        <Guid>UKR.8.5_1</Guid>
        <DataUrl>Борівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чугуїв</Name>
        <Guid>UKR.8.6_1</Guid>
        <DataUrl>Чугуїв</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чугуївський район</Name>
        <Guid>UKR.8.7_1</Guid>
        <DataUrl>Чугуївський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дергачівський район</Name>
        <Guid>UKR.8.8_1</Guid>
        <DataUrl>Дергачівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дворічанський район</Name>
        <Guid>UKR.8.9_1</Guid>
        <DataUrl>Дворічанський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ізюм</Name>
        <Guid>UKR.8.10_1</Guid>
        <DataUrl>Ізюм</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ізюмський район</Name>
        <Guid>UKR.8.11_1</Guid>
        <DataUrl>Ізюмський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кегичівський район</Name>
        <Guid>UKR.8.12_1</Guid>
        <DataUrl>Кегичівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Харків</Name>
        <Guid>UKR.8.13_1</Guid>
        <DataUrl>Харків</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Харківський район</Name>
        <Guid>UKR.8.14_1</Guid>
        <DataUrl>Харківський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Красноградський район</Name>
        <Guid>UKR.8.15_1</Guid>
        <DataUrl>Красноградський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Краснокутський район</Name>
        <Guid>UKR.8.16_1</Guid>
        <DataUrl>Краснокутський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Куп'янськ</Name>
        <Guid>UKR.8.17_1</Guid>
        <DataUrl>Куп'янськ</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Куп'янський район</Name>
        <Guid>UKR.8.18_1</Guid>
        <DataUrl>Куп'янський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лозова (місто)</Name>
        <Guid>UKR.8.19_1</Guid>
        <DataUrl>Лозова (місто)</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лозівський район</Name>
        <Guid>UKR.8.20_1</Guid>
        <DataUrl>Лозівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 180) </Name>
        <Guid>UKR.8.21_1</Guid>
        <DataUrl>n.a. ( 180) </DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нововодолазький район</Name>
        <Guid>UKR.8.22_1</Guid>
        <DataUrl>Нововодолазький район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Печенізький район</Name>
        <Guid>UKR.8.23_1</Guid>
        <DataUrl>Печенізький район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Первомайський район (Харківська область)</Name>
        <Guid>UKR.8.24_1</Guid>
        <DataUrl>Первомайський район (Харківська область)</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сахновщинський район</Name>
        <Guid>UKR.8.25_1</Guid>
        <DataUrl>Сахновщинський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шевченківський район (Харківська область)</Name>
        <Guid>UKR.8.26_1</Guid>
        <DataUrl>Шевченківський район (Харківська область)</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Валківський район</Name>
        <Guid>UKR.8.27_1</Guid>
        <DataUrl>Валківський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великобурлуцький район</Name>
        <Guid>UKR.8.28_1</Guid>
        <DataUrl>Великобурлуцький район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вовчанський район</Name>
        <Guid>UKR.8.29_1</Guid>
        <DataUrl>Вовчанський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зачепилівський район</Name>
        <Guid>UKR.8.30_1</Guid>
        <DataUrl>Зачепилівський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зміївський район</Name>
        <Guid>UKR.8.31_1</Guid>
        <DataUrl>Зміївський район</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Золочівський район (Харківська область)</Name>
        <Guid>UKR.8.32_1</Guid>
        <DataUrl>Золочівський район (Харківська область)</DataUrl>
        <ParentRegion>UKR.8_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бериславський район</Name>
        <Guid>UKR.9.1_1</Guid>
        <DataUrl>Бериславський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білозерський район</Name>
        <Guid>UKR.9.2_1</Guid>
        <DataUrl>Білозерський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чаплинський район</Name>
        <Guid>UKR.9.3_1</Guid>
        <DataUrl>Чаплинський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Генічеський район</Name>
        <Guid>UKR.9.4_1</Guid>
        <DataUrl>Генічеський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Голопристанський район</Name>
        <Guid>UKR.9.5_1</Guid>
        <DataUrl>Голопристанський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Горностаївський район</Name>
        <Guid>UKR.9.6_1</Guid>
        <DataUrl>Горностаївський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іванівський район (Херсонська область)</Name>
        <Guid>UKR.9.7_1</Guid>
        <DataUrl>Іванівський район (Херсонська область)</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каховський район</Name>
        <Guid>UKR.9.8_1</Guid>
        <DataUrl>Каховський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Каланчацький район</Name>
        <Guid>UKR.9.9_1</Guid>
        <DataUrl>Каланчацький район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Херсон</Name>
        <Guid>UKR.9.10_1</Guid>
        <DataUrl>Херсон</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нова Каховка</Name>
        <Guid>UKR.9.11_1</Guid>
        <DataUrl>Нова Каховка</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новотроїцький район</Name>
        <Guid>UKR.9.12_1</Guid>
        <DataUrl>Новотроїцький район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нововоронцовський район</Name>
        <Guid>UKR.9.13_1</Guid>
        <DataUrl>Нововоронцовський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нижньосірогозький район</Name>
        <Guid>UKR.9.14_1</Guid>
        <DataUrl>Нижньосірогозький район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Скадовський район</Name>
        <Guid>UKR.9.15_1</Guid>
        <DataUrl>Скадовський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Олешківський район</Name>
        <Guid>UKR.9.16_1</Guid>
        <DataUrl>Олешківський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великолепетиський район</Name>
        <Guid>UKR.9.17_1</Guid>
        <DataUrl>Великолепетиський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великоолександрівський район</Name>
        <Guid>UKR.9.18_1</Guid>
        <DataUrl>Великоолександрівський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Верхньорогачицький район</Name>
        <Guid>UKR.9.19_1</Guid>
        <DataUrl>Верхньорогачицький район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Високопільський район</Name>
        <Guid>UKR.9.20_1</Guid>
        <DataUrl>Високопільський район</DataUrl>
        <ParentRegion>UKR.9_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білогірський район (Хмельницька область)</Name>
        <Guid>UKR.10.1_1</Guid>
        <DataUrl>Білогірський район (Хмельницька область)</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чемеровецький район</Name>
        <Guid>UKR.10.2_1</Guid>
        <DataUrl>Чемеровецький район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Деражнянський район</Name>
        <Guid>UKR.10.3_1</Guid>
        <DataUrl>Деражнянський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дунаєвецький район</Name>
        <Guid>UKR.10.4_1</Guid>
        <DataUrl>Дунаєвецький район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Городоцький район (Хмельницька область)</Name>
        <Guid>UKR.10.5_1</Guid>
        <DataUrl>Городоцький район (Хмельницька область)</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ярмолинецкий район</Name>
        <Guid>UKR.10.6_1</Guid>
        <DataUrl>Ярмолинецкий район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ізяславський район</Name>
        <Guid>UKR.10.7_1</Guid>
        <DataUrl>Ізяславський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янець-Подільський</Name>
        <Guid>UKR.10.8_1</Guid>
        <DataUrl>Кам'янець-Подільський</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янець-Подільський район</Name>
        <Guid>UKR.10.9_1</Guid>
        <DataUrl>Кам'янець-Подільський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хмельницький</Name>
        <Guid>UKR.10.10_1</Guid>
        <DataUrl>Хмельницький</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хмельницький район</Name>
        <Guid>UKR.10.11_1</Guid>
        <DataUrl>Хмельницький район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Красилівський район</Name>
        <Guid>UKR.10.12_1</Guid>
        <DataUrl>Красилівський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Летичівський район</Name>
        <Guid>UKR.10.13_1</Guid>
        <DataUrl>Летичівський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоушицький район</Name>
        <Guid>UKR.10.14_1</Guid>
        <DataUrl>Новоушицький район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Полонський район</Name>
        <Guid>UKR.10.15_1</Guid>
        <DataUrl>Полонський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шепетівка</Name>
        <Guid>UKR.10.16_1</Guid>
        <DataUrl>Шепетівка</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шепетівський район</Name>
        <Guid>UKR.10.17_1</Guid>
        <DataUrl>Шепетівський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Славутський район</Name>
        <Guid>UKR.10.18_1</Guid>
        <DataUrl>Славутський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старокостянтинівський район</Name>
        <Guid>UKR.10.19_1</Guid>
        <DataUrl>Старокостянтинівський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старосинявський район</Name>
        <Guid>UKR.10.20_1</Guid>
        <DataUrl>Старосинявський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Теофіпольський район</Name>
        <Guid>UKR.10.21_1</Guid>
        <DataUrl>Теофіпольський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Віньковецький район</Name>
        <Guid>UKR.10.22_1</Guid>
        <DataUrl>Віньковецький район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Волочиський район</Name>
        <Guid>UKR.10.23_1</Guid>
        <DataUrl>Волочиський район</DataUrl>
        <ParentRegion>UKR.10_1</ParentRegion>
    </Region>
    <Region>
        <Name>Баришівський район</Name>
        <Guid>UKR.12.1_1</Guid>
        <DataUrl>Баришівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Біла Церква</Name>
        <Guid>UKR.12.2_1</Guid>
        <DataUrl>Біла Церква</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білоцерківський район</Name>
        <Guid>UKR.12.3_1</Guid>
        <DataUrl>Білоцерківський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Богуславський район</Name>
        <Guid>UKR.12.4_1</Guid>
        <DataUrl>Богуславський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бородянський район</Name>
        <Guid>UKR.12.5_1</Guid>
        <DataUrl>Бородянський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бориспіль</Name>
        <Guid>UKR.12.6_1</Guid>
        <DataUrl>Бориспіль</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бровари</Name>
        <Guid>UKR.12.7_1</Guid>
        <DataUrl>Бровари</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Броварський район</Name>
        <Guid>UKR.12.8_1</Guid>
        <DataUrl>Броварський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Фастів</Name>
        <Guid>UKR.12.9_1</Guid>
        <DataUrl>Фастів</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Фастівський район</Name>
        <Guid>UKR.12.10_1</Guid>
        <DataUrl>Фастівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Яготинський район</Name>
        <Guid>UKR.12.11_1</Guid>
        <DataUrl>Яготинський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ірпінь</Name>
        <Guid>UKR.12.12_1</Guid>
        <DataUrl>Ірпінь</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іванківський район</Name>
        <Guid>UKR.12.13_1</Guid>
        <DataUrl>Іванківський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кагарлицький район</Name>
        <Guid>UKR.12.14_1</Guid>
        <DataUrl>Кагарлицький район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Києво-Святошинський район</Name>
        <Guid>UKR.12.15_1</Guid>
        <DataUrl>Києво-Святошинський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Макарівський район</Name>
        <Guid>UKR.12.16_1</Guid>
        <DataUrl>Макарівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миронівський район</Name>
        <Guid>UKR.12.17_1</Guid>
        <DataUrl>Миронівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Обухівський район</Name>
        <Guid>UKR.12.18_1</Guid>
        <DataUrl>Обухівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Переяслав-Хмельницький</Name>
        <Guid>UKR.12.19_1</Guid>
        <DataUrl>Переяслав-Хмельницький</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Переяслав-Хмельницький район</Name>
        <Guid>UKR.12.20_1</Guid>
        <DataUrl>Переяслав-Хмельницький район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Поліський район</Name>
        <Guid>UKR.12.21_1</Guid>
        <DataUrl>Поліський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рокитнянський район</Name>
        <Guid>UKR.12.22_1</Guid>
        <DataUrl>Рокитнянський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сквирський район</Name>
        <Guid>UKR.12.23_1</Guid>
        <DataUrl>Сквирський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ставищенський район</Name>
        <Guid>UKR.12.24_1</Guid>
        <DataUrl>Ставищенський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Таращанський район</Name>
        <Guid>UKR.12.25_1</Guid>
        <DataUrl>Таращанський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тетіївський район</Name>
        <Guid>UKR.12.26_1</Guid>
        <DataUrl>Тетіївський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Васильківський район (Київська область)</Name>
        <Guid>UKR.12.27_1</Guid>
        <DataUrl>Васильківський район (Київська область)</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Володарський район</Name>
        <Guid>UKR.12.28_1</Guid>
        <DataUrl>Володарський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вишгородський район</Name>
        <Guid>UKR.12.29_1</Guid>
        <DataUrl>Вишгородський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Згурівський район</Name>
        <Guid>UKR.12.30_1</Guid>
        <DataUrl>Згурівський район</DataUrl>
        <ParentRegion>UKR.12_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дарницький район</Name>
        <Guid>UKR.11.1_1</Guid>
        <DataUrl>Дарницький район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Деснянський район (Київ)</Name>
        <Guid>UKR.11.2_1</Guid>
        <DataUrl>Деснянський район (Київ)</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дніпровський район (Київ)</Name>
        <Guid>UKR.11.3_1</Guid>
        <DataUrl>Дніпровський район (Київ)</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Голосіївський район</Name>
        <Guid>UKR.11.4_1</Guid>
        <DataUrl>Голосіївський район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Оболонський район</Name>
        <Guid>UKR.11.5_1</Guid>
        <DataUrl>Оболонський район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Печерський район</Name>
        <Guid>UKR.11.6_1</Guid>
        <DataUrl>Печерський район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Подільський район (Київ)</Name>
        <Guid>UKR.11.7_1</Guid>
        <DataUrl>Подільський район (Київ)</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шевченківський район (Київ)</Name>
        <Guid>UKR.11.8_1</Guid>
        <DataUrl>Шевченківський район (Київ)</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Солом'янський район</Name>
        <Guid>UKR.11.9_1</Guid>
        <DataUrl>Солом'янський район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Святошинський район</Name>
        <Guid>UKR.11.10_1</Guid>
        <DataUrl>Святошинський район</DataUrl>
        <ParentRegion>UKR.11_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бобринецький район</Name>
        <Guid>UKR.13.1_1</Guid>
        <DataUrl>Бобринецький район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Добровеличківський район</Name>
        <Guid>UKR.13.2_1</Guid>
        <DataUrl>Добровеличківський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Долинський район (Кіровоградська область)</Name>
        <Guid>UKR.13.3_1</Guid>
        <DataUrl>Долинський район (Кіровоградська область)</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гайворонський район</Name>
        <Guid>UKR.13.4_1</Guid>
        <DataUrl>Гайворонський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Голованівський район</Name>
        <Guid>UKR.13.5_1</Guid>
        <DataUrl>Голованівський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кіровоградський район</Name>
        <Guid>UKR.13.6_1</Guid>
        <DataUrl>Кіровоградський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Компаніївський район</Name>
        <Guid>UKR.13.7_1</Guid>
        <DataUrl>Компаніївський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Маловисківський район</Name>
        <Guid>UKR.13.8_1</Guid>
        <DataUrl>Маловисківський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новгородківський район</Name>
        <Guid>UKR.13.9_1</Guid>
        <DataUrl>Новгородківський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоархангельський район</Name>
        <Guid>UKR.13.10_1</Guid>
        <DataUrl>Новоархангельський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новомиргородський район</Name>
        <Guid>UKR.13.11_1</Guid>
        <DataUrl>Новомиргородський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоукраїнський район</Name>
        <Guid>UKR.13.12_1</Guid>
        <DataUrl>Новоукраїнський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Олександрійський район</Name>
        <Guid>UKR.13.13_1</Guid>
        <DataUrl>Олександрійський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Олександрівський район (Кіровоградська область)</Name>
        <Guid>UKR.13.14_1</Guid>
        <DataUrl>Олександрівський район (Кіровоградська область)</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Онуфріївський район</Name>
        <Guid>UKR.13.15_1</Guid>
        <DataUrl>Онуфріївський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Петрівський район</Name>
        <Guid>UKR.13.16_1</Guid>
        <DataUrl>Петрівський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Світловодський район</Name>
        <Guid>UKR.13.17_1</Guid>
        <DataUrl>Світловодський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Благовіщенський район</Name>
        <Guid>UKR.13.18_1</Guid>
        <DataUrl>Благовіщенський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Устинівський район</Name>
        <Guid>UKR.13.19_1</Guid>
        <DataUrl>Устинівський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вільшанський район</Name>
        <Guid>UKR.13.20_1</Guid>
        <DataUrl>Вільшанський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Знам'янський район</Name>
        <Guid>UKR.13.21_1</Guid>
        <DataUrl>Знам'янський район</DataUrl>
        <ParentRegion>UKR.13_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бродівський район</Name>
        <Guid>UKR.14.1_1</Guid>
        <DataUrl>Бродівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Буський район</Name>
        <Guid>UKR.14.2_1</Guid>
        <DataUrl>Буський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Червоноград</Name>
        <Guid>UKR.14.3_1</Guid>
        <DataUrl>Червоноград</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дрогобич</Name>
        <Guid>UKR.14.4_1</Guid>
        <DataUrl>Дрогобич</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дрогобицький район</Name>
        <Guid>UKR.14.5_1</Guid>
        <DataUrl>Дрогобицький район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Городоцький район (Львівська область)</Name>
        <Guid>UKR.14.6_1</Guid>
        <DataUrl>Городоцький район (Львівська область)</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Яворівський район</Name>
        <Guid>UKR.14.7_1</Guid>
        <DataUrl>Яворівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янка-Бузький район</Name>
        <Guid>UKR.14.8_1</Guid>
        <DataUrl>Кам'янка-Бузький район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Львів</Name>
        <Guid>UKR.14.9_1</Guid>
        <DataUrl>Львів</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мостиський район</Name>
        <Guid>UKR.14.10_1</Guid>
        <DataUrl>Мостиський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миколаївський район (Львівська область)</Name>
        <Guid>UKR.14.11_1</Guid>
        <DataUrl>Миколаївський район (Львівська область)</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Перемишлянський район</Name>
        <Guid>UKR.14.12_1</Guid>
        <DataUrl>Перемишлянський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Пустомитівський район</Name>
        <Guid>UKR.14.13_1</Guid>
        <DataUrl>Пустомитівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Радехівський район</Name>
        <Guid>UKR.14.14_1</Guid>
        <DataUrl>Радехівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Самбір</Name>
        <Guid>UKR.14.15_1</Guid>
        <DataUrl>Самбір</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Самбірський район</Name>
        <Guid>UKR.14.16_1</Guid>
        <DataUrl>Самбірський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сколівський район</Name>
        <Guid>UKR.14.17_1</Guid>
        <DataUrl>Сколівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сокальський район</Name>
        <Guid>UKR.14.18_1</Guid>
        <DataUrl>Сокальський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старосамбірський район</Name>
        <Guid>UKR.14.19_1</Guid>
        <DataUrl>Старосамбірський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Стрий</Name>
        <Guid>UKR.14.20_1</Guid>
        <DataUrl>Стрий</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Стрийський район</Name>
        <Guid>UKR.14.21_1</Guid>
        <DataUrl>Стрийський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Турківський район</Name>
        <Guid>UKR.14.22_1</Guid>
        <DataUrl>Турківський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жовківський район</Name>
        <Guid>UKR.14.23_1</Guid>
        <DataUrl>Жовківський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жидачівський район</Name>
        <Guid>UKR.14.24_1</Guid>
        <DataUrl>Жидачівський район</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Золочівський район (Львівська область)</Name>
        <Guid>UKR.14.25_1</Guid>
        <DataUrl>Золочівський район (Львівська область)</DataUrl>
        <ParentRegion>UKR.14_1</ParentRegion>
    </Region>
    <Region>
        <Name>Алчевськ</Name>
        <Guid>UKR.15.1_1</Guid>
        <DataUrl>Алчевськ</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Антрацит (місто)</Name>
        <Guid>UKR.15.2_1</Guid>
        <DataUrl>Антрацит (місто)</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Антрацитівський район</Name>
        <Guid>UKR.15.3_1</Guid>
        <DataUrl>Антрацитівський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білокуракинський район</Name>
        <Guid>UKR.15.4_1</Guid>
        <DataUrl>Білокуракинський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Біловодський район</Name>
        <Guid>UKR.15.5_1</Guid>
        <DataUrl>Біловодський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Брянка</Name>
        <Guid>UKR.15.6_1</Guid>
        <DataUrl>Брянка</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Голубівка</Name>
        <Guid>UKR.15.7_1</Guid>
        <DataUrl>Голубівка</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сорокине</Name>
        <Guid>UKR.15.8_1</Guid>
        <DataUrl>Сорокине</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сорокинський район</Name>
        <Guid>UKR.15.9_1</Guid>
        <DataUrl>Сорокинський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хрустальний</Name>
        <Guid>UKR.15.10_1</Guid>
        <DataUrl>Хрустальний</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кремінський район</Name>
        <Guid>UKR.15.11_1</Guid>
        <DataUrl>Кремінський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Луганськ</Name>
        <Guid>UKR.15.12_1</Guid>
        <DataUrl>Луганськ</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лутугинський район</Name>
        <Guid>UKR.15.13_1</Guid>
        <DataUrl>Лутугинський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лисичанськ</Name>
        <Guid>UKR.15.14_1</Guid>
        <DataUrl>Лисичанськ</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Марківський район</Name>
        <Guid>UKR.15.15_1</Guid>
        <DataUrl>Марківський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Міловський район</Name>
        <Guid>UKR.15.16_1</Guid>
        <DataUrl>Міловський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>n.a. ( 182) </Name>
        <Guid>UKR.15.17_1</Guid>
        <DataUrl>n.a. ( 182) </DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоайдарський район</Name>
        <Guid>UKR.15.18_1</Guid>
        <DataUrl>Новоайдарський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новопсковський район</Name>
        <Guid>UKR.15.19_1</Guid>
        <DataUrl>Новопсковський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Перевальський район</Name>
        <Guid>UKR.15.20_1</Guid>
        <DataUrl>Перевальський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Попаснянський район</Name>
        <Guid>UKR.15.21_1</Guid>
        <DataUrl>Попаснянський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ровеньки</Name>
        <Guid>UKR.15.22_1</Guid>
        <DataUrl>Ровеньки</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рубіжне</Name>
        <Guid>UKR.15.23_1</Guid>
        <DataUrl>Рубіжне</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сєвєродонецьк</Name>
        <Guid>UKR.15.24_1</Guid>
        <DataUrl>Сєвєродонецьк</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Слов'яносербський район</Name>
        <Guid>UKR.15.25_1</Guid>
        <DataUrl>Слов'яносербський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кадіївка</Name>
        <Guid>UKR.15.26_1</Guid>
        <DataUrl>Кадіївка</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Станично-Луганський район</Name>
        <Guid>UKR.15.27_1</Guid>
        <DataUrl>Станично-Луганський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старобільський район</Name>
        <Guid>UKR.15.28_1</Guid>
        <DataUrl>Старобільський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сватівський район</Name>
        <Guid>UKR.15.29_1</Guid>
        <DataUrl>Сватівський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Довжанськ</Name>
        <Guid>UKR.15.30_1</Guid>
        <DataUrl>Довжанськ</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Довжанський район</Name>
        <Guid>UKR.15.31_1</Guid>
        <DataUrl>Довжанський район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Троїцький район</Name>
        <Guid>UKR.15.32_1</Guid>
        <DataUrl>Троїцький район</DataUrl>
        <ParentRegion>UKR.15_1</ParentRegion>
    </Region>
    <Region>
        <Name>Арбузинський район</Name>
        <Guid>UKR.16.1_1</Guid>
        <DataUrl>Арбузинський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Баштанський район</Name>
        <Guid>UKR.16.2_1</Guid>
        <DataUrl>Баштанський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Березанський район</Name>
        <Guid>UKR.16.3_1</Guid>
        <DataUrl>Березанський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Березнегуватський район</Name>
        <Guid>UKR.16.4_1</Guid>
        <DataUrl>Березнегуватський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Братський район</Name>
        <Guid>UKR.16.5_1</Guid>
        <DataUrl>Братський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Доманівський район</Name>
        <Guid>UKR.16.6_1</Guid>
        <DataUrl>Доманівський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Єланецький район</Name>
        <Guid>UKR.16.7_1</Guid>
        <DataUrl>Єланецький район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Казанківський район</Name>
        <Guid>UKR.16.8_1</Guid>
        <DataUrl>Казанківський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кривоозерський район</Name>
        <Guid>UKR.16.9_1</Guid>
        <DataUrl>Кривоозерський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миколаїв</Name>
        <Guid>UKR.16.10_1</Guid>
        <DataUrl>Миколаїв</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миколаївський район (Миколаївська область)</Name>
        <Guid>UKR.16.11_1</Guid>
        <DataUrl>Миколаївський район (Миколаївська область)</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новобузький район</Name>
        <Guid>UKR.16.12_1</Guid>
        <DataUrl>Новобузький район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоодеський район</Name>
        <Guid>UKR.16.13_1</Guid>
        <DataUrl>Новоодеський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Очаківський район</Name>
        <Guid>UKR.16.14_1</Guid>
        <DataUrl>Очаківський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Первомайськ (Миколаївська область)</Name>
        <Guid>UKR.16.15_1</Guid>
        <DataUrl>Первомайськ (Миколаївська область)</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Первомайський район (Миколаївська область)</Name>
        <Guid>UKR.16.16_1</Guid>
        <DataUrl>Первомайський район (Миколаївська область)</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Снігурівський район</Name>
        <Guid>UKR.16.17_1</Guid>
        <DataUrl>Снігурівський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Веселинівський район</Name>
        <Guid>UKR.16.18_1</Guid>
        <DataUrl>Веселинівський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вознесенськ</Name>
        <Guid>UKR.16.19_1</Guid>
        <DataUrl>Вознесенськ</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вознесенський район</Name>
        <Guid>UKR.16.20_1</Guid>
        <DataUrl>Вознесенський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Врадіївський район</Name>
        <Guid>UKR.16.21_1</Guid>
        <DataUrl>Врадіївський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вітовський район</Name>
        <Guid>UKR.16.22_1</Guid>
        <DataUrl>Вітовський район</DataUrl>
        <ParentRegion>UKR.16_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ананьївський район</Name>
        <Guid>UKR.17.1_1</Guid>
        <DataUrl>Ананьївський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Арцизький район</Name>
        <Guid>UKR.17.2_1</Guid>
        <DataUrl>Арцизький район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Балтський район</Name>
        <Guid>UKR.17.3_1</Guid>
        <DataUrl>Балтський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Березівський район</Name>
        <Guid>UKR.17.4_1</Guid>
        <DataUrl>Березівський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білгород-Дністровський</Name>
        <Guid>UKR.17.5_1</Guid>
        <DataUrl>Білгород-Дністровський</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білгород-Дністровський район</Name>
        <Guid>UKR.17.6_1</Guid>
        <DataUrl>Білгород-Дністровський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Біляївський район</Name>
        <Guid>UKR.17.7_1</Guid>
        <DataUrl>Біляївський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Болградський район</Name>
        <Guid>UKR.17.8_1</Guid>
        <DataUrl>Болградський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Захарівський район</Name>
        <Guid>UKR.17.9_1</Guid>
        <DataUrl>Захарівський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іванівський район</Name>
        <Guid>UKR.17.10_1</Guid>
        <DataUrl>Іванівський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ізмаїльський район</Name>
        <Guid>UKR.17.11_1</Guid>
        <DataUrl>Ізмаїльський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кілійський район</Name>
        <Guid>UKR.17.12_1</Guid>
        <DataUrl>Кілійський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кодимський район</Name>
        <Guid>UKR.17.13_1</Guid>
        <DataUrl>Кодимський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лиманський район (Одеська область)</Name>
        <Guid>UKR.17.14_1</Guid>
        <DataUrl>Лиманський район (Одеська область)</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Подільськ</Name>
        <Guid>UKR.17.15_1</Guid>
        <DataUrl>Подільськ</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Подільський район (Одеська область)</Name>
        <Guid>UKR.17.16_1</Guid>
        <DataUrl>Подільський район (Одеська область)</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Окнянський район</Name>
        <Guid>UKR.17.17_1</Guid>
        <DataUrl>Окнянський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Любашівський район</Name>
        <Guid>UKR.17.18_1</Guid>
        <DataUrl>Любашівський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миколаївський район (Одеська область)</Name>
        <Guid>UKR.17.19_1</Guid>
        <DataUrl>Миколаївський район (Одеська область)</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Одеса</Name>
        <Guid>UKR.17.20_1</Guid>
        <DataUrl>Одеса</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Овідіопольський район</Name>
        <Guid>UKR.17.21_1</Guid>
        <DataUrl>Овідіопольський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ренійський район</Name>
        <Guid>UKR.17.22_1</Guid>
        <DataUrl>Ренійський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Роздільнянський район</Name>
        <Guid>UKR.17.23_1</Guid>
        <DataUrl>Роздільнянський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Саратський район</Name>
        <Guid>UKR.17.24_1</Guid>
        <DataUrl>Саратський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Савранський район</Name>
        <Guid>UKR.17.25_1</Guid>
        <DataUrl>Савранський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ширяївський район</Name>
        <Guid>UKR.17.26_1</Guid>
        <DataUrl>Ширяївський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тарутинський район</Name>
        <Guid>UKR.17.27_1</Guid>
        <DataUrl>Тарутинський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Татарбунарський район</Name>
        <Guid>UKR.17.28_1</Guid>
        <DataUrl>Татарбунарський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великомихайлівський район</Name>
        <Guid>UKR.17.29_1</Guid>
        <DataUrl>Великомихайлівський район</DataUrl>
        <ParentRegion>UKR.17_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чорнухинський район</Name>
        <Guid>UKR.18.1_1</Guid>
        <DataUrl>Чорнухинський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чутівський район</Name>
        <Guid>UKR.18.2_1</Guid>
        <DataUrl>Чутівський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Диканський район</Name>
        <Guid>UKR.18.3_1</Guid>
        <DataUrl>Диканський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гадяцький район</Name>
        <Guid>UKR.18.4_1</Guid>
        <DataUrl>Гадяцький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Глобинський район</Name>
        <Guid>UKR.18.5_1</Guid>
        <DataUrl>Глобинський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гребінківський район</Name>
        <Guid>UKR.18.6_1</Guid>
        <DataUrl>Гребінківський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Карлівський район</Name>
        <Guid>UKR.18.7_1</Guid>
        <DataUrl>Карлівський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хорольський район</Name>
        <Guid>UKR.18.8_1</Guid>
        <DataUrl>Хорольський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кобеляцький район</Name>
        <Guid>UKR.18.9_1</Guid>
        <DataUrl>Кобеляцький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Горішні Плавнi</Name>
        <Guid>UKR.18.10_1</Guid>
        <DataUrl>Горішні Плавнi</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Котелевський район</Name>
        <Guid>UKR.18.11_1</Guid>
        <DataUrl>Котелевський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Козельщинський район</Name>
        <Guid>UKR.18.12_1</Guid>
        <DataUrl>Козельщинський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кременчук</Name>
        <Guid>UKR.18.13_1</Guid>
        <DataUrl>Кременчук</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кременчуцький район</Name>
        <Guid>UKR.18.14_1</Guid>
        <DataUrl>Кременчуцький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лохвицький район</Name>
        <Guid>UKR.18.15_1</Guid>
        <DataUrl>Лохвицький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лубни</Name>
        <Guid>UKR.18.16_1</Guid>
        <DataUrl>Лубни</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лубенський район</Name>
        <Guid>UKR.18.17_1</Guid>
        <DataUrl>Лубенський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Машівський район</Name>
        <Guid>UKR.18.18_1</Guid>
        <DataUrl>Машівський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Миргородський район</Name>
        <Guid>UKR.18.19_1</Guid>
        <DataUrl>Миргородський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новосанжарський район</Name>
        <Guid>UKR.18.20_1</Guid>
        <DataUrl>Новосанжарський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Оржицький район</Name>
        <Guid>UKR.18.21_1</Guid>
        <DataUrl>Оржицький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Полтава</Name>
        <Guid>UKR.18.22_1</Guid>
        <DataUrl>Полтава</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Полтавський район</Name>
        <Guid>UKR.18.23_1</Guid>
        <DataUrl>Полтавський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Пирятинський район</Name>
        <Guid>UKR.18.24_1</Guid>
        <DataUrl>Пирятинський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Решетилівський район</Name>
        <Guid>UKR.18.25_1</Guid>
        <DataUrl>Решетилівський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Семенівський район (Полтавська область)</Name>
        <Guid>UKR.18.26_1</Guid>
        <DataUrl>Семенівський район (Полтавська область)</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шишацький район</Name>
        <Guid>UKR.18.27_1</Guid>
        <DataUrl>Шишацький район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великобагачанський район</Name>
        <Guid>UKR.18.28_1</Guid>
        <DataUrl>Великобагачанський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зіньківський район</Name>
        <Guid>UKR.18.29_1</Guid>
        <DataUrl>Зіньківський район</DataUrl>
        <ParentRegion>UKR.18_1</ParentRegion>
    </Region>
    <Region>
        <Name>Березнівський район</Name>
        <Guid>UKR.19.1_1</Guid>
        <DataUrl>Березнівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Демидівський район</Name>
        <Guid>UKR.19.2_1</Guid>
        <DataUrl>Демидівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дубенський район</Name>
        <Guid>UKR.19.3_1</Guid>
        <DataUrl>Дубенський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дубно</Name>
        <Guid>UKR.19.4_1</Guid>
        <DataUrl>Дубно</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Дубровицький район</Name>
        <Guid>UKR.19.5_1</Guid>
        <DataUrl>Дубровицький район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гощанський район</Name>
        <Guid>UKR.19.6_1</Guid>
        <DataUrl>Гощанський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Корецький район</Name>
        <Guid>UKR.19.7_1</Guid>
        <DataUrl>Корецький район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Костопільський район</Name>
        <Guid>UKR.19.8_1</Guid>
        <DataUrl>Костопільський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Млинівський район</Name>
        <Guid>UKR.19.9_1</Guid>
        <DataUrl>Млинівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Острозький район</Name>
        <Guid>UKR.19.10_1</Guid>
        <DataUrl>Острозький район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Радивилівський район</Name>
        <Guid>UKR.19.11_1</Guid>
        <DataUrl>Радивилівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рівне</Name>
        <Guid>UKR.19.12_1</Guid>
        <DataUrl>Рівне</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рівненський район</Name>
        <Guid>UKR.19.13_1</Guid>
        <DataUrl>Рівненський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рокитнівський район</Name>
        <Guid>UKR.19.14_1</Guid>
        <DataUrl>Рокитнівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сарненський район</Name>
        <Guid>UKR.19.15_1</Guid>
        <DataUrl>Сарненський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Володимирецький район</Name>
        <Guid>UKR.19.16_1</Guid>
        <DataUrl>Володимирецький район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зарічненський район</Name>
        <Guid>UKR.19.17_1</Guid>
        <DataUrl>Зарічненський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Здолбунівський район</Name>
        <Guid>UKR.19.18_1</Guid>
        <DataUrl>Здолбунівський район</DataUrl>
        <ParentRegion>UKR.19_1</ParentRegion>
    </Region>
    <Region>
        <Name>Балаклавський район</Name>
        <Guid>UKR.20.1_1</Guid>
        <DataUrl>Балаклавський район</DataUrl>
        <ParentRegion>UKR.20_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гагарінський район (Севастополь)</Name>
        <Guid>UKR.20.2_1</Guid>
        <DataUrl>Гагарінський район (Севастополь)</DataUrl>
        <ParentRegion>UKR.20_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ленінський район (Севастополь)</Name>
        <Guid>UKR.20.3_1</Guid>
        <DataUrl>Ленінський район (Севастополь)</DataUrl>
        <ParentRegion>UKR.20_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нахімовський район</Name>
        <Guid>UKR.20.4_1</Guid>
        <DataUrl>Нахімовський район</DataUrl>
        <ParentRegion>UKR.20_1</ParentRegion>
    </Region>
    <Region>
        <Name>Білопільський район</Name>
        <Guid>UKR.21.1_1</Guid>
        <DataUrl>Білопільський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Буринський район</Name>
        <Guid>UKR.21.2_1</Guid>
        <DataUrl>Буринський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Глухівський район</Name>
        <Guid>UKR.21.3_1</Guid>
        <DataUrl>Глухівський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ямпільський район (Сумська область)</Name>
        <Guid>UKR.21.4_1</Guid>
        <DataUrl>Ямпільський район (Сумська область)</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Конотоп</Name>
        <Guid>UKR.21.5_1</Guid>
        <DataUrl>Конотоп</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Конотопський район</Name>
        <Guid>UKR.21.6_1</Guid>
        <DataUrl>Конотопський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Краснопільський район</Name>
        <Guid>UKR.21.7_1</Guid>
        <DataUrl>Краснопільський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кролевецький район</Name>
        <Guid>UKR.21.8_1</Guid>
        <DataUrl>Кролевецький район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лебединський район</Name>
        <Guid>UKR.21.9_1</Guid>
        <DataUrl>Лебединський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Липоводолинський район</Name>
        <Guid>UKR.21.10_1</Guid>
        <DataUrl>Липоводолинський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Недригайлівський район</Name>
        <Guid>UKR.21.11_1</Guid>
        <DataUrl>Недригайлівський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Охтирка</Name>
        <Guid>UKR.21.12_1</Guid>
        <DataUrl>Охтирка</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Охтирський район</Name>
        <Guid>UKR.21.13_1</Guid>
        <DataUrl>Охтирський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Путивльський район</Name>
        <Guid>UKR.21.14_1</Guid>
        <DataUrl>Путивльський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ромни</Name>
        <Guid>UKR.21.15_1</Guid>
        <DataUrl>Ромни</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Роменський район</Name>
        <Guid>UKR.21.16_1</Guid>
        <DataUrl>Роменський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Середино-Будський район</Name>
        <Guid>UKR.21.17_1</Guid>
        <DataUrl>Середино-Будський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шостка</Name>
        <Guid>UKR.21.18_1</Guid>
        <DataUrl>Шостка</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шосткинський район</Name>
        <Guid>UKR.21.19_1</Guid>
        <DataUrl>Шосткинський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Суми</Name>
        <Guid>UKR.21.20_1</Guid>
        <DataUrl>Суми</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Сумський район</Name>
        <Guid>UKR.21.21_1</Guid>
        <DataUrl>Сумський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тростянецький район (Сумська область)</Name>
        <Guid>UKR.21.22_1</Guid>
        <DataUrl>Тростянецький район (Сумська область)</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великописарівський район</Name>
        <Guid>UKR.21.23_1</Guid>
        <DataUrl>Великописарівський район</DataUrl>
        <ParentRegion>UKR.21_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бережанський район</Name>
        <Guid>UKR.22.1_1</Guid>
        <DataUrl>Бережанський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Борщівський район</Name>
        <Guid>UKR.22.2_1</Guid>
        <DataUrl>Борщівський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бучачский район</Name>
        <Guid>UKR.22.3_1</Guid>
        <DataUrl>Бучачский район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чортківський район</Name>
        <Guid>UKR.22.4_1</Guid>
        <DataUrl>Чортківський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гусятинський район</Name>
        <Guid>UKR.22.5_1</Guid>
        <DataUrl>Гусятинський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Козівський район</Name>
        <Guid>UKR.22.6_1</Guid>
        <DataUrl>Козівський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кременецький район</Name>
        <Guid>UKR.22.7_1</Guid>
        <DataUrl>Кременецький район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лановецький район</Name>
        <Guid>UKR.22.8_1</Guid>
        <DataUrl>Лановецький район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Монастириський район</Name>
        <Guid>UKR.22.9_1</Guid>
        <DataUrl>Монастириський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Підгаєцький район</Name>
        <Guid>UKR.22.10_1</Guid>
        <DataUrl>Підгаєцький район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Підволочиський район</Name>
        <Guid>UKR.22.11_1</Guid>
        <DataUrl>Підволочиський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шумський район</Name>
        <Guid>UKR.22.12_1</Guid>
        <DataUrl>Шумський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Теребовлянський район</Name>
        <Guid>UKR.22.13_1</Guid>
        <DataUrl>Теребовлянський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тернопіль</Name>
        <Guid>UKR.22.14_1</Guid>
        <DataUrl>Тернопіль</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тернопільський район</Name>
        <Guid>UKR.22.15_1</Guid>
        <DataUrl>Тернопільський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Заліщицький район</Name>
        <Guid>UKR.22.16_1</Guid>
        <DataUrl>Заліщицький район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Збаразький район</Name>
        <Guid>UKR.22.17_1</Guid>
        <DataUrl>Збаразький район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Зборівський район</Name>
        <Guid>UKR.22.18_1</Guid>
        <DataUrl>Зборівський район</DataUrl>
        <ParentRegion>UKR.22_1</ParentRegion>
    </Region>
    <Region>
        <Name>Берегівський район</Name>
        <Guid>UKR.23.1_1</Guid>
        <DataUrl>Берегівський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іршавський район</Name>
        <Guid>UKR.23.2_1</Guid>
        <DataUrl>Іршавський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хустський район</Name>
        <Guid>UKR.23.3_1</Guid>
        <DataUrl>Хустський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Міжгірський район</Name>
        <Guid>UKR.23.4_1</Guid>
        <DataUrl>Міжгірський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мукачево</Name>
        <Guid>UKR.23.5_1</Guid>
        <DataUrl>Мукачево</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мукачівський район</Name>
        <Guid>UKR.23.6_1</Guid>
        <DataUrl>Мукачівський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Перечинський район</Name>
        <Guid>UKR.23.7_1</Guid>
        <DataUrl>Перечинський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рахівський район</Name>
        <Guid>UKR.23.8_1</Guid>
        <DataUrl>Рахівський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Свалявський район</Name>
        <Guid>UKR.23.9_1</Guid>
        <DataUrl>Свалявський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тячівський район</Name>
        <Guid>UKR.23.10_1</Guid>
        <DataUrl>Тячівський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ужгород</Name>
        <Guid>UKR.23.11_1</Guid>
        <DataUrl>Ужгород</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ужгородський район</Name>
        <Guid>UKR.23.12_1</Guid>
        <DataUrl>Ужгородський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великоберезнянський район</Name>
        <Guid>UKR.23.13_1</Guid>
        <DataUrl>Великоберезнянський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Воловецький район</Name>
        <Guid>UKR.23.14_1</Guid>
        <DataUrl>Воловецький район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Виноградівський район</Name>
        <Guid>UKR.23.15_1</Guid>
        <DataUrl>Виноградівський район</DataUrl>
        <ParentRegion>UKR.23_1</ParentRegion>
    </Region>
    <Region>
        <Name>Барський район</Name>
        <Guid>UKR.24.1_1</Guid>
        <DataUrl>Барський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бершадський район</Name>
        <Guid>UKR.24.2_1</Guid>
        <DataUrl>Бершадський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чечельницький район</Name>
        <Guid>UKR.24.3_1</Guid>
        <DataUrl>Чечельницький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ямпільський район (Вінницька область)</Name>
        <Guid>UKR.24.4_1</Guid>
        <DataUrl>Ямпільський район (Вінницька область)</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іллінецький район</Name>
        <Guid>UKR.24.5_1</Guid>
        <DataUrl>Іллінецький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Калинівський район</Name>
        <Guid>UKR.24.6_1</Guid>
        <DataUrl>Калинівський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хмільницький район</Name>
        <Guid>UKR.24.7_1</Guid>
        <DataUrl>Хмільницький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Козятинський район</Name>
        <Guid>UKR.24.8_1</Guid>
        <DataUrl>Козятинський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Крижопільський район</Name>
        <Guid>UKR.24.9_1</Guid>
        <DataUrl>Крижопільський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ладижин</Name>
        <Guid>UKR.24.10_1</Guid>
        <DataUrl>Ладижин</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Літинський район</Name>
        <Guid>UKR.24.11_1</Guid>
        <DataUrl>Літинський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Липовецький район</Name>
        <Guid>UKR.24.12_1</Guid>
        <DataUrl>Липовецький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Могилів-Подільський</Name>
        <Guid>UKR.24.13_1</Guid>
        <DataUrl>Могилів-Подільський</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Могилів-Подільський район</Name>
        <Guid>UKR.24.14_1</Guid>
        <DataUrl>Могилів-Подільський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мурованокуриловецький район</Name>
        <Guid>UKR.24.15_1</Guid>
        <DataUrl>Мурованокуриловецький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Немирівський район</Name>
        <Guid>UKR.24.16_1</Guid>
        <DataUrl>Немирівський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Оратівський район</Name>
        <Guid>UKR.24.17_1</Guid>
        <DataUrl>Оратівський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Піщанський район</Name>
        <Guid>UKR.24.18_1</Guid>
        <DataUrl>Піщанський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Погребищенський район</Name>
        <Guid>UKR.24.19_1</Guid>
        <DataUrl>Погребищенський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шаргородський район</Name>
        <Guid>UKR.24.20_1</Guid>
        <DataUrl>Шаргородський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Теплицький район</Name>
        <Guid>UKR.24.21_1</Guid>
        <DataUrl>Теплицький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Томашпільський район</Name>
        <Guid>UKR.24.22_1</Guid>
        <DataUrl>Томашпільський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тростянецький район (Вінницька область)</Name>
        <Guid>UKR.24.23_1</Guid>
        <DataUrl>Тростянецький район (Вінницька область)</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тульчинський район</Name>
        <Guid>UKR.24.24_1</Guid>
        <DataUrl>Тульчинський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Тиврівський район</Name>
        <Guid>UKR.24.25_1</Guid>
        <DataUrl>Тиврівський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вінниця</Name>
        <Guid>UKR.24.26_1</Guid>
        <DataUrl>Вінниця</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вінницький район</Name>
        <Guid>UKR.24.27_1</Guid>
        <DataUrl>Вінницький район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жмеринка</Name>
        <Guid>UKR.24.28_1</Guid>
        <DataUrl>Жмеринка</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Жмеринський район</Name>
        <Guid>UKR.24.29_1</Guid>
        <DataUrl>Жмеринський район</DataUrl>
        <ParentRegion>UKR.24_1</ParentRegion>
    </Region>
    <Region>
        <Name>Горохівський район</Name>
        <Guid>UKR.25.1_1</Guid>
        <DataUrl>Горохівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Іваничівський район</Name>
        <Guid>UKR.25.2_1</Guid>
        <DataUrl>Іваничівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Камінь-Каширський</Name>
        <Guid>UKR.25.3_1</Guid>
        <DataUrl>Камінь-Каширський</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ківерцівський район</Name>
        <Guid>UKR.25.4_1</Guid>
        <DataUrl>Ківерцівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ковель</Name>
        <Guid>UKR.25.5_1</Guid>
        <DataUrl>Ковель</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ковельський район</Name>
        <Guid>UKR.25.6_1</Guid>
        <DataUrl>Ковельський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Любешівський район</Name>
        <Guid>UKR.25.7_1</Guid>
        <DataUrl>Любешівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Любомльський район</Name>
        <Guid>UKR.25.8_1</Guid>
        <DataUrl>Любомльський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Локачинський район</Name>
        <Guid>UKR.25.9_1</Guid>
        <DataUrl>Локачинський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Луцьк</Name>
        <Guid>UKR.25.10_1</Guid>
        <DataUrl>Луцьк</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Луцький район</Name>
        <Guid>UKR.25.11_1</Guid>
        <DataUrl>Луцький район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Маневицький район</Name>
        <Guid>UKR.25.12_1</Guid>
        <DataUrl>Маневицький район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Нововолинськ</Name>
        <Guid>UKR.25.13_1</Guid>
        <DataUrl>Нововолинськ</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ратнівський район</Name>
        <Guid>UKR.25.14_1</Guid>
        <DataUrl>Ратнівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Рожищенський район</Name>
        <Guid>UKR.25.15_1</Guid>
        <DataUrl>Рожищенський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Шацький район</Name>
        <Guid>UKR.25.16_1</Guid>
        <DataUrl>Шацький район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Старовижівський район</Name>
        <Guid>UKR.25.17_1</Guid>
        <DataUrl>Старовижівський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Турійський район</Name>
        <Guid>UKR.25.18_1</Guid>
        <DataUrl>Турійський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Володимир-Волинський район</Name>
        <Guid>UKR.25.19_1</Guid>
        <DataUrl>Володимир-Волинський район</DataUrl>
        <ParentRegion>UKR.25_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бердянськ</Name>
        <Guid>UKR.26.1_1</Guid>
        <DataUrl>Бердянськ</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бердянський район</Name>
        <Guid>UKR.26.2_1</Guid>
        <DataUrl>Бердянський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чернігівський район (Запорізька область)</Name>
        <Guid>UKR.26.3_1</Guid>
        <DataUrl>Чернігівський район (Запорізька область)</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Енергодар</Name>
        <Guid>UKR.26.4_1</Guid>
        <DataUrl>Енергодар</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Гуляйпільський район</Name>
        <Guid>UKR.26.5_1</Guid>
        <DataUrl>Гуляйпільський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Якимівський район</Name>
        <Guid>UKR.26.6_1</Guid>
        <DataUrl>Якимівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Кам'янсько-Дніпровський район</Name>
        <Guid>UKR.26.7_1</Guid>
        <DataUrl>Кам'янсько-Дніпровський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Більмацький район</Name>
        <Guid>UKR.26.8_1</Guid>
        <DataUrl>Більмацький район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мелітополь</Name>
        <Guid>UKR.26.9_1</Guid>
        <DataUrl>Мелітополь</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Мелітопольський район</Name>
        <Guid>UKR.26.10_1</Guid>
        <DataUrl>Мелітопольський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Михайлівський район</Name>
        <Guid>UKR.26.11_1</Guid>
        <DataUrl>Михайлівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новомиколаївський район</Name>
        <Guid>UKR.26.12_1</Guid>
        <DataUrl>Новомиколаївський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Оріхівський район</Name>
        <Guid>UKR.26.13_1</Guid>
        <DataUrl>Оріхівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Пологівський район</Name>
        <Guid>UKR.26.14_1</Guid>
        <DataUrl>Пологівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Приазовський район</Name>
        <Guid>UKR.26.15_1</Guid>
        <DataUrl>Приазовський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Приморський район (Запорізька область)</Name>
        <Guid>UKR.26.16_1</Guid>
        <DataUrl>Приморський район (Запорізька область)</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Розівський район</Name>
        <Guid>UKR.26.17_1</Guid>
        <DataUrl>Розівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Токмак</Name>
        <Guid>UKR.26.18_1</Guid>
        <DataUrl>Токмак</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Токмацький район</Name>
        <Guid>UKR.26.19_1</Guid>
        <DataUrl>Токмацький район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Василівський район</Name>
        <Guid>UKR.26.20_1</Guid>
        <DataUrl>Василівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Великобілозерський район</Name>
        <Guid>UKR.26.21_1</Guid>
        <DataUrl>Великобілозерський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Веселівський район</Name>
        <Guid>UKR.26.22_1</Guid>
        <DataUrl>Веселівський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Вільнянський район</Name>
        <Guid>UKR.26.23_1</Guid>
        <DataUrl>Вільнянський район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Запоріжжя</Name>
        <Guid>UKR.26.24_1</Guid>
        <DataUrl>Запоріжжя</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Запорізький район</Name>
        <Guid>UKR.26.25_1</Guid>
        <DataUrl>Запорізький район</DataUrl>
        <ParentRegion>UKR.26_1</ParentRegion>
    </Region>
    <Region>
        <Name>Андрушівський район</Name>
        <Guid>UKR.27.1_1</Guid>
        <DataUrl>Андрушівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Баранівський район</Name>
        <Guid>UKR.27.2_1</Guid>
        <DataUrl>Баранівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бердичів</Name>
        <Guid>UKR.27.3_1</Guid>
        <DataUrl>Бердичів</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Бердичівський район</Name>
        <Guid>UKR.27.4_1</Guid>
        <DataUrl>Бердичівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Брусилівський район</Name>
        <Guid>UKR.27.5_1</Guid>
        <DataUrl>Брусилівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Черняхівський район</Name>
        <Guid>UKR.27.6_1</Guid>
        <DataUrl>Черняхівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Пулинський район</Name>
        <Guid>UKR.27.7_1</Guid>
        <DataUrl>Пулинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Чуднівський район</Name>
        <Guid>UKR.27.8_1</Guid>
        <DataUrl>Чуднівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ємільчинський район</Name>
        <Guid>UKR.27.9_1</Guid>
        <DataUrl>Ємільчинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коростень</Name>
        <Guid>UKR.27.10_1</Guid>
        <DataUrl>Коростень</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коростенський район</Name>
        <Guid>UKR.27.11_1</Guid>
        <DataUrl>Коростенський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Коростишівський район</Name>
        <Guid>UKR.27.12_1</Guid>
        <DataUrl>Коростишівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Любарський район</Name>
        <Guid>UKR.27.13_1</Guid>
        <DataUrl>Любарський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Лугинський район</Name>
        <Guid>UKR.27.14_1</Guid>
        <DataUrl>Лугинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Малинський район</Name>
        <Guid>UKR.27.15_1</Guid>
        <DataUrl>Малинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Народицький район</Name>
        <Guid>UKR.27.16_1</Guid>
        <DataUrl>Народицький район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоград-Волинський</Name>
        <Guid>UKR.27.17_1</Guid>
        <DataUrl>Новоград-Волинський</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Новоград-Волинський район</Name>
        <Guid>UKR.27.18_1</Guid>
        <DataUrl>Новоград-Волинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Олевський район</Name>
        <Guid>UKR.27.19_1</Guid>
        <DataUrl>Олевський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Овруцький район</Name>
        <Guid>UKR.27.20_1</Guid>
        <DataUrl>Овруцький район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Попільнянський район</Name>
        <Guid>UKR.27.21_1</Guid>
        <DataUrl>Попільнянський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Радомишльський район</Name>
        <Guid>UKR.27.22_1</Guid>
        <DataUrl>Радомишльський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Романівський район</Name>
        <Guid>UKR.27.23_1</Guid>
        <DataUrl>Романівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Ружинський район</Name>
        <Guid>UKR.27.24_1</Guid>
        <DataUrl>Ружинський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Хорошівський район</Name>
        <Guid>UKR.27.25_1</Guid>
        <DataUrl>Хорошівський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Житомир</Name>
        <Guid>UKR.27.26_1</Guid>
        <DataUrl>Житомир</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
    <Region>
        <Name>Житомирський район</Name>
        <Guid>UKR.27.27_1</Guid>
        <DataUrl>Житомирський район</DataUrl>
        <ParentRegion>UKR.27_1</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>UKR.1_1</Region>
        <Parameter>1</Parameter>
        <Value>1250925</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1_1</Region>
        <Parameter>2</Parameter>
        <Value>20900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2_1</Region>
        <Parameter>1</Parameter>
        <Value>1054626</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2_1</Region>
        <Parameter>2</Parameter>
        <Value>31865</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3_1</Region>
        <Parameter>1</Parameter>
        <Value>906600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3_1</Region>
        <Parameter>2</Parameter>
        <Value>8097</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4_1</Region>
        <Parameter>1</Parameter>
        <Value>1957801</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4_1</Region>
        <Parameter>2</Parameter>
        <Value>26081</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5_1</Region>
        <Parameter>1</Parameter>
        <Value>3230400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5_1</Region>
        <Parameter>2</Parameter>
        <Value>31914</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6_1</Region>
        <Parameter>1</Parameter>
        <Value>4320821</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6_1</Region>
        <Parameter>2</Parameter>
        <Value>26517</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7_1</Region>
        <Parameter>1</Parameter>
        <Value>1381798</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7_1</Region>
        <Parameter>2</Parameter>
        <Value>13928</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8_1</Region>
        <Parameter>1</Parameter>
        <Value>2696427</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8_1</Region>
        <Parameter>2</Parameter>
        <Value>31415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9_1</Region>
        <Parameter>1</Parameter>
        <Value>1055649</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9_1</Region>
        <Parameter>2</Parameter>
        <Value>28461</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10_1</Region>
        <Parameter>1</Parameter>
        <Value>1309687</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10_1</Region>
        <Parameter>2</Parameter>
        <Value>20629</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12_1</Region>
        <Parameter>1</Parameter>
        <Value>1732200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12_1</Region>
        <Parameter>2</Parameter>
        <Value>28131</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11_1</Region>
        <Parameter>1</Parameter>
        <Value>2934522</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11_1</Region>
        <Parameter>2</Parameter>
        <Value>847</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13_1</Region>
        <Parameter>1</Parameter>
        <Value>999600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13_1</Region>
        <Parameter>2</Parameter>
        <Value>24588</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14_1</Region>
        <Parameter>1</Parameter>
        <Value>2530326</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14_1</Region>
        <Parameter>2</Parameter>
        <Value>21833</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15_1</Region>
        <Parameter>1</Parameter>
        <Value>2166710</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15_1</Region>
        <Parameter>2</Parameter>
        <Value>26684</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16_1</Region>
        <Parameter>1</Parameter>
        <Value>1164878</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16_1</Region>
        <Parameter>2</Parameter>
        <Value>24598</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17_1</Region>
        <Parameter>1</Parameter>
        <Value>2395358</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17_1</Region>
        <Parameter>2</Parameter>
        <Value>33310</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18_1</Region>
        <Parameter>1</Parameter>
        <Value>1462412</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18_1</Region>
        <Parameter>2</Parameter>
        <Value>28748</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19_1</Region>
        <Parameter>1</Parameter>
        <Value>1159259</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19_1</Region>
        <Parameter>2</Parameter>
        <Value>20047</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20_1</Region>
        <Parameter>1</Parameter>
        <Value>436670</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1079</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21_1</Region>
        <Parameter>1</Parameter>
        <Value>1113300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21_1</Region>
        <Parameter>2</Parameter>
        <Value>23834</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22_1</Region>
        <Parameter>1</Parameter>
        <Value>1074923</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22_1</Region>
        <Parameter>2</Parameter>
        <Value>13823</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23_1</Region>
        <Parameter>1</Parameter>
        <Value>1259068</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23_1</Region>
        <Parameter>2</Parameter>
        <Value>12777</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24_1</Region>
        <Parameter>1</Parameter>
        <Value>1616511</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24_1</Region>
        <Parameter>2</Parameter>
        <Value>26513</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25_1</Region>
        <Parameter>1</Parameter>
        <Value>1043215</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25_1</Region>
        <Parameter>2</Parameter>
        <Value>20143</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26_1</Region>
        <Parameter>1</Parameter>
        <Value>1765926</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26_1</Region>
        <Parameter>2</Parameter>
        <Value>27180</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27_1</Region>
        <Parameter>1</Parameter>
        <Value>1233202</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27_1</Region>
        <Parameter>2</Parameter>
        <Value>29832</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.1_1</Region>
        <Parameter>1</Parameter>
        <Value>287408</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.1_1</Region>
        <Parameter>2</Parameter>
        <Value>69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.2_1</Region>
        <Parameter>1</Parameter>
        <Value>76646</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1617</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.3_1</Region>
        <Parameter>1</Parameter>
        <Value>42735</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1554</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.4_1</Region>
        <Parameter>1</Parameter>
        <Value>28819</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1216</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.5_1</Region>
        <Parameter>1</Parameter>
        <Value>37004</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1160</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.6_1</Region>
        <Parameter>1</Parameter>
        <Value>42384</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.6_1</Region>
        <Parameter>2</Parameter>
        <Value>883</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.7_1</Region>
        <Parameter>1</Parameter>
        <Value>29363</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.7_1</Region>
        <Parameter>2</Parameter>
        <Value>725</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.8_1</Region>
        <Parameter>1</Parameter>
        <Value>24780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.8_1</Region>
        <Parameter>2</Parameter>
        <Value>17</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.9_1</Region>
        <Parameter>1</Parameter>
        <Value>20240</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1281</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.10_1</Region>
        <Parameter>1</Parameter>
        <Value>24864</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.10_1</Region>
        <Parameter>2</Parameter>
        <Value>672</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.11_1</Region>
        <Parameter>1</Parameter>
        <Value>35645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.11_1</Region>
        <Parameter>2</Parameter>
        <Value>632</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.12_1</Region>
        <Parameter>1</Parameter>
        <Value>44800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.12_1</Region>
        <Parameter>2</Parameter>
        <Value>896</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.13_1</Region>
        <Parameter>1</Parameter>
        <Value>24618</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.13_1</Region>
        <Parameter>2</Parameter>
        <Value>746</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.14_1</Region>
        <Parameter>1</Parameter>
        <Value>28688</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.14_1</Region>
        <Parameter>2</Parameter>
        <Value>765</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.15_1</Region>
        <Parameter>1</Parameter>
        <Value>37316</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.15_1</Region>
        <Parameter>2</Parameter>
        <Value>719</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.16_1</Region>
        <Parameter>1</Parameter>
        <Value>45637</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1105</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.17_1</Region>
        <Parameter>1</Parameter>
        <Value>32252</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.17_1</Region>
        <Parameter>2</Parameter>
        <Value>934</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.18_1</Region>
        <Parameter>1</Parameter>
        <Value>34143</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.18_1</Region>
        <Parameter>2</Parameter>
        <Value>909.7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.19_1</Region>
        <Parameter>1</Parameter>
        <Value>83977</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.19_1</Region>
        <Parameter>2</Parameter>
        <Value>41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.20_1</Region>
        <Parameter>1</Parameter>
        <Value>44050</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1394</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.21_1</Region>
        <Parameter>1</Parameter>
        <Value>37114</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.21_1</Region>
        <Parameter>2</Parameter>
        <Value>964</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.22_1</Region>
        <Parameter>1</Parameter>
        <Value>42849</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1493</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.23_1</Region>
        <Parameter>1</Parameter>
        <Value>46561</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.1.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1010</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.1_1</Region>
        <Parameter>1</Parameter>
        <Value>47287</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1487</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.2_1</Region>
        <Parameter>1</Parameter>
        <Value>34858</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1417</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.3_1</Region>
        <Parameter>1</Parameter>
        <Value>34560</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.4_1</Region>
        <Parameter>1</Parameter>
        <Value>289377</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.4_1</Region>
        <Parameter>2</Parameter>
        <Value>79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.5_1</Region>
        <Parameter>1</Parameter>
        <Value>52978</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.5_1</Region>
        <Parameter>2</Parameter>
        <Value>2547</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.6_1</Region>
        <Parameter>1</Parameter>
        <Value>30224</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1566</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.7_1</Region>
        <Parameter>1</Parameter>
        <Value>33884</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1576</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.8_1</Region>
        <Parameter>1</Parameter>
        <Value>28480</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1424</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.9_1</Region>
        <Parameter>1</Parameter>
        <Value>25322</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1312</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.10_1</Region>
        <Parameter>1</Parameter>
        <Value>49476</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.10_1</Region>
        <Parameter>2</Parameter>
        <Value>2660</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.11_1</Region>
        <Parameter>1</Parameter>
        <Value>18502</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.11_1</Region>
        <Parameter>2</Parameter>
        <Value>944</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.12_1</Region>
        <Parameter>1</Parameter>
        <Value>38666</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1376</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.13_1</Region>
        <Parameter>1</Parameter>
        <Value>71078</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.13_1</Region>
        <Parameter>2</Parameter>
        <Value>50</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.14_1</Region>
        <Parameter>1</Parameter>
        <Value>29523</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1514</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.15_1</Region>
        <Parameter>1</Parameter>
        <Value>31077</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1151</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.16_1</Region>
        <Parameter>1</Parameter>
        <Value>28864</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1804</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.17_1</Region>
        <Parameter>1</Parameter>
        <Value>56270</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.17_1</Region>
        <Parameter>2</Parameter>
        <Value>42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.18_1</Region>
        <Parameter>1</Parameter>
        <Value>37620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.19_1</Region>
        <Parameter>1</Parameter>
        <Value>29891</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.19_1</Region>
        <Parameter>2</Parameter>
        <Value>2105</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.20_1</Region>
        <Parameter>1</Parameter>
        <Value>18963</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1470</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.21_1</Region>
        <Parameter>1</Parameter>
        <Value>25147</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1283</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.22_1</Region>
        <Parameter>1</Parameter>
        <Value>20244</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.22_1</Region>
        <Parameter>2</Parameter>
        <Value>916</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.23_1</Region>
        <Parameter>1</Parameter>
        <Value>12043</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.23_1</Region>
        <Parameter>2</Parameter>
        <Value>579</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.24_1</Region>
        <Parameter>1</Parameter>
        <Value>13989</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.24_1</Region>
        <Parameter>2</Parameter>
        <Value>633</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.25_1</Region>
        <Parameter>1</Parameter>
        <Value>17110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.2.25_1</Region>
        <Parameter>2</Parameter>
        <Value>590</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.1_1</Region>
        <Parameter>1</Parameter>
        <Value>265608</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.1_1</Region>
        <Parameter>2</Parameter>
        <Value>153</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.2_1</Region>
        <Parameter>1</Parameter>
        <Value>73088</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.2_1</Region>
        <Parameter>2</Parameter>
        <Value>673</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.3_1</Region>
        <Parameter>1</Parameter>
        <Value>42746</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.3_1</Region>
        <Parameter>2</Parameter>
        <Value>670</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.4_1</Region>
        <Parameter>1</Parameter>
        <Value>62578</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.4_1</Region>
        <Parameter>2</Parameter>
        <Value>716</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.5_1</Region>
        <Parameter>1</Parameter>
        <Value>70109</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.5_1</Region>
        <Parameter>2</Parameter>
        <Value>607</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.6_1</Region>
        <Parameter>1</Parameter>
        <Value>80368</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.6_1</Region>
        <Parameter>2</Parameter>
        <Value>738</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.7_1</Region>
        <Parameter>1</Parameter>
        <Value>25724</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.7_1</Region>
        <Parameter>2</Parameter>
        <Value>884</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.8_1</Region>
        <Parameter>1</Parameter>
        <Value>44551</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.8_1</Region>
        <Parameter>2</Parameter>
        <Value>661</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.9_1</Region>
        <Parameter>1</Parameter>
        <Value>97788</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1160</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.10_1</Region>
        <Parameter>1</Parameter>
        <Value>55535</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.10_1</Region>
        <Parameter>2</Parameter>
        <Value>903</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.11_1</Region>
        <Parameter>1</Parameter>
        <Value>49665</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.3.11_1</Region>
        <Parameter>2</Parameter>
        <Value>619</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.1_1</Region>
        <Parameter>1</Parameter>
        <Value>52215</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.1_1</Region>
        <Parameter>2</Parameter>
        <Value>600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.2_1</Region>
        <Parameter>1</Parameter>
        <Value>90573</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1589</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.3_1</Region>
        <Parameter>1</Parameter>
        <Value>64017</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1894</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.4_1</Region>
        <Parameter>1</Parameter>
        <Value>31840</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1509</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.5_1</Region>
        <Parameter>1</Parameter>
        <Value>36086</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.5_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.6_1</Region>
        <Parameter>1</Parameter>
        <Value>74409</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.6_1</Region>
        <Parameter>2</Parameter>
        <Value>2667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.7_1</Region>
        <Parameter>1</Parameter>
        <Value>105095</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.7_1</Region>
        <Parameter>2</Parameter>
        <Value>350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.8_1</Region>
        <Parameter>1</Parameter>
        <Value>140746</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.8_1</Region>
        <Parameter>2</Parameter>
        <Value>282</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.9_1</Region>
        <Parameter>1</Parameter>
        <Value>123800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.9_1</Region>
        <Parameter>2</Parameter>
        <Value>65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.10_1</Region>
        <Parameter>1</Parameter>
        <Value>158165</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.10_1</Region>
        <Parameter>2</Parameter>
        <Value>108</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.11_1</Region>
        <Parameter>1</Parameter>
        <Value>53877</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1208</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.12_1</Region>
        <Parameter>1</Parameter>
        <Value>90772</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1766</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.13_1</Region>
        <Parameter>1</Parameter>
        <Value>29544</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1231</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.14_1</Region>
        <Parameter>1</Parameter>
        <Value>63342</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.14_1</Region>
        <Parameter>2</Parameter>
        <Value>2919</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.15_1</Region>
        <Parameter>1</Parameter>
        <Value>50783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1212</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.16_1</Region>
        <Parameter>1</Parameter>
        <Value>35671</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1474</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.17_1</Region>
        <Parameter>1</Parameter>
        <Value>34345</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1231</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.18_1</Region>
        <Parameter>1</Parameter>
        <Value>23391</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.18_1</Region>
        <Parameter>2</Parameter>
        <Value>28</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.19_1</Region>
        <Parameter>1</Parameter>
        <Value>77641</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.19_1</Region>
        <Parameter>2</Parameter>
        <Value>2257</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.20_1</Region>
        <Parameter>1</Parameter>
        <Value>363341</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.20_1</Region>
        <Parameter>2</Parameter>
        <Value>107</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.21_1</Region>
        <Parameter>1</Parameter>
        <Value>156543</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1753</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.22_1</Region>
        <Parameter>1</Parameter>
        <Value>34236</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1080</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.23_1</Region>
        <Parameter>1</Parameter>
        <Value>30416</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.4.23_1</Region>
        <Parameter>2</Parameter>
        <Value>539</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.1_1</Region>
        <Parameter>1</Parameter>
        <Value>57684</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.2_1</Region>
        <Parameter>1</Parameter>
        <Value>235014</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.2_1</Region>
        <Parameter>2</Parameter>
        <Value>138</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.3_1</Region>
        <Parameter>1</Parameter>
        <Value>1000565</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.3_1</Region>
        <Parameter>2</Parameter>
        <Value>415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.4_1</Region>
        <Parameter>1</Parameter>
        <Value>83558</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1388</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.5_1</Region>
        <Parameter>1</Parameter>
        <Value>13860</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.5_1</Region>
        <Parameter>2</Parameter>
        <Value>900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.6_1</Region>
        <Parameter>1</Parameter>
        <Value>36543</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1684</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.7_1</Region>
        <Parameter>1</Parameter>
        <Value>44720</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1347</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.8_1</Region>
        <Parameter>1</Parameter>
        <Value>629760</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.8_1</Region>
        <Parameter>2</Parameter>
        <Value>410</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.9_1</Region>
        <Parameter>1</Parameter>
        <Value>35018</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1599</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.10_1</Region>
        <Parameter>1</Parameter>
        <Value>47804</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.10_1</Region>
        <Parameter>2</Parameter>
        <Value>37</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.11_1</Region>
        <Parameter>1</Parameter>
        <Value>25000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.12_1</Region>
        <Parameter>1</Parameter>
        <Value>112100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.12_1</Region>
        <Parameter>2</Parameter>
        <Value>50</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.13_1</Region>
        <Parameter>1</Parameter>
        <Value>42552</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1943</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.14_1</Region>
        <Parameter>1</Parameter>
        <Value>71424</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.14_1</Region>
        <Parameter>2</Parameter>
        <Value>36</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.15_1</Region>
        <Parameter>1</Parameter>
        <Value>74688</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1997</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.16_1</Region>
        <Parameter>1</Parameter>
        <Value>40846</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.16_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.17_1</Region>
        <Parameter>1</Parameter>
        <Value>105669</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.17_1</Region>
        <Parameter>2</Parameter>
        <Value>59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.18_1</Region>
        <Parameter>1</Parameter>
        <Value>28855</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.19_1</Region>
        <Parameter>1</Parameter>
        <Value>28579</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1248</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.20_1</Region>
        <Parameter>1</Parameter>
        <Value>25637</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.20_1</Region>
        <Parameter>2</Parameter>
        <Value>928</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.21_1</Region>
        <Parameter>1</Parameter>
        <Value>44737</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1683</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.22_1</Region>
        <Parameter>1</Parameter>
        <Value>36542</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1210</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.23_1</Region>
        <Parameter>1</Parameter>
        <Value>28043</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1214</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.24_1</Region>
        <Parameter>1</Parameter>
        <Value>23305</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.24_1</Region>
        <Parameter>2</Parameter>
        <Value>1379</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.25_1</Region>
        <Parameter>1</Parameter>
        <Value>39626</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.25_1</Region>
        <Parameter>2</Parameter>
        <Value>1738</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.26_1</Region>
        <Parameter>1</Parameter>
        <Value>31441</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.26_1</Region>
        <Parameter>2</Parameter>
        <Value>23</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.27_1</Region>
        <Parameter>1</Parameter>
        <Value>39222</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1648</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.28_1</Region>
        <Parameter>1</Parameter>
        <Value>26040</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.28_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.29_1</Region>
        <Parameter>1</Parameter>
        <Value>27810</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.29_1</Region>
        <Parameter>2</Parameter>
        <Value>900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.30_1</Region>
        <Parameter>1</Parameter>
        <Value>33915</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.30_1</Region>
        <Parameter>2</Parameter>
        <Value>1330</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.31_1</Region>
        <Parameter>1</Parameter>
        <Value>54398</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.31_1</Region>
        <Parameter>2</Parameter>
        <Value>1286</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.32_1</Region>
        <Parameter>1</Parameter>
        <Value>46167</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.5.32_1</Region>
        <Parameter>2</Parameter>
        <Value>33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.1_1</Region>
        <Parameter>1</Parameter>
        <Value>44378</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1455</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.2_1</Region>
        <Parameter>1</Parameter>
        <Value>74706</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.2_1</Region>
        <Parameter>2</Parameter>
        <Value>41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.3_1</Region>
        <Parameter>1</Parameter>
        <Value>108537</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1921</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.4_1</Region>
        <Parameter>1</Parameter>
        <Value>27926</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.4_1</Region>
        <Parameter>2</Parameter>
        <Value>11</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.5_1</Region>
        <Parameter>1</Parameter>
        <Value>15675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.5_1</Region>
        <Parameter>2</Parameter>
        <Value>950</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.6_1</Region>
        <Parameter>1</Parameter>
        <Value>918986</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.6_1</Region>
        <Parameter>2</Parameter>
        <Value>358</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.7_1</Region>
        <Parameter>1</Parameter>
        <Value>32783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.7_1</Region>
        <Parameter>2</Parameter>
        <Value>21</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.8_1</Region>
        <Parameter>1</Parameter>
        <Value>245604</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.8_1</Region>
        <Parameter>2</Parameter>
        <Value>422</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.9_1</Region>
        <Parameter>1</Parameter>
        <Value>35165</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.9_1</Region>
        <Parameter>2</Parameter>
        <Value>19</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.10_1</Region>
        <Parameter>1</Parameter>
        <Value>26859</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.10_1</Region>
        <Parameter>2</Parameter>
        <Value>809</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.11_1</Region>
        <Parameter>1</Parameter>
        <Value>78414</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.11_1</Region>
        <Parameter>2</Parameter>
        <Value>42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.12_1</Region>
        <Parameter>1</Parameter>
        <Value>56962</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.12_1</Region>
        <Parameter>2</Parameter>
        <Value>19</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.13_1</Region>
        <Parameter>1</Parameter>
        <Value>26888</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.13_1</Region>
        <Parameter>2</Parameter>
        <Value>7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.14_1</Region>
        <Parameter>1</Parameter>
        <Value>72844</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.14_1</Region>
        <Parameter>2</Parameter>
        <Value>66</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.15_1</Region>
        <Parameter>1</Parameter>
        <Value>18166</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1172</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.16_1</Region>
        <Parameter>1</Parameter>
        <Value>154847</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.16_1</Region>
        <Parameter>2</Parameter>
        <Value>77</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.17_1</Region>
        <Parameter>1</Parameter>
        <Value>63437</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.17_1</Region>
        <Parameter>2</Parameter>
        <Value>29.57</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.18_1</Region>
        <Parameter>1</Parameter>
        <Value>30653</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1315</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.19_1</Region>
        <Parameter>1</Parameter>
        <Value>21518</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.19_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.20_1</Region>
        <Parameter>1</Parameter>
        <Value>22192</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1018</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.21_1</Region>
        <Parameter>1</Parameter>
        <Value>344634</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.21_1</Region>
        <Parameter>2</Parameter>
        <Value>426</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.22_1</Region>
        <Parameter>1</Parameter>
        <Value>81810</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.23_1</Region>
        <Parameter>1</Parameter>
        <Value>442200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.23_1</Region>
        <Parameter>2</Parameter>
        <Value>134</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.31_1</Region>
        <Parameter>1</Parameter>
        <Value>27618</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.31_1</Region>
        <Parameter>2</Parameter>
        <Value>870.94</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.32_1</Region>
        <Parameter>1</Parameter>
        <Value>14931</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.32_1</Region>
        <Parameter>2</Parameter>
        <Value>6</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.33_1</Region>
        <Parameter>1</Parameter>
        <Value>18584</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.33_1</Region>
        <Parameter>2</Parameter>
        <Value>1010</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.34_1</Region>
        <Parameter>1</Parameter>
        <Value>26532</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.34_1</Region>
        <Parameter>2</Parameter>
        <Value>792</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.35_1</Region>
        <Parameter>1</Parameter>
        <Value>21577</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.35_1</Region>
        <Parameter>2</Parameter>
        <Value>10</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.36_1</Region>
        <Parameter>1</Parameter>
        <Value>47749</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.36_1</Region>
        <Parameter>2</Parameter>
        <Value>19</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.37_1</Region>
        <Parameter>1</Parameter>
        <Value>19140</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.37_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.38_1</Region>
        <Parameter>1</Parameter>
        <Value>110040</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.38_1</Region>
        <Parameter>2</Parameter>
        <Value>60</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.39_1</Region>
        <Parameter>1</Parameter>
        <Value>47902</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.39_1</Region>
        <Parameter>2</Parameter>
        <Value>1274</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.40_1</Region>
        <Parameter>1</Parameter>
        <Value>45009</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.40_1</Region>
        <Parameter>2</Parameter>
        <Value>18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.41_1</Region>
        <Parameter>1</Parameter>
        <Value>49870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.41_1</Region>
        <Parameter>2</Parameter>
        <Value>1282</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.42_1</Region>
        <Parameter>1</Parameter>
        <Value>14129</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.42_1</Region>
        <Parameter>2</Parameter>
        <Value>812</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.43_1</Region>
        <Parameter>1</Parameter>
        <Value>55178</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.43_1</Region>
        <Parameter>2</Parameter>
        <Value>83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.44_1</Region>
        <Parameter>1</Parameter>
        <Value>38950</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.44_1</Region>
        <Parameter>2</Parameter>
        <Value>1900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.45_1</Region>
        <Parameter>1</Parameter>
        <Value>99666</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.45_1</Region>
        <Parameter>2</Parameter>
        <Value>2549</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.46_1</Region>
        <Parameter>1</Parameter>
        <Value>28449</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.46_1</Region>
        <Parameter>2</Parameter>
        <Value>1221</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.47_1</Region>
        <Parameter>1</Parameter>
        <Value>14329</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.47_1</Region>
        <Parameter>2</Parameter>
        <Value>5</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.48_1</Region>
        <Parameter>1</Parameter>
        <Value>12198</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.6.48_1</Region>
        <Parameter>2</Parameter>
        <Value>2</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.1_1</Region>
        <Parameter>1</Parameter>
        <Value>69673</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.1_1</Region>
        <Parameter>2</Parameter>
        <Value>799</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.2_1</Region>
        <Parameter>1</Parameter>
        <Value>69744</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1248</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.3_1</Region>
        <Parameter>1</Parameter>
        <Value>44184</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.3_1</Region>
        <Parameter>2</Parameter>
        <Value>723</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.4_1</Region>
        <Parameter>1</Parameter>
        <Value>55726</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.4_1</Region>
        <Parameter>2</Parameter>
        <Value>747</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.5_1</Region>
        <Parameter>1</Parameter>
        <Value>8198</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.5_1</Region>
        <Parameter>2</Parameter>
        <Value>114</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.6_1</Region>
        <Parameter>1</Parameter>
        <Value>233313</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.6_1</Region>
        <Parameter>2</Parameter>
        <Value>83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.7_1</Region>
        <Parameter>1</Parameter>
        <Value>60495</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.7_1</Region>
        <Parameter>2</Parameter>
        <Value>647</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.8_1</Region>
        <Parameter>1</Parameter>
        <Value>100800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.9_1</Region>
        <Parameter>1</Parameter>
        <Value>88346</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.9_1</Region>
        <Parameter>2</Parameter>
        <Value>986</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.10_1</Region>
        <Parameter>1</Parameter>
        <Value>114043</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1293</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.11_1</Region>
        <Parameter>1</Parameter>
        <Value>43766</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.11_1</Region>
        <Parameter>2</Parameter>
        <Value>815</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.12_1</Region>
        <Parameter>1</Parameter>
        <Value>73580</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.13_1</Region>
        <Parameter>1</Parameter>
        <Value>66120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.13_1</Region>
        <Parameter>2</Parameter>
        <Value>600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.14_1</Region>
        <Parameter>1</Parameter>
        <Value>49108</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.14_1</Region>
        <Parameter>2</Parameter>
        <Value>683</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.15_1</Region>
        <Parameter>1</Parameter>
        <Value>83480</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.15_1</Region>
        <Parameter>2</Parameter>
        <Value>731</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.16_1</Region>
        <Parameter>1</Parameter>
        <Value>29736</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.7.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.1_1</Region>
        <Parameter>1</Parameter>
        <Value>84008</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1986</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.2_1</Region>
        <Parameter>1</Parameter>
        <Value>21824</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1364</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.3_1</Region>
        <Parameter>1</Parameter>
        <Value>20424</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.4_1</Region>
        <Parameter>1</Parameter>
        <Value>40136</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1160</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.5_1</Region>
        <Parameter>1</Parameter>
        <Value>17500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.5_1</Region>
        <Parameter>2</Parameter>
        <Value>875</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.6_1</Region>
        <Parameter>1</Parameter>
        <Value>30336</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.6_1</Region>
        <Parameter>2</Parameter>
        <Value>12</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.7_1</Region>
        <Parameter>1</Parameter>
        <Value>46838</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1148</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.8_1</Region>
        <Parameter>1</Parameter>
        <Value>94860</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.8_1</Region>
        <Parameter>2</Parameter>
        <Value>900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.9_1</Region>
        <Parameter>1</Parameter>
        <Value>18570</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1112</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.10_1</Region>
        <Parameter>2</Parameter>
        <Value>43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.11_1</Region>
        <Parameter>1</Parameter>
        <Value>18325</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1553</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.12_1</Region>
        <Parameter>1</Parameter>
        <Value>21583</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.12_1</Region>
        <Parameter>2</Parameter>
        <Value>782</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.13_1</Region>
        <Parameter>1</Parameter>
        <Value>1445150</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.13_1</Region>
        <Parameter>2</Parameter>
        <Value>350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.14_1</Region>
        <Parameter>1</Parameter>
        <Value>183092</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1403</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.15_1</Region>
        <Parameter>1</Parameter>
        <Value>44621</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.15_1</Region>
        <Parameter>2</Parameter>
        <Value>985</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.16_1</Region>
        <Parameter>1</Parameter>
        <Value>29120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1040</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.17_1</Region>
        <Parameter>1</Parameter>
        <Value>31799</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.17_1</Region>
        <Parameter>2</Parameter>
        <Value>33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.18_1</Region>
        <Parameter>1</Parameter>
        <Value>25728</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1280</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.19_1</Region>
        <Parameter>1</Parameter>
        <Value>64672</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.19_1</Region>
        <Parameter>2</Parameter>
        <Value>19</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.20_1</Region>
        <Parameter>1</Parameter>
        <Value>29042</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1403</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.22_1</Region>
        <Parameter>1</Parameter>
        <Value>33084</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1182.74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.23_1</Region>
        <Parameter>1</Parameter>
        <Value>10414</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.23_1</Region>
        <Parameter>2</Parameter>
        <Value>467</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.24_1</Region>
        <Parameter>1</Parameter>
        <Value>16660</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.24_1</Region>
        <Parameter>2</Parameter>
        <Value>1225</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.25_1</Region>
        <Parameter>1</Parameter>
        <Value>21276</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.25_1</Region>
        <Parameter>2</Parameter>
        <Value>1169</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.26_1</Region>
        <Parameter>1</Parameter>
        <Value>20419</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.26_1</Region>
        <Parameter>2</Parameter>
        <Value>977</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.27_1</Region>
        <Parameter>1</Parameter>
        <Value>32320</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1010</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.28_1</Region>
        <Parameter>1</Parameter>
        <Value>23424</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.28_1</Region>
        <Parameter>2</Parameter>
        <Value>1220</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.29_1</Region>
        <Parameter>1</Parameter>
        <Value>48333</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.29_1</Region>
        <Parameter>2</Parameter>
        <Value>1888</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.30_1</Region>
        <Parameter>1</Parameter>
        <Value>15305</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.30_1</Region>
        <Parameter>2</Parameter>
        <Value>793</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.31_1</Region>
        <Parameter>1</Parameter>
        <Value>72838</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.31_1</Region>
        <Parameter>2</Parameter>
        <Value>1364</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.32_1</Region>
        <Parameter>1</Parameter>
        <Value>27201</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.8.32_1</Region>
        <Parameter>2</Parameter>
        <Value>968</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.1_1</Region>
        <Parameter>1</Parameter>
        <Value>49049</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1721</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.2_1</Region>
        <Parameter>1</Parameter>
        <Value>67150</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.3_1</Region>
        <Parameter>1</Parameter>
        <Value>35870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.4_1</Region>
        <Parameter>1</Parameter>
        <Value>61200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.4_1</Region>
        <Parameter>2</Parameter>
        <Value>3000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.5_1</Region>
        <Parameter>1</Parameter>
        <Value>61093</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.5_1</Region>
        <Parameter>2</Parameter>
        <Value>3413</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.6_1</Region>
        <Parameter>1</Parameter>
        <Value>20055</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1018</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.7_1</Region>
        <Parameter>1</Parameter>
        <Value>13970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.8_1</Region>
        <Parameter>1</Parameter>
        <Value>36250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.9_1</Region>
        <Parameter>1</Parameter>
        <Value>22143</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.9_1</Region>
        <Parameter>2</Parameter>
        <Value>915</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.10_1</Region>
        <Parameter>1</Parameter>
        <Value>291450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.10_1</Region>
        <Parameter>2</Parameter>
        <Value>145</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.11_1</Region>
        <Parameter>1</Parameter>
        <Value>4642</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.11_1</Region>
        <Parameter>2</Parameter>
        <Value>22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.12_1</Region>
        <Parameter>1</Parameter>
        <Value>36998</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.12_1</Region>
        <Parameter>2</Parameter>
        <Value>2298</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.13_1</Region>
        <Parameter>1</Parameter>
        <Value>22000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.14_1</Region>
        <Parameter>1</Parameter>
        <Value>15972</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1210</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.15_1</Region>
        <Parameter>1</Parameter>
        <Value>48630</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.16_1</Region>
        <Parameter>1</Parameter>
        <Value>72360</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.17_1</Region>
        <Parameter>1</Parameter>
        <Value>17442</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1140</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.18_1</Region>
        <Parameter>1</Parameter>
        <Value>26659</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1541</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.19_1</Region>
        <Parameter>1</Parameter>
        <Value>12500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.20_1</Region>
        <Parameter>1</Parameter>
        <Value>15352</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.9.20_1</Region>
        <Parameter>2</Parameter>
        <Value>701</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.1_1</Region>
        <Parameter>1</Parameter>
        <Value>26248</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.1_1</Region>
        <Parameter>2</Parameter>
        <Value>776</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.2_1</Region>
        <Parameter>1</Parameter>
        <Value>39994</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.2_1</Region>
        <Parameter>2</Parameter>
        <Value>928</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.3_1</Region>
        <Parameter>1</Parameter>
        <Value>31327</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.3_1</Region>
        <Parameter>2</Parameter>
        <Value>915</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.4_1</Region>
        <Parameter>1</Parameter>
        <Value>61141</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1180</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.5_1</Region>
        <Parameter>1</Parameter>
        <Value>46938</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.6_1</Region>
        <Parameter>1</Parameter>
        <Value>28949</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.6_1</Region>
        <Parameter>2</Parameter>
        <Value>898</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.7_1</Region>
        <Parameter>1</Parameter>
        <Value>43298</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.8_1</Region>
        <Parameter>1</Parameter>
        <Value>100462</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.8_1</Region>
        <Parameter>2</Parameter>
        <Value>27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.9_1</Region>
        <Parameter>1</Parameter>
        <Value>64673</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1540</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.10_1</Region>
        <Parameter>1</Parameter>
        <Value>268398</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.10_1</Region>
        <Parameter>2</Parameter>
        <Value>93</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.11_1</Region>
        <Parameter>1</Parameter>
        <Value>53392</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1220</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.12_1</Region>
        <Parameter>1</Parameter>
        <Value>50786</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1180</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.13_1</Region>
        <Parameter>1</Parameter>
        <Value>27309</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.13_1</Region>
        <Parameter>2</Parameter>
        <Value>951</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.14_1</Region>
        <Parameter>1</Parameter>
        <Value>27890</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.14_1</Region>
        <Parameter>2</Parameter>
        <Value>853</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.15_1</Region>
        <Parameter>1</Parameter>
        <Value>43626</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.15_1</Region>
        <Parameter>2</Parameter>
        <Value>866</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.16_1</Region>
        <Parameter>1</Parameter>
        <Value>42493</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.16_1</Region>
        <Parameter>2</Parameter>
        <Value>40</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.17_1</Region>
        <Parameter>1</Parameter>
        <Value>32803</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1160</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.18_1</Region>
        <Parameter>1</Parameter>
        <Value>28710</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1162</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.19_1</Region>
        <Parameter>1</Parameter>
        <Value>28077</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1210</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.20_1</Region>
        <Parameter>1</Parameter>
        <Value>19851</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.20_1</Region>
        <Parameter>2</Parameter>
        <Value>662</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.21_1</Region>
        <Parameter>1</Parameter>
        <Value>26367</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.21_1</Region>
        <Parameter>2</Parameter>
        <Value>716</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.22_1</Region>
        <Parameter>1</Parameter>
        <Value>23695</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.22_1</Region>
        <Parameter>2</Parameter>
        <Value>653</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.23_1</Region>
        <Parameter>1</Parameter>
        <Value>50350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.10.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1103</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.1_1</Region>
        <Parameter>1</Parameter>
        <Value>36940</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.1_1</Region>
        <Parameter>2</Parameter>
        <Value>957</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.2_1</Region>
        <Parameter>1</Parameter>
        <Value>206695</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.2_1</Region>
        <Parameter>2</Parameter>
        <Value>67</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.3_1</Region>
        <Parameter>1</Parameter>
        <Value>49381</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1276</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.4_1</Region>
        <Parameter>1</Parameter>
        <Value>36207</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.4_1</Region>
        <Parameter>2</Parameter>
        <Value>772</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.5_1</Region>
        <Parameter>1</Parameter>
        <Value>57067</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.5_1</Region>
        <Parameter>2</Parameter>
        <Value>934</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.6_1</Region>
        <Parameter>1</Parameter>
        <Value>61613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.6_1</Region>
        <Parameter>2</Parameter>
        <Value>37</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.7_1</Region>
        <Parameter>1</Parameter>
        <Value>102850</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.7_1</Region>
        <Parameter>2</Parameter>
        <Value>34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.8_1</Region>
        <Parameter>1</Parameter>
        <Value>68526</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1198</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.9_1</Region>
        <Parameter>1</Parameter>
        <Value>46870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.9_1</Region>
        <Parameter>2</Parameter>
        <Value>43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.10_1</Region>
        <Parameter>1</Parameter>
        <Value>31450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.10_1</Region>
        <Parameter>2</Parameter>
        <Value>896</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.11_1</Region>
        <Parameter>1</Parameter>
        <Value>34337</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.11_1</Region>
        <Parameter>2</Parameter>
        <Value>793</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.12_1</Region>
        <Parameter>1</Parameter>
        <Value>50050</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.12_1</Region>
        <Parameter>2</Parameter>
        <Value>110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.13_1</Region>
        <Parameter>1</Parameter>
        <Value>31061</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.13_1</Region>
        <Parameter>2</Parameter>
        <Value>3616</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.14_1</Region>
        <Parameter>1</Parameter>
        <Value>34540</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.14_1</Region>
        <Parameter>2</Parameter>
        <Value>926</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.15_1</Region>
        <Parameter>1</Parameter>
        <Value>156380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.15_1</Region>
        <Parameter>2</Parameter>
        <Value>726</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.16_1</Region>
        <Parameter>1</Parameter>
        <Value>36400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.17_1</Region>
        <Parameter>1</Parameter>
        <Value>35256</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.17_1</Region>
        <Parameter>2</Parameter>
        <Value>904</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.18_1</Region>
        <Parameter>1</Parameter>
        <Value>35558</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.18_1</Region>
        <Parameter>2</Parameter>
        <Value>773</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.19_1</Region>
        <Parameter>1</Parameter>
        <Value>27548</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.19_1</Region>
        <Parameter>2</Parameter>
        <Value>32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.20_1</Region>
        <Parameter>1</Parameter>
        <Value>29827</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.20_1</Region>
        <Parameter>2</Parameter>
        <Value>956</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.21_1</Region>
        <Parameter>1</Parameter>
        <Value>5925</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1288</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.22_1</Region>
        <Parameter>1</Parameter>
        <Value>28687</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.22_1</Region>
        <Parameter>2</Parameter>
        <Value>661</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.23_1</Region>
        <Parameter>1</Parameter>
        <Value>38808</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.23_1</Region>
        <Parameter>2</Parameter>
        <Value>980</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.24_1</Region>
        <Parameter>1</Parameter>
        <Value>23657</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.24_1</Region>
        <Parameter>2</Parameter>
        <Value>674</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.25_1</Region>
        <Parameter>1</Parameter>
        <Value>30244</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.25_1</Region>
        <Parameter>2</Parameter>
        <Value>758</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.26_1</Region>
        <Parameter>1</Parameter>
        <Value>32584</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.26_1</Region>
        <Parameter>2</Parameter>
        <Value>756</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.27_1</Region>
        <Parameter>1</Parameter>
        <Value>57898</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1184</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.28_1</Region>
        <Parameter>1</Parameter>
        <Value>18432</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.28_1</Region>
        <Parameter>2</Parameter>
        <Value>649</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.29_1</Region>
        <Parameter>1</Parameter>
        <Value>71694</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.29_1</Region>
        <Parameter>2</Parameter>
        <Value>2031</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.30_1</Region>
        <Parameter>1</Parameter>
        <Value>17778</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.12.30_1</Region>
        <Parameter>2</Parameter>
        <Value>763</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.1_1</Region>
        <Parameter>1</Parameter>
        <Value>332320</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.1_1</Region>
        <Parameter>2</Parameter>
        <Value>134</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.2_1</Region>
        <Parameter>1</Parameter>
        <Value>368372</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.2_1</Region>
        <Parameter>2</Parameter>
        <Value>148</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.3_1</Region>
        <Parameter>1</Parameter>
        <Value>349404</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.3_1</Region>
        <Parameter>2</Parameter>
        <Value>66</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.4_1</Region>
        <Parameter>1</Parameter>
        <Value>250380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.4_1</Region>
        <Parameter>2</Parameter>
        <Value>156</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.5_1</Region>
        <Parameter>1</Parameter>
        <Value>320430</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.5_1</Region>
        <Parameter>2</Parameter>
        <Value>110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.6_1</Region>
        <Parameter>1</Parameter>
        <Value>151977</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.6_1</Region>
        <Parameter>2</Parameter>
        <Value>27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.7_1</Region>
        <Parameter>1</Parameter>
        <Value>198123</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.7_1</Region>
        <Parameter>2</Parameter>
        <Value>34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.8_1</Region>
        <Parameter>1</Parameter>
        <Value>227730</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.8_1</Region>
        <Parameter>2</Parameter>
        <Value>27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.9_1</Region>
        <Parameter>1</Parameter>
        <Value>364800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.9_1</Region>
        <Parameter>2</Parameter>
        <Value>40</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.10_1</Region>
        <Parameter>1</Parameter>
        <Value>371030</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.11.10_1</Region>
        <Parameter>2</Parameter>
        <Value>110</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.1_1</Region>
        <Parameter>1</Parameter>
        <Value>26629</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.2_1</Region>
        <Parameter>1</Parameter>
        <Value>35408</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1297</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.3_1</Region>
        <Parameter>1</Parameter>
        <Value>35520</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.4_1</Region>
        <Parameter>1</Parameter>
        <Value>39550</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.4_1</Region>
        <Parameter>2</Parameter>
        <Value>700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.5_1</Region>
        <Parameter>1</Parameter>
        <Value>32438</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.5_1</Region>
        <Parameter>2</Parameter>
        <Value>992</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.6_1</Region>
        <Parameter>1</Parameter>
        <Value>37440</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.7_1</Region>
        <Parameter>1</Parameter>
        <Value>15762</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.7_1</Region>
        <Parameter>2</Parameter>
        <Value>967</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.8_1</Region>
        <Parameter>1</Parameter>
        <Value>43551</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1111</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.9_1</Region>
        <Parameter>1</Parameter>
        <Value>16052</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.9_1</Region>
        <Parameter>2</Parameter>
        <Value>997</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.10_1</Region>
        <Parameter>1</Parameter>
        <Value>25680</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.11_1</Region>
        <Parameter>1</Parameter>
        <Value>29825</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1032</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.12_1</Region>
        <Parameter>1</Parameter>
        <Value>41867</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1668</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.13_1</Region>
        <Parameter>1</Parameter>
        <Value>37080</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1854</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.14_1</Region>
        <Parameter>1</Parameter>
        <Value>27468</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1159</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.15_1</Region>
        <Parameter>1</Parameter>
        <Value>19025</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.15_1</Region>
        <Parameter>2</Parameter>
        <Value>889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.16_1</Region>
        <Parameter>1</Parameter>
        <Value>25334</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1195</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.17_1</Region>
        <Parameter>1</Parameter>
        <Value>13165</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1219</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.18_1</Region>
        <Parameter>1</Parameter>
        <Value>23834</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.18_1</Region>
        <Parameter>2</Parameter>
        <Value>701</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.19_1</Region>
        <Parameter>1</Parameter>
        <Value>13659</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.19_1</Region>
        <Parameter>2</Parameter>
        <Value>942</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.20_1</Region>
        <Parameter>1</Parameter>
        <Value>13352</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.20_1</Region>
        <Parameter>2</Parameter>
        <Value>645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.21_1</Region>
        <Parameter>1</Parameter>
        <Value>24145</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.13.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1334</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.1_1</Region>
        <Parameter>1</Parameter>
        <Value>60280</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1157</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.2_1</Region>
        <Parameter>1</Parameter>
        <Value>46395</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.2_1</Region>
        <Parameter>2</Parameter>
        <Value>856</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.3_1</Region>
        <Parameter>1</Parameter>
        <Value>67223</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.3_1</Region>
        <Parameter>2</Parameter>
        <Value>21</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.4_1</Region>
        <Parameter>1</Parameter>
        <Value>76702</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.4_1</Region>
        <Parameter>2</Parameter>
        <Value>44</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.5_1</Region>
        <Parameter>1</Parameter>
        <Value>74480</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1217</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.6_1</Region>
        <Parameter>1</Parameter>
        <Value>69356</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.6_1</Region>
        <Parameter>2</Parameter>
        <Value>727</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.7_1</Region>
        <Parameter>1</Parameter>
        <Value>123530</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1548</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.8_1</Region>
        <Parameter>1</Parameter>
        <Value>57395</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.8_1</Region>
        <Parameter>2</Parameter>
        <Value>867</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.9_1</Region>
        <Parameter>1</Parameter>
        <Value>726726</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.9_1</Region>
        <Parameter>2</Parameter>
        <Value>182</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.10_1</Region>
        <Parameter>1</Parameter>
        <Value>57376</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.10_1</Region>
        <Parameter>2</Parameter>
        <Value>845</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.11_1</Region>
        <Parameter>1</Parameter>
        <Value>63315</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.11_1</Region>
        <Parameter>2</Parameter>
        <Value>675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.12_1</Region>
        <Parameter>1</Parameter>
        <Value>40117</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.12_1</Region>
        <Parameter>2</Parameter>
        <Value>918</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.13_1</Region>
        <Parameter>1</Parameter>
        <Value>112645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.13_1</Region>
        <Parameter>2</Parameter>
        <Value>953</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.14_1</Region>
        <Parameter>1</Parameter>
        <Value>48620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1144</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.15_1</Region>
        <Parameter>1</Parameter>
        <Value>34969</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.15_1</Region>
        <Parameter>2</Parameter>
        <Value>24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.16_1</Region>
        <Parameter>1</Parameter>
        <Value>69583</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.16_1</Region>
        <Parameter>2</Parameter>
        <Value>934</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.17_1</Region>
        <Parameter>1</Parameter>
        <Value>47366</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1471</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.18_1</Region>
        <Parameter>1</Parameter>
        <Value>93594</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1573</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.19_1</Region>
        <Parameter>1</Parameter>
        <Value>78186</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1245</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.20_1</Region>
        <Parameter>1</Parameter>
        <Value>56288</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.20_1</Region>
        <Parameter>2</Parameter>
        <Value>16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.21_1</Region>
        <Parameter>1</Parameter>
        <Value>62054</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.21_1</Region>
        <Parameter>2</Parameter>
        <Value>808</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.22_1</Region>
        <Parameter>1</Parameter>
        <Value>50345</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1193</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.23_1</Region>
        <Parameter>1</Parameter>
        <Value>109039</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1295</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.24_1</Region>
        <Parameter>1</Parameter>
        <Value>71314</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.24_1</Region>
        <Parameter>2</Parameter>
        <Value>996</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.25_1</Region>
        <Parameter>1</Parameter>
        <Value>69989</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.14.25_1</Region>
        <Parameter>2</Parameter>
        <Value>1097</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.1_1</Region>
        <Parameter>1</Parameter>
        <Value>108000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.1_1</Region>
        <Parameter>2</Parameter>
        <Value>50</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.2_1</Region>
        <Parameter>1</Parameter>
        <Value>53375</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.2_1</Region>
        <Parameter>2</Parameter>
        <Value>61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.3_1</Region>
        <Parameter>1</Parameter>
        <Value>31450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.4_1</Region>
        <Parameter>1</Parameter>
        <Value>19960</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1436</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.5_1</Region>
        <Parameter>1</Parameter>
        <Value>24434</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1597</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.6_1</Region>
        <Parameter>1</Parameter>
        <Value>45675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.6_1</Region>
        <Parameter>2</Parameter>
        <Value>63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.7_1</Region>
        <Parameter>1</Parameter>
        <Value>26928</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.7_1</Region>
        <Parameter>2</Parameter>
        <Value>34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.8_1</Region>
        <Parameter>1</Parameter>
        <Value>43505</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.8_1</Region>
        <Parameter>2</Parameter>
        <Value>77</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.9_1</Region>
        <Parameter>1</Parameter>
        <Value>29250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.10_1</Region>
        <Parameter>1</Parameter>
        <Value>80648</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.10_1</Region>
        <Parameter>2</Parameter>
        <Value>153.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.11_1</Region>
        <Parameter>1</Parameter>
        <Value>42465</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1627</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.12_1</Region>
        <Parameter>1</Parameter>
        <Value>406406</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.12_1</Region>
        <Parameter>2</Parameter>
        <Value>286</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.13_1</Region>
        <Parameter>1</Parameter>
        <Value>68071</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1057</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.14_1</Region>
        <Parameter>1</Parameter>
        <Value>97565</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.14_1</Region>
        <Parameter>2</Parameter>
        <Value>95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.15_1</Region>
        <Parameter>1</Parameter>
        <Value>15974</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1166</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.16_1</Region>
        <Parameter>1</Parameter>
        <Value>15730</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.16_1</Region>
        <Parameter>2</Parameter>
        <Value>971</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.18_1</Region>
        <Parameter>1</Parameter>
        <Value>41418</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1835.88</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.19_1</Region>
        <Parameter>1</Parameter>
        <Value>35381</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1623</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.20_1</Region>
        <Parameter>1</Parameter>
        <Value>69745</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.20_1</Region>
        <Parameter>2</Parameter>
        <Value>722</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.21_1</Region>
        <Parameter>1</Parameter>
        <Value>40022</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1466</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.22_1</Region>
        <Parameter>1</Parameter>
        <Value>45234</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.22_1</Region>
        <Parameter>2</Parameter>
        <Value>21</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.23_1</Region>
        <Parameter>1</Parameter>
        <Value>56463</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.23_1</Region>
        <Parameter>2</Parameter>
        <Value>33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.24_1</Region>
        <Parameter>1</Parameter>
        <Value>104244</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.24_1</Region>
        <Parameter>2</Parameter>
        <Value>42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.25_1</Region>
        <Parameter>1</Parameter>
        <Value>35654</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.25_1</Region>
        <Parameter>2</Parameter>
        <Value>546</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.26_1</Region>
        <Parameter>1</Parameter>
        <Value>75075</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.26_1</Region>
        <Parameter>2</Parameter>
        <Value>91</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.27_1</Region>
        <Parameter>1</Parameter>
        <Value>49780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.28_1</Region>
        <Parameter>1</Parameter>
        <Value>47716</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.28_1</Region>
        <Parameter>2</Parameter>
        <Value>1580</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.29_1</Region>
        <Parameter>1</Parameter>
        <Value>37758</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.29_1</Region>
        <Parameter>2</Parameter>
        <Value>1740</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.30_1</Region>
        <Parameter>1</Parameter>
        <Value>63578</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.30_1</Region>
        <Parameter>2</Parameter>
        <Value>83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.31_1</Region>
        <Parameter>1</Parameter>
        <Value>12226</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.31_1</Region>
        <Parameter>2</Parameter>
        <Value>1132</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.32_1</Region>
        <Parameter>1</Parameter>
        <Value>21280</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.15.32_1</Region>
        <Parameter>2</Parameter>
        <Value>1600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.1_1</Region>
        <Parameter>1</Parameter>
        <Value>20155</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.1_1</Region>
        <Parameter>2</Parameter>
        <Value>969</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.2_1</Region>
        <Parameter>1</Parameter>
        <Value>37647</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1706</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.3_1</Region>
        <Parameter>1</Parameter>
        <Value>23357</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1378</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.4_1</Region>
        <Parameter>1</Parameter>
        <Value>20328</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1263</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.5_1</Region>
        <Parameter>1</Parameter>
        <Value>17965</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.6_1</Region>
        <Parameter>1</Parameter>
        <Value>26098</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1458</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.7_1</Region>
        <Parameter>1</Parameter>
        <Value>15967</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1017</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.8_1</Region>
        <Parameter>1</Parameter>
        <Value>20505</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1349</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.9_1</Region>
        <Parameter>1</Parameter>
        <Value>25560</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.9_1</Region>
        <Parameter>2</Parameter>
        <Value>814</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.10_1</Region>
        <Parameter>1</Parameter>
        <Value>486200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.10_1</Region>
        <Parameter>2</Parameter>
        <Value>260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.11_1</Region>
        <Parameter>1</Parameter>
        <Value>31152</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1429</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.12_1</Region>
        <Parameter>1</Parameter>
        <Value>31075</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1243</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.13_1</Region>
        <Parameter>1</Parameter>
        <Value>34415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1428</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.14_1</Region>
        <Parameter>1</Parameter>
        <Value>15794</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1490</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.15_1</Region>
        <Parameter>1</Parameter>
        <Value>66089</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.15_1</Region>
        <Parameter>2</Parameter>
        <Value>25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.16_1</Region>
        <Parameter>1</Parameter>
        <Value>31392</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1319</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.17_1</Region>
        <Parameter>1</Parameter>
        <Value>41850</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1395</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.18_1</Region>
        <Parameter>1</Parameter>
        <Value>24000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.19_1</Region>
        <Parameter>1</Parameter>
        <Value>34562</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.19_1</Region>
        <Parameter>2</Parameter>
        <Value>22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.20_1</Region>
        <Parameter>1</Parameter>
        <Value>31437</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1391</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.21_1</Region>
        <Parameter>1</Parameter>
        <Value>18248</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.21_1</Region>
        <Parameter>2</Parameter>
        <Value>811</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.22_1</Region>
        <Parameter>1</Parameter>
        <Value>51392</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.16.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1460</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.1_1</Region>
        <Parameter>1</Parameter>
        <Value>45706</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1104</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.2_1</Region>
        <Parameter>1</Parameter>
        <Value>46334</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1379</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.3_1</Region>
        <Parameter>1</Parameter>
        <Value>15107</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.3_1</Region>
        <Parameter>2</Parameter>
        <Value>462</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.4_1</Region>
        <Parameter>1</Parameter>
        <Value>33886</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1637</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.5_1</Region>
        <Parameter>1</Parameter>
        <Value>50127</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.5_1</Region>
        <Parameter>2</Parameter>
        <Value>31</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.6_1</Region>
        <Parameter>1</Parameter>
        <Value>60375</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1852</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.7_1</Region>
        <Parameter>1</Parameter>
        <Value>93201</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.8_1</Region>
        <Parameter>1</Parameter>
        <Value>69564</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1364</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.9_1</Region>
        <Parameter>1</Parameter>
        <Value>20172</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.9_1</Region>
        <Parameter>2</Parameter>
        <Value>956</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.10_1</Region>
        <Parameter>1</Parameter>
        <Value>26562</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1162</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.11_1</Region>
        <Parameter>1</Parameter>
        <Value>52041</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1254</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.12_1</Region>
        <Parameter>1</Parameter>
        <Value>53681</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.12_1</Region>
        <Parameter>2</Parameter>
        <Value>1359</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.13_1</Region>
        <Parameter>1</Parameter>
        <Value>30593</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.13_1</Region>
        <Parameter>2</Parameter>
        <Value>818</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.14_1</Region>
        <Parameter>1</Parameter>
        <Value>69294</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1487</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.15_1</Region>
        <Parameter>1</Parameter>
        <Value>39875</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.15_1</Region>
        <Parameter>2</Parameter>
        <Value>25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.16_1</Region>
        <Parameter>1</Parameter>
        <Value>27999</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1037</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.17_1</Region>
        <Parameter>1</Parameter>
        <Value>20174</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1013</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.18_1</Region>
        <Parameter>1</Parameter>
        <Value>30627</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.19_1</Region>
        <Parameter>1</Parameter>
        <Value>16614</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1093</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.20_1</Region>
        <Parameter>1</Parameter>
        <Value>1008936</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.20_1</Region>
        <Parameter>2</Parameter>
        <Value>162</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.21_1</Region>
        <Parameter>1</Parameter>
        <Value>71639</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.21_1</Region>
        <Parameter>2</Parameter>
        <Value>815</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.22_1</Region>
        <Parameter>1</Parameter>
        <Value>37970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.22_1</Region>
        <Parameter>2</Parameter>
        <Value>861</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.23_1</Region>
        <Parameter>1</Parameter>
        <Value>57593</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1368</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.24_1</Region>
        <Parameter>1</Parameter>
        <Value>45873</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.24_1</Region>
        <Parameter>2</Parameter>
        <Value>1475</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.25_1</Region>
        <Parameter>1</Parameter>
        <Value>19776</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.25_1</Region>
        <Parameter>2</Parameter>
        <Value>618</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.26_1</Region>
        <Parameter>1</Parameter>
        <Value>27036</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.26_1</Region>
        <Parameter>2</Parameter>
        <Value>1502</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.27_1</Region>
        <Parameter>1</Parameter>
        <Value>41603</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1874</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.28_1</Region>
        <Parameter>1</Parameter>
        <Value>38806</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.28_1</Region>
        <Parameter>2</Parameter>
        <Value>1748</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.29_1</Region>
        <Parameter>1</Parameter>
        <Value>31018</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.17.29_1</Region>
        <Parameter>2</Parameter>
        <Value>1436</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.1_1</Region>
        <Parameter>1</Parameter>
        <Value>12208</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.1_1</Region>
        <Parameter>2</Parameter>
        <Value>682</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.2_1</Region>
        <Parameter>1</Parameter>
        <Value>23764</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.2_1</Region>
        <Parameter>2</Parameter>
        <Value>861</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.3_1</Region>
        <Parameter>1</Parameter>
        <Value>18970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.3_1</Region>
        <Parameter>2</Parameter>
        <Value>700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.4_1</Region>
        <Parameter>1</Parameter>
        <Value>29667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1595</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.5_1</Region>
        <Parameter>1</Parameter>
        <Value>43750</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.5_1</Region>
        <Parameter>2</Parameter>
        <Value>2500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.6_1</Region>
        <Parameter>1</Parameter>
        <Value>22551</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.6_1</Region>
        <Parameter>2</Parameter>
        <Value>595</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.7_1</Region>
        <Parameter>1</Parameter>
        <Value>35612</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.7_1</Region>
        <Parameter>2</Parameter>
        <Value>854</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.8_1</Region>
        <Parameter>1</Parameter>
        <Value>34515</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1062</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.9_1</Region>
        <Parameter>1</Parameter>
        <Value>44481</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1823</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.10_1</Region>
        <Parameter>1</Parameter>
        <Value>51955</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.10_1</Region>
        <Parameter>2</Parameter>
        <Value>110.9</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.11_1</Region>
        <Parameter>1</Parameter>
        <Value>19619</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.11_1</Region>
        <Parameter>2</Parameter>
        <Value>800</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.12_1</Region>
        <Parameter>1</Parameter>
        <Value>19440</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.12_1</Region>
        <Parameter>2</Parameter>
        <Value>900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.13_1</Region>
        <Parameter>1</Parameter>
        <Value>221260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.13_1</Region>
        <Parameter>2</Parameter>
        <Value>92</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.14_1</Region>
        <Parameter>1</Parameter>
        <Value>40596</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1020</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.15_1</Region>
        <Parameter>1</Parameter>
        <Value>44980</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.16_1</Region>
        <Parameter>1</Parameter>
        <Value>47250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.16_1</Region>
        <Parameter>2</Parameter>
        <Value>45</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.17_1</Region>
        <Parameter>1</Parameter>
        <Value>31832</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1378</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.18_1</Region>
        <Parameter>1</Parameter>
        <Value>19558</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.18_1</Region>
        <Parameter>2</Parameter>
        <Value>889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.19_1</Region>
        <Parameter>1</Parameter>
        <Value>33660</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1530</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.20_1</Region>
        <Parameter>1</Parameter>
        <Value>34450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.21_1</Region>
        <Parameter>1</Parameter>
        <Value>24200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.22_1</Region>
        <Parameter>1</Parameter>
        <Value>292005</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.22_1</Region>
        <Parameter>2</Parameter>
        <Value>103</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.23_1</Region>
        <Parameter>1</Parameter>
        <Value>67105</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1259</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.24_1</Region>
        <Parameter>1</Parameter>
        <Value>31672</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.24_1</Region>
        <Parameter>2</Parameter>
        <Value>863</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.25_1</Region>
        <Parameter>1</Parameter>
        <Value>26335</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.25_1</Region>
        <Parameter>2</Parameter>
        <Value>1009</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.26_1</Region>
        <Parameter>1</Parameter>
        <Value>25350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.26_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.27_1</Region>
        <Parameter>1</Parameter>
        <Value>20303</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.27_1</Region>
        <Parameter>2</Parameter>
        <Value>790</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.28_1</Region>
        <Parameter>1</Parameter>
        <Value>25000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.28_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.29_1</Region>
        <Parameter>1</Parameter>
        <Value>34544</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.18.29_1</Region>
        <Parameter>2</Parameter>
        <Value>1360</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.1_1</Region>
        <Parameter>1</Parameter>
        <Value>63783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1710</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.2_1</Region>
        <Parameter>1</Parameter>
        <Value>14816</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.2_1</Region>
        <Parameter>2</Parameter>
        <Value>377</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.3_1</Region>
        <Parameter>1</Parameter>
        <Value>45720</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.4_1</Region>
        <Parameter>1</Parameter>
        <Value>38043</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.4_1</Region>
        <Parameter>2</Parameter>
        <Value>27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.5_1</Region>
        <Parameter>1</Parameter>
        <Value>48230</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1820</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.6_1</Region>
        <Parameter>1</Parameter>
        <Value>35776</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.6_1</Region>
        <Parameter>2</Parameter>
        <Value>692</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.7_1</Region>
        <Parameter>1</Parameter>
        <Value>34272</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.7_1</Region>
        <Parameter>2</Parameter>
        <Value>720</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.8_1</Region>
        <Parameter>1</Parameter>
        <Value>64627</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.9_1</Region>
        <Parameter>1</Parameter>
        <Value>38273</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.9_1</Region>
        <Parameter>2</Parameter>
        <Value>945</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.10_1</Region>
        <Parameter>1</Parameter>
        <Value>28967</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.10_1</Region>
        <Parameter>2</Parameter>
        <Value>693</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.11_1</Region>
        <Parameter>1</Parameter>
        <Value>37548</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.11_1</Region>
        <Parameter>2</Parameter>
        <Value>745</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.12_1</Region>
        <Parameter>1</Parameter>
        <Value>246582</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.12_1</Region>
        <Parameter>2</Parameter>
        <Value>63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.13_1</Region>
        <Parameter>1</Parameter>
        <Value>89023</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.14_1</Region>
        <Parameter>1</Parameter>
        <Value>53580</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.14_1</Region>
        <Parameter>2</Parameter>
        <Value>2350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.15_1</Region>
        <Parameter>1</Parameter>
        <Value>100667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.16_1</Region>
        <Parameter>1</Parameter>
        <Value>64408</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1940</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.17_1</Region>
        <Parameter>1</Parameter>
        <Value>34896</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1442</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.18_1</Region>
        <Parameter>1</Parameter>
        <Value>56806</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.19.18_1</Region>
        <Parameter>2</Parameter>
        <Value>659</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.1_1</Region>
        <Parameter>1</Parameter>
        <Value>44880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.1_1</Region>
        <Parameter>2</Parameter>
        <Value>544</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.2_1</Region>
        <Parameter>1</Parameter>
        <Value>121512</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.2_1</Region>
        <Parameter>2</Parameter>
        <Value>61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.3_1</Region>
        <Parameter>1</Parameter>
        <Value>109980</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.3_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.4_1</Region>
        <Parameter>1</Parameter>
        <Value>103650</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.20.4_1</Region>
        <Parameter>2</Parameter>
        <Value>231</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.1_1</Region>
        <Parameter>1</Parameter>
        <Value>53250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.2_1</Region>
        <Parameter>1</Parameter>
        <Value>27060</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.3_1</Region>
        <Parameter>1</Parameter>
        <Value>23120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.4_1</Region>
        <Parameter>1</Parameter>
        <Value>25367</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.4_1</Region>
        <Parameter>2</Parameter>
        <Value>943</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.5_1</Region>
        <Parameter>1</Parameter>
        <Value>85527</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.5_1</Region>
        <Parameter>2</Parameter>
        <Value>43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.6_1</Region>
        <Parameter>1</Parameter>
        <Value>29006</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1667</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.7_1</Region>
        <Parameter>1</Parameter>
        <Value>28620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.8_1</Region>
        <Parameter>1</Parameter>
        <Value>38392</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1284</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.9_1</Region>
        <Parameter>1</Parameter>
        <Value>19720</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.9_1</Region>
        <Parameter>2</Parameter>
        <Value>1700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.10_1</Region>
        <Parameter>1</Parameter>
        <Value>18810</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.10_1</Region>
        <Parameter>2</Parameter>
        <Value>900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.11_1</Region>
        <Parameter>1</Parameter>
        <Value>24498</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1025</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.12_1</Region>
        <Parameter>1</Parameter>
        <Value>48050</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.12_1</Region>
        <Parameter>2</Parameter>
        <Value>31</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.13_1</Region>
        <Parameter>1</Parameter>
        <Value>27478</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1284</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.14_1</Region>
        <Parameter>1</Parameter>
        <Value>29260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.15_1</Region>
        <Parameter>1</Parameter>
        <Value>43368</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.15_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.16_1</Region>
        <Parameter>1</Parameter>
        <Value>35910</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1900</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.17_1</Region>
        <Parameter>1</Parameter>
        <Value>17743</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1123</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.18_1</Region>
        <Parameter>1</Parameter>
        <Value>76626</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.18_1</Region>
        <Parameter>2</Parameter>
        <Value>43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.19_1</Region>
        <Parameter>1</Parameter>
        <Value>21556</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1211</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.20_1</Region>
        <Parameter>1</Parameter>
        <Value>263435</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.20_1</Region>
        <Parameter>2</Parameter>
        <Value>95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.21_1</Region>
        <Parameter>1</Parameter>
        <Value>64670</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1853</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.22_1</Region>
        <Parameter>1</Parameter>
        <Value>37062</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1065</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.23_1</Region>
        <Parameter>1</Parameter>
        <Value>19090</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.21.23_1</Region>
        <Parameter>2</Parameter>
        <Value>830</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.1_1</Region>
        <Parameter>1</Parameter>
        <Value>20891</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.1_1</Region>
        <Parameter>2</Parameter>
        <Value>661</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.2_1</Region>
        <Parameter>1</Parameter>
        <Value>66399</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1006</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.3_1</Region>
        <Parameter>1</Parameter>
        <Value>63474</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.3_1</Region>
        <Parameter>2</Parameter>
        <Value>802</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.4_1</Region>
        <Parameter>1</Parameter>
        <Value>44130</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.4_1</Region>
        <Parameter>2</Parameter>
        <Value>903</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.5_1</Region>
        <Parameter>1</Parameter>
        <Value>59321</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1016</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.6_1</Region>
        <Parameter>1</Parameter>
        <Value>37489</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.6_1</Region>
        <Parameter>2</Parameter>
        <Value>694</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.7_1</Region>
        <Parameter>1</Parameter>
        <Value>46584</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.7_1</Region>
        <Parameter>2</Parameter>
        <Value>918</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.8_1</Region>
        <Parameter>1</Parameter>
        <Value>29325</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.8_1</Region>
        <Parameter>2</Parameter>
        <Value>632</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.9_1</Region>
        <Parameter>1</Parameter>
        <Value>27151</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.9_1</Region>
        <Parameter>2</Parameter>
        <Value>558</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.10_1</Region>
        <Parameter>1</Parameter>
        <Value>18125</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.10_1</Region>
        <Parameter>2</Parameter>
        <Value>496</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.11_1</Region>
        <Parameter>1</Parameter>
        <Value>41868</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.11_1</Region>
        <Parameter>2</Parameter>
        <Value>837</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.12_1</Region>
        <Parameter>1</Parameter>
        <Value>33387</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.12_1</Region>
        <Parameter>2</Parameter>
        <Value>838</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.13_1</Region>
        <Parameter>1</Parameter>
        <Value>64833</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1130</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.14_1</Region>
        <Parameter>1</Parameter>
        <Value>218664</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.14_1</Region>
        <Parameter>2</Parameter>
        <Value>72</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.15_1</Region>
        <Parameter>1</Parameter>
        <Value>67093</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.15_1</Region>
        <Parameter>2</Parameter>
        <Value>749</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.16_1</Region>
        <Parameter>1</Parameter>
        <Value>46059</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.16_1</Region>
        <Parameter>2</Parameter>
        <Value>684</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.17_1</Region>
        <Parameter>1</Parameter>
        <Value>57083</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.17_1</Region>
        <Parameter>2</Parameter>
        <Value>863</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.18_1</Region>
        <Parameter>1</Parameter>
        <Value>41035</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.22.18_1</Region>
        <Parameter>2</Parameter>
        <Value>978</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.1_1</Region>
        <Parameter>1</Parameter>
        <Value>51689</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.1_1</Region>
        <Parameter>2</Parameter>
        <Value>635</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.2_1</Region>
        <Parameter>1</Parameter>
        <Value>101008</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.2_1</Region>
        <Parameter>2</Parameter>
        <Value>944</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.3_1</Region>
        <Parameter>1</Parameter>
        <Value>95355</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.3_1</Region>
        <Parameter>2</Parameter>
        <Value>975</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.4_1</Region>
        <Parameter>1</Parameter>
        <Value>48156</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1166</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.5_1</Region>
        <Parameter>1</Parameter>
        <Value>85892</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.5_1</Region>
        <Parameter>2</Parameter>
        <Value>27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.6_1</Region>
        <Parameter>1</Parameter>
        <Value>100698</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.6_1</Region>
        <Parameter>2</Parameter>
        <Value>998</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.7_1</Region>
        <Parameter>1</Parameter>
        <Value>31235</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.7_1</Region>
        <Parameter>2</Parameter>
        <Value>631</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.8_1</Region>
        <Parameter>1</Parameter>
        <Value>91005</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1892</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.9_1</Region>
        <Parameter>1</Parameter>
        <Value>54311</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.9_1</Region>
        <Parameter>2</Parameter>
        <Value>673</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.10_1</Region>
        <Parameter>1</Parameter>
        <Value>173255</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1818</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.11_1</Region>
        <Parameter>1</Parameter>
        <Value>114010</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.11_1</Region>
        <Parameter>2</Parameter>
        <Value>65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.12_1</Region>
        <Parameter>1</Parameter>
        <Value>68556</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.12_1</Region>
        <Parameter>2</Parameter>
        <Value>870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.13_1</Region>
        <Parameter>1</Parameter>
        <Value>26373</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.13_1</Region>
        <Parameter>2</Parameter>
        <Value>809</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.14_1</Region>
        <Parameter>1</Parameter>
        <Value>24371</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.14_1</Region>
        <Parameter>2</Parameter>
        <Value>544</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.15_1</Region>
        <Parameter>1</Parameter>
        <Value>118839</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.23.15_1</Region>
        <Parameter>2</Parameter>
        <Value>697</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.1_1</Region>
        <Parameter>1</Parameter>
        <Value>51444</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1100</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.2_1</Region>
        <Parameter>1</Parameter>
        <Value>58449</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1285</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.3_1</Region>
        <Parameter>1</Parameter>
        <Value>20840</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.3_1</Region>
        <Parameter>2</Parameter>
        <Value>760</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.4_1</Region>
        <Parameter>1</Parameter>
        <Value>39328</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.4_1</Region>
        <Parameter>2</Parameter>
        <Value>790</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.5_1</Region>
        <Parameter>1</Parameter>
        <Value>36874</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.5_1</Region>
        <Parameter>2</Parameter>
        <Value>910</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.6_1</Region>
        <Parameter>1</Parameter>
        <Value>57409</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1090</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.7_1</Region>
        <Parameter>1</Parameter>
        <Value>35864</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1250</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.8_1</Region>
        <Parameter>1</Parameter>
        <Value>38975</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.9_1</Region>
        <Parameter>1</Parameter>
        <Value>32976</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.9_1</Region>
        <Parameter>2</Parameter>
        <Value>880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.10_1</Region>
        <Parameter>1</Parameter>
        <Value>24030</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.10_1</Region>
        <Parameter>2</Parameter>
        <Value>9</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.11_1</Region>
        <Parameter>1</Parameter>
        <Value>34905</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.11_1</Region>
        <Parameter>2</Parameter>
        <Value>960</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.12_1</Region>
        <Parameter>1</Parameter>
        <Value>37272</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.12_1</Region>
        <Parameter>2</Parameter>
        <Value>970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.13_1</Region>
        <Parameter>1</Parameter>
        <Value>10521</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.13_1</Region>
        <Parameter>2</Parameter>
        <Value>21</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.14_1</Region>
        <Parameter>1</Parameter>
        <Value>32647</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.14_1</Region>
        <Parameter>2</Parameter>
        <Value>930</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.15_1</Region>
        <Parameter>1</Parameter>
        <Value>24919</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.15_1</Region>
        <Parameter>2</Parameter>
        <Value>890</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.16_1</Region>
        <Parameter>1</Parameter>
        <Value>48347</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1290</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.17_1</Region>
        <Parameter>1</Parameter>
        <Value>20793</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.17_1</Region>
        <Parameter>2</Parameter>
        <Value>870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.18_1</Region>
        <Parameter>1</Parameter>
        <Value>20678</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.18_1</Region>
        <Parameter>2</Parameter>
        <Value>600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.19_1</Region>
        <Parameter>1</Parameter>
        <Value>29397</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1199</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.20_1</Region>
        <Parameter>1</Parameter>
        <Value>56661</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1140</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.21_1</Region>
        <Parameter>1</Parameter>
        <Value>27818</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.21_1</Region>
        <Parameter>2</Parameter>
        <Value>810</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.22_1</Region>
        <Parameter>1</Parameter>
        <Value>32933</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.22_1</Region>
        <Parameter>2</Parameter>
        <Value>780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.23_1</Region>
        <Parameter>1</Parameter>
        <Value>51444</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.23_1</Region>
        <Parameter>2</Parameter>
        <Value>860</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.24_1</Region>
        <Parameter>1</Parameter>
        <Value>54727</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.24_1</Region>
        <Parameter>2</Parameter>
        <Value>1120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.25_1</Region>
        <Parameter>1</Parameter>
        <Value>41819</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.25_1</Region>
        <Parameter>2</Parameter>
        <Value>880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.26_1</Region>
        <Parameter>1</Parameter>
        <Value>371855</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.26_1</Region>
        <Parameter>2</Parameter>
        <Value>113</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.27_1</Region>
        <Parameter>1</Parameter>
        <Value>80556</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.27_1</Region>
        <Parameter>2</Parameter>
        <Value>910</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.28_1</Region>
        <Parameter>1</Parameter>
        <Value>34182</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.28_1</Region>
        <Parameter>2</Parameter>
        <Value>18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.29_1</Region>
        <Parameter>1</Parameter>
        <Value>33781</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.24.29_1</Region>
        <Parameter>2</Parameter>
        <Value>1130</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.1_1</Region>
        <Parameter>1</Parameter>
        <Value>53407</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.1_1</Region>
        <Parameter>2</Parameter>
        <Value>1122</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.2_1</Region>
        <Parameter>1</Parameter>
        <Value>32895</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.2_1</Region>
        <Parameter>2</Parameter>
        <Value>645</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.3_1</Region>
        <Parameter>1</Parameter>
        <Value>5586</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.3_1</Region>
        <Parameter>2</Parameter>
        <Value>7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.4_1</Region>
        <Parameter>1</Parameter>
        <Value>64054</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.4_1</Region>
        <Parameter>2</Parameter>
        <Value>1414</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.5_1</Region>
        <Parameter>1</Parameter>
        <Value>68714</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.5_1</Region>
        <Parameter>2</Parameter>
        <Value>47</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.6_1</Region>
        <Parameter>1</Parameter>
        <Value>40663</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1723</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.7_1</Region>
        <Parameter>1</Parameter>
        <Value>35815</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1450</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.8_1</Region>
        <Parameter>1</Parameter>
        <Value>39839</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1481</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.9_1</Region>
        <Parameter>1</Parameter>
        <Value>22998</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.9_1</Region>
        <Parameter>2</Parameter>
        <Value>712</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.10_1</Region>
        <Parameter>1</Parameter>
        <Value>216510</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.10_1</Region>
        <Parameter>2</Parameter>
        <Value>42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.11_1</Region>
        <Parameter>1</Parameter>
        <Value>60715</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.11_1</Region>
        <Parameter>2</Parameter>
        <Value>973</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.12_1</Region>
        <Parameter>1</Parameter>
        <Value>55266</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.12_1</Region>
        <Parameter>2</Parameter>
        <Value>2265</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.13_1</Region>
        <Parameter>1</Parameter>
        <Value>68120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.13_1</Region>
        <Parameter>2</Parameter>
        <Value>20</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.14_1</Region>
        <Parameter>1</Parameter>
        <Value>51732</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1437</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.15_1</Region>
        <Parameter>1</Parameter>
        <Value>40368</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.15_1</Region>
        <Parameter>2</Parameter>
        <Value>928</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.16_1</Region>
        <Parameter>1</Parameter>
        <Value>17078</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.16_1</Region>
        <Parameter>2</Parameter>
        <Value>759</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.17_1</Region>
        <Parameter>1</Parameter>
        <Value>30940</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.17_1</Region>
        <Parameter>2</Parameter>
        <Value>1121</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.18_1</Region>
        <Parameter>1</Parameter>
        <Value>26510</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.18_1</Region>
        <Parameter>2</Parameter>
        <Value>1205</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.19_1</Region>
        <Parameter>1</Parameter>
        <Value>25742</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.25.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1038</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.1_1</Region>
        <Parameter>1</Parameter>
        <Value>111766</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.1_1</Region>
        <Parameter>2</Parameter>
        <Value>82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.2_1</Region>
        <Parameter>1</Parameter>
        <Value>24862</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1776</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.3_1</Region>
        <Parameter>1</Parameter>
        <Value>16728</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.3_1</Region>
        <Parameter>2</Parameter>
        <Value>1200</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.4_1</Region>
        <Parameter>1</Parameter>
        <Value>53298</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.4_1</Region>
        <Parameter>2</Parameter>
        <Value>63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.5_1</Region>
        <Parameter>1</Parameter>
        <Value>26150</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.5_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.6_1</Region>
        <Parameter>1</Parameter>
        <Value>33147</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.6_1</Region>
        <Parameter>2</Parameter>
        <Value>1850</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.7_1</Region>
        <Parameter>1</Parameter>
        <Value>39402</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.7_1</Region>
        <Parameter>2</Parameter>
        <Value>1240</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.8_1</Region>
        <Parameter>1</Parameter>
        <Value>21613</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.9_1</Region>
        <Parameter>1</Parameter>
        <Value>151557</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.9_1</Region>
        <Parameter>2</Parameter>
        <Value>49</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.10_1</Region>
        <Parameter>1</Parameter>
        <Value>48898</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.10_1</Region>
        <Parameter>2</Parameter>
        <Value>1780</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.11_1</Region>
        <Parameter>1</Parameter>
        <Value>28456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1067</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.12_1</Region>
        <Parameter>1</Parameter>
        <Value>28456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.12_1</Region>
        <Parameter>2</Parameter>
        <Value>915</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.13_1</Region>
        <Parameter>1</Parameter>
        <Value>45056</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.13_1</Region>
        <Parameter>2</Parameter>
        <Value>1590</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.14_1</Region>
        <Parameter>1</Parameter>
        <Value>39498</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.14_1</Region>
        <Parameter>2</Parameter>
        <Value>1340</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.15_1</Region>
        <Parameter>1</Parameter>
        <Value>26889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1947</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.16_1</Region>
        <Parameter>1</Parameter>
        <Value>29524</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.17_1</Region>
        <Parameter>1</Parameter>
        <Value>8598</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.17_1</Region>
        <Parameter>2</Parameter>
        <Value>610</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.18_1</Region>
        <Parameter>1</Parameter>
        <Value>30880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.18_1</Region>
        <Parameter>2</Parameter>
        <Value>32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.19_1</Region>
        <Parameter>1</Parameter>
        <Value>21969</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.19_1</Region>
        <Parameter>2</Parameter>
        <Value>1442</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.20_1</Region>
        <Parameter>1</Parameter>
        <Value>62533</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.20_1</Region>
        <Parameter>2</Parameter>
        <Value>1620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.21_1</Region>
        <Parameter>1</Parameter>
        <Value>7856</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.21_1</Region>
        <Parameter>2</Parameter>
        <Value>470</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.22_1</Region>
        <Parameter>1</Parameter>
        <Value>21194</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1128</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.23_1</Region>
        <Parameter>1</Parameter>
        <Value>46594</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.23_1</Region>
        <Parameter>2</Parameter>
        <Value>1280</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.24_1</Region>
        <Parameter>1</Parameter>
        <Value>743095</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.24_1</Region>
        <Parameter>2</Parameter>
        <Value>331</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.25_1</Region>
        <Parameter>1</Parameter>
        <Value>56817</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.26.25_1</Region>
        <Parameter>2</Parameter>
        <Value>1460</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.1_1</Region>
        <Parameter>1</Parameter>
        <Value>33845</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.1_1</Region>
        <Parameter>2</Parameter>
        <Value>960</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.2_1</Region>
        <Parameter>1</Parameter>
        <Value>40474</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.2_1</Region>
        <Parameter>2</Parameter>
        <Value>1000</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.3_1</Region>
        <Parameter>1</Parameter>
        <Value>75985</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.3_1</Region>
        <Parameter>2</Parameter>
        <Value>35</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.4_1</Region>
        <Parameter>1</Parameter>
        <Value>29497</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.4_1</Region>
        <Parameter>2</Parameter>
        <Value>865</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.5_1</Region>
        <Parameter>1</Parameter>
        <Value>15688</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.5_1</Region>
        <Parameter>2</Parameter>
        <Value>625</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.6_1</Region>
        <Parameter>1</Parameter>
        <Value>30515</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.6_1</Region>
        <Parameter>2</Parameter>
        <Value>850</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.7_1</Region>
        <Parameter>1</Parameter>
        <Value>26591</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.7_1</Region>
        <Parameter>2</Parameter>
        <Value>855</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.8_1</Region>
        <Parameter>1</Parameter>
        <Value>36710</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.8_1</Region>
        <Parameter>2</Parameter>
        <Value>1037</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.9_1</Region>
        <Parameter>1</Parameter>
        <Value>35270</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.9_1</Region>
        <Parameter>2</Parameter>
        <Value>2112</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.10_1</Region>
        <Parameter>1</Parameter>
        <Value>63798</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.10_1</Region>
        <Parameter>2</Parameter>
        <Value>42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.11_1</Region>
        <Parameter>1</Parameter>
        <Value>28577</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.11_1</Region>
        <Parameter>2</Parameter>
        <Value>1764</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.12_1</Region>
        <Parameter>1</Parameter>
        <Value>41061</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.12_1</Region>
        <Parameter>2</Parameter>
        <Value>973</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.13_1</Region>
        <Parameter>1</Parameter>
        <Value>28160</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.13_1</Region>
        <Parameter>2</Parameter>
        <Value>757</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.14_1</Region>
        <Parameter>1</Parameter>
        <Value>16600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.14_1</Region>
        <Parameter>2</Parameter>
        <Value>994</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.15_1</Region>
        <Parameter>1</Parameter>
        <Value>19965</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.15_1</Region>
        <Parameter>2</Parameter>
        <Value>1406</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.16_1</Region>
        <Parameter>1</Parameter>
        <Value>9630</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.16_1</Region>
        <Parameter>2</Parameter>
        <Value>1284</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.17_1</Region>
        <Parameter>1</Parameter>
        <Value>54912</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.17_1</Region>
        <Parameter>2</Parameter>
        <Value>26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.18_1</Region>
        <Parameter>1</Parameter>
        <Value>47415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.18_1</Region>
        <Parameter>2</Parameter>
        <Value>2098</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.19_1</Region>
        <Parameter>1</Parameter>
        <Value>42038</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.19_1</Region>
        <Parameter>2</Parameter>
        <Value>2248</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.20_1</Region>
        <Parameter>1</Parameter>
        <Value>59607</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.20_1</Region>
        <Parameter>2</Parameter>
        <Value>3222</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.21_1</Region>
        <Parameter>1</Parameter>
        <Value>33288</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.21_1</Region>
        <Parameter>2</Parameter>
        <Value>1037</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.22_1</Region>
        <Parameter>1</Parameter>
        <Value>37094</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.22_1</Region>
        <Parameter>2</Parameter>
        <Value>1297</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.23_1</Region>
        <Parameter>1</Parameter>
        <Value>29479</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.23_1</Region>
        <Parameter>2</Parameter>
        <Value>927</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.24_1</Region>
        <Parameter>1</Parameter>
        <Value>28858</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.24_1</Region>
        <Parameter>2</Parameter>
        <Value>1002</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.25_1</Region>
        <Parameter>1</Parameter>
        <Value>35716</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.25_1</Region>
        <Parameter>2</Parameter>
        <Value>869</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.26_1</Region>
        <Parameter>1</Parameter>
        <Value>266936</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.26_1</Region>
        <Parameter>2</Parameter>
        <Value>61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.27_1</Region>
        <Parameter>1</Parameter>
        <Value>69744</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>UKR.27.27_1</Region>
        <Parameter>2</Parameter>
        <Value>1441</Value>
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

