Class RF.KHAB.Utils
{

ClassMethod setup() As %Status
{
	set sc = ..Populate()
	quit sc
}

ClassMethod Populate() As %Status
{
	set (sc1, sc2) = $$$OK
	
	set sc1 = ##class(RF.KHAB.Region).%KillExtent()
	
	set ^regions("Аяно-Майский район") = 1971
	set ^regions("Охотский район") = 6717
	set ^regions("Тугуро-Чумиканский район") = 1972
	set ^regions("Имени Полины Осипенко район") = 4627
	set ^regions("Вяземский район") = 21238
	set ^regions("Бикинский район") = 22641
	set ^regions("Хабаровский район") = 90180
	set ^regions("Николаевский район") = 28331
	set ^regions("Ульчский район") = 16044
	set ^regions("Верхнебуреинский район") = 25351
	set ^regions("Амурский район") = 61291
	set ^regions("Комсомольск-на-Амуре") = 251283
	set ^regions("Солнечный район") = 30809
	set ^regions("Ванинский район") = 34316
	set ^regions("Имени Лазо район") = 42238
	set ^regions("Комсомольский район") = 28000
	set ^regions("Нанайский район") = 16332
	set ^regions("Советско-Гаванский район") = 40051
	set ^regions("Хабаровск") = 611160
	
	set key = $order(^regions(""))
	while (key '= "") {
		set obj = ##class(Region).%New()
		set obj.Key = key
		set obj.Name = key
		set obj.Population = ^regions(key)
		set sc2 = obj.%Save()
		
		set key = $order(^regions(key))
	}
	
	quit $$$ADDSC(sc1, sc2)
}

}

