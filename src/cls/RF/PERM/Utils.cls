Class RF.PERM.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("PERMCube")
}

ClassMethod Populate() As %Status
{
	do ..ImportXData("RF.PERM.Region", "RegionXData")
	do ..ImportXData("RF.PERM.Parameter", "ParameterXData")
	do ..ImportXData("RF.PERM.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("RF.PERM.Utils||"_xDataName).Data
		#dim reader As %XML.Reader = ##class(%XML.Reader).%New()

		set sc = reader.OpenStream(stream, "literal")
		$$$THROWONERROR(sc,sc)

		do reader.Correlate($piece(className, ".", *), className)

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
<Name>Город Кудымкар</Name>
<Guid>E8212A0A-2200-463A-B4AD-7BAD33456029</Guid>
</Region>
<Region>
<Name>Город Пермь</Name>
<Guid>336BB8FC-2A48-440B-A31B-2FBFB5B635D0</Guid>
</Region>
<Region>
<Name>Краснокамский район</Name>
<Guid>58571318-4565-47AC-B81A-CC2E857E886B</Guid>
</Region>
<Region>
<Name>Пермский район</Name>
<Guid>D74D78C3-7B6D-4655-8505-0A4CF9C9C980</Guid>
</Region>
<Region>
<Name>Березовский район</Name>
<Guid>42E06232-02E0-4ED3-B938-D7C78721423A</Guid>
</Region>
<Region>
<Name>Добрянский район</Name>
<Guid>3E7CE339-BB44-449B-864A-E88854F55103</Guid>
</Region>
<Region>
<Name>Чусовской район</Name>
<Guid>59F16C86-232D-431E-BE40-58687C4FE573</Guid>
</Region>
<Region>
<Name>Лысьвенский район</Name>
<Guid>F821D845-678F-491D-AD83-48D3255257AC</Guid>
</Region>
<Region>
<Name>Верещагинский район</Name>
<Guid>DF29D442-F183-4BAA-B7A7-B35724164DA7</Guid>
</Region>
<Region>
<Name>Кизеловский район</Name>
<Guid>CCF30BF5-30B3-43E6-9CD7-9E1D3CF57626</Guid>
</Region>
<Region>
<Name>Город Кунгур</Name>
<Guid>E87D0C11-ECFE-46A7-919A-1FE41C71C0E3</Guid>
</Region>
<Region>
<Name>Поселок Звездный ЗАТО</Name>
<Guid>44C7A41D-56EE-4AF0-A526-DB1E25C39259</Guid>
</Region>
<Region>
<Name>Очерский район</Name>
<Guid>A6BF1001-B4A7-490D-8322-67FBD3BD6A21</Guid>
</Region>
<Region>
<Name>Гремячинский район</Name>
<Guid>EF36E41F-F0D4-47C7-B7C0-6C53664C2BEC</Guid>
</Region>
<Region>
<Name>Губахинский район</Name>
<Guid>E4D53EEA-3CC5-4F5A-8CDA-5758C4284444</Guid>
</Region>
<Region>
<Name>Горнозаводский район</Name>
<Guid>9C04A206-0C39-43B2-9205-6657F340F19D</Guid>
</Region>
<Region>
<Name>Юсьвинский район</Name>
<Guid>945F80F0-008D-444E-A429-C046BE03C6B8</Guid>
</Region>
<Region>
<Name>Осинский район</Name>
<Guid>5CF3AFFD-C55F-42B2-A6FE-282F0D7077FE</Guid>
</Region>
<Region>
<Name>Усольский район</Name>
<Guid>900E9BA9-FBB6-4CDC-86A8-06338A48942B</Guid>
</Region>
<Region>
<Name>Кудымкарский район</Name>
<Guid>CF3DE655-447A-4266-ABF0-E50339B80377</Guid>
</Region>
<Region>
<Name>Кунгурский район</Name>
<Guid>E7CAA522-4B6F-46D8-B9B7-587B1EC1E250</Guid>
</Region>
<Region>
<Name>Нытвенский район</Name>
<Guid>8C09FCD1-8F86-4EA0-981A-B21AC6BA816D</Guid>
</Region>
<Region>
<Name>Соликамский район</Name>
<Guid>AC8F9D60-901D-498C-9632-FB9EE61EAB8E</Guid>
</Region>
<Region>
<Name>Бардымский район</Name>
<Guid>852F13AE-A20B-44D1-8FB6-0458324078AE</Guid>
</Region>
<Region>
<Name>Еловский район</Name>
<Guid>F4809AEA-9887-420E-8619-F05A9A8718E8</Guid>
</Region>
<Region>
<Name>Куединский район</Name>
<Guid>9C63EFA8-D1AB-4303-8BE3-FF419D44D706</Guid>
</Region>
<Region>
<Name>Октябрьский район</Name>
<Guid>48C6E828-80F6-49B5-BFD8-0922B10CAB37</Guid>
</Region>
<Region>
<Name>Чернушинский район</Name>
<Guid>27600105-2934-4FAA-8779-5809D1763579</Guid>
</Region>
<Region>
<Name>Уинский район</Name>
<Guid>55451222-1B8F-44C2-81B3-8D632E5A600F</Guid>
</Region>
<Region>
<Name>Суксунский район</Name>
<Guid>FE5402C3-DECF-4BBA-B8B8-EF96B1A0D782</Guid>
</Region>
<Region>
<Name>Чайковский район</Name>
<Guid>51F1EA0E-D0DE-4DFA-BDD7-77B82442A144</Guid>
</Region>
<Region>
<Name>Красновишерский район</Name>
<Guid>9DA2C773-E56A-4B86-9FA8-F33371C85068</Guid>
</Region>
<Region>
<Name>Частинский район</Name>
<Guid>BA0C4E93-BC84-412C-88E7-7100FC73B423</Guid>
</Region>
<Region>
<Name>Ординский район</Name>
<Guid>6ED026C6-8CC9-41A2-A17F-7153408CCA49</Guid>
</Region>
<Region>
<Name>Большесосновский район</Name>
<Guid>2ADEA498-EA80-429C-986F-AF480F501D6C</Guid>
</Region>
<Region>
<Name>Оханский район</Name>
<Guid>70170F5F-C65F-4DD6-BE4C-5190021494FB</Guid>
</Region>
<Region>
<Name>Кишертский район</Name>
<Guid>7F6A8E27-FFEB-4CE1-91E9-07C80964A3F9</Guid>
</Region>
<Region>
<Name>Сивинский район</Name>
<Guid>AA6505FD-16C5-4612-A38E-98CA8545B2CE</Guid>
</Region>
<Region>
<Name>Карагайский район</Name>
<Guid>C52FD184-872A-45D0-85A3-C52023EEF50A</Guid>
</Region>
<Region>
<Name>Ильинский район</Name>
<Guid>8E708F8B-4E06-4A89-ADC5-5DFA8CECE8BB</Guid>
</Region>
<Region>
<Name>Юрлинский район</Name>
<Guid>2EFBCFB1-362F-4915-9390-844E0D8B7DE1</Guid>
</Region>
<Region>
<Name>Косинский район</Name>
<Guid>EBBFB69B-FEA9-4B5B-85AC-76570A113422</Guid>
</Region>
<Region>
<Name>Город Соликамск</Name>
<Guid>403AABBD-9346-4FD8-ABAC-4831EE0E27CD</Guid>
</Region>
<Region>
<Name>Город Березники</Name>
<Guid>E733F602-56FD-41A6-9DEA-CFB1A2012DEA</Guid>
</Region>
<Region>
<Name>Кочевский район</Name>
<Guid>F6BFE632-2719-4E88-AA78-FAA5532F27EC</Guid>
</Region>
<Region>
<Name>Гайнский район</Name>
<Guid>ADCD66BA-7C20-4D33-9820-801C01ECF4C0</Guid>
</Region>
<Region>
<Name>Александровский район</Name>
<Guid>40A2C4E1-C81B-49B4-8646-08E86657F123</Guid>
</Region>
<Region>
<Name>Чердынский район</Name>
<Guid>ACA4F6D7-5F66-4F9C-B727-A6C771DEBC5F</Guid>
</Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
<ParameterValue><Region>E8212A0A-2200-463A-B4AD-7BAD33456029</Region><Parameter>1</Parameter><Value>28967</Value></ParameterValue>
<ParameterValue><Region>E8212A0A-2200-463A-B4AD-7BAD33456029</Region><Parameter>2</Parameter><Value>32.84</Value></ParameterValue>
<ParameterValue><Region>E8212A0A-2200-463A-B4AD-7BAD33456029</Region><Parameter>3</Parameter><Value>882.01</Value></ParameterValue>
<ParameterValue><Region>336BB8FC-2A48-440B-A31B-2FBFB5B635D0</Region><Parameter>1</Parameter><Value>1013890</Value></ParameterValue>
<ParameterValue><Region>336BB8FC-2A48-440B-A31B-2FBFB5B635D0</Region><Parameter>2</Parameter><Value>810.24</Value></ParameterValue>
<ParameterValue><Region>336BB8FC-2A48-440B-A31B-2FBFB5B635D0</Region><Parameter>3</Parameter><Value>1251.35</Value></ParameterValue>
<ParameterValue><Region>58571318-4565-47AC-B81A-CC2E857E886B</Region><Parameter>1</Parameter><Value>70400</Value></ParameterValue>
<ParameterValue><Region>58571318-4565-47AC-B81A-CC2E857E886B</Region><Parameter>2</Parameter><Value>950.7</Value></ParameterValue>
<ParameterValue><Region>58571318-4565-47AC-B81A-CC2E857E886B</Region><Parameter>3</Parameter><Value>74.05</Value></ParameterValue>
<ParameterValue><Region>D74D78C3-7B6D-4655-8505-0A4CF9C9C980</Region><Parameter>1</Parameter><Value>86800</Value></ParameterValue>
<ParameterValue><Region>D74D78C3-7B6D-4655-8505-0A4CF9C9C980</Region><Parameter>2</Parameter><Value>3867.62</Value></ParameterValue>
<ParameterValue><Region>D74D78C3-7B6D-4655-8505-0A4CF9C9C980</Region><Parameter>3</Parameter><Value>22.44</Value></ParameterValue>
<ParameterValue><Region>42E06232-02E0-4ED3-B938-D7C78721423A</Region><Parameter>1</Parameter><Value>17800</Value></ParameterValue>
<ParameterValue><Region>42E06232-02E0-4ED3-B938-D7C78721423A</Region><Parameter>2</Parameter><Value>1967.33</Value></ParameterValue>
<ParameterValue><Region>42E06232-02E0-4ED3-B938-D7C78721423A</Region><Parameter>3</Parameter><Value>9.05</Value></ParameterValue>
<ParameterValue><Region>3E7CE339-BB44-449B-864A-E88854F55103</Region><Parameter>1</Parameter><Value>64400</Value></ParameterValue>
<ParameterValue><Region>3E7CE339-BB44-449B-864A-E88854F55103</Region><Parameter>2</Parameter><Value>5126.59</Value></ParameterValue>
<ParameterValue><Region>3E7CE339-BB44-449B-864A-E88854F55103</Region><Parameter>3</Parameter><Value>12.56</Value></ParameterValue>
<ParameterValue><Region>59F16C86-232D-431E-BE40-58687C4FE573</Region><Parameter>1</Parameter><Value>74500</Value></ParameterValue>
<ParameterValue><Region>59F16C86-232D-431E-BE40-58687C4FE573</Region><Parameter>2</Parameter><Value>3513.25</Value></ParameterValue>
<ParameterValue><Region>59F16C86-232D-431E-BE40-58687C4FE573</Region><Parameter>3</Parameter><Value>21.21</Value></ParameterValue>
<ParameterValue><Region>F821D845-678F-491D-AD83-48D3255257AC</Region><Parameter>1</Parameter><Value>81900</Value></ParameterValue>
<ParameterValue><Region>F821D845-678F-491D-AD83-48D3255257AC</Region><Parameter>2</Parameter><Value>3752.97</Value></ParameterValue>
<ParameterValue><Region>F821D845-678F-491D-AD83-48D3255257AC</Region><Parameter>3</Parameter><Value>21.82</Value></ParameterValue>
<ParameterValue><Region>DF29D442-F183-4BAA-B7A7-B35724164DA7</Region><Parameter>1</Parameter><Value>43600</Value></ParameterValue>
<ParameterValue><Region>DF29D442-F183-4BAA-B7A7-B35724164DA7</Region><Parameter>2</Parameter><Value>1617.3</Value></ParameterValue>
<ParameterValue><Region>DF29D442-F183-4BAA-B7A7-B35724164DA7</Region><Parameter>3</Parameter><Value>26.96</Value></ParameterValue>
<ParameterValue><Region>CCF30BF5-30B3-43E6-9CD7-9E1D3CF57626</Region><Parameter>1</Parameter><Value>29800</Value></ParameterValue>
<ParameterValue><Region>CCF30BF5-30B3-43E6-9CD7-9E1D3CF57626</Region><Parameter>2</Parameter><Value>1388.37</Value></ParameterValue>
<ParameterValue><Region>CCF30BF5-30B3-43E6-9CD7-9E1D3CF57626</Region><Parameter>3</Parameter><Value>21.46</Value></ParameterValue>
<ParameterValue><Region>E87D0C11-ECFE-46A7-919A-1FE41C71C0E3</Region><Parameter>1</Parameter><Value>66074</Value></ParameterValue>
<ParameterValue><Region>E87D0C11-ECFE-46A7-919A-1FE41C71C0E3</Region><Parameter>2</Parameter><Value>69.4</Value></ParameterValue>
<ParameterValue><Region>E87D0C11-ECFE-46A7-919A-1FE41C71C0E3</Region><Parameter>3</Parameter><Value>952.12</Value></ParameterValue>
<ParameterValue><Region>44C7A41D-56EE-4AF0-A526-DB1E25C39259</Region><Parameter>1</Parameter><Value>9873</Value></ParameterValue>
<ParameterValue><Region>44C7A41D-56EE-4AF0-A526-DB1E25C39259</Region><Parameter>2</Parameter><Value>91.25</Value></ParameterValue>
<ParameterValue><Region>44C7A41D-56EE-4AF0-A526-DB1E25C39259</Region><Parameter>3</Parameter><Value>108.19</Value></ParameterValue>
<ParameterValue><Region>A6BF1001-B4A7-490D-8322-67FBD3BD6A21</Region><Parameter>1</Parameter><Value>24500</Value></ParameterValue>
<ParameterValue><Region>A6BF1001-B4A7-490D-8322-67FBD3BD6A21</Region><Parameter>2</Parameter><Value>1338.78</Value></ParameterValue>
<ParameterValue><Region>A6BF1001-B4A7-490D-8322-67FBD3BD6A21</Region><Parameter>3</Parameter><Value>18.3</Value></ParameterValue>
<ParameterValue><Region>EF36E41F-F0D4-47C7-B7C0-6C53664C2BEC</Region><Parameter>1</Parameter><Value>18100</Value></ParameterValue>
<ParameterValue><Region>EF36E41F-F0D4-47C7-B7C0-6C53664C2BEC</Region><Parameter>2</Parameter><Value>1335.16</Value></ParameterValue>
<ParameterValue><Region>EF36E41F-F0D4-47C7-B7C0-6C53664C2BEC</Region><Parameter>3</Parameter><Value>13.56</Value></ParameterValue>
<ParameterValue><Region>E4D53EEA-3CC5-4F5A-8CDA-5758C4284444</Region><Parameter>1</Parameter><Value>40800</Value></ParameterValue>
<ParameterValue><Region>E4D53EEA-3CC5-4F5A-8CDA-5758C4284444</Region><Parameter>2</Parameter><Value>1012.16</Value></ParameterValue>
<ParameterValue><Region>E4D53EEA-3CC5-4F5A-8CDA-5758C4284444</Region><Parameter>3</Parameter><Value>40.31</Value></ParameterValue>
<ParameterValue><Region>9C04A206-0C39-43B2-9205-6657F340F19D</Region><Parameter>1</Parameter><Value>27078</Value></ParameterValue>
<ParameterValue><Region>9C04A206-0C39-43B2-9205-6657F340F19D</Region><Parameter>2</Parameter><Value>7118.8</Value></ParameterValue>
<ParameterValue><Region>9C04A206-0C39-43B2-9205-6657F340F19D</Region><Parameter>3</Parameter><Value>3.8</Value></ParameterValue>
<ParameterValue><Region>945F80F0-008D-444E-A429-C046BE03C6B8</Region><Parameter>1</Parameter><Value>22400</Value></ParameterValue>
<ParameterValue><Region>945F80F0-008D-444E-A429-C046BE03C6B8</Region><Parameter>2</Parameter><Value>3197.18</Value></ParameterValue>
<ParameterValue><Region>945F80F0-008D-444E-A429-C046BE03C6B8</Region><Parameter>3</Parameter><Value>7.01</Value></ParameterValue>
<ParameterValue><Region>5CF3AFFD-C55F-42B2-A6FE-282F0D7077FE</Region><Parameter>1</Parameter><Value>31928</Value></ParameterValue>
<ParameterValue><Region>5CF3AFFD-C55F-42B2-A6FE-282F0D7077FE</Region><Parameter>2</Parameter><Value>2026.56</Value></ParameterValue>
<ParameterValue><Region>5CF3AFFD-C55F-42B2-A6FE-282F0D7077FE</Region><Parameter>3</Parameter><Value>15.75</Value></ParameterValue>
<ParameterValue><Region>900E9BA9-FBB6-4CDC-86A8-06338A48942B</Region><Parameter>1</Parameter><Value>13700</Value></ParameterValue>
<ParameterValue><Region>900E9BA9-FBB6-4CDC-86A8-06338A48942B</Region><Parameter>2</Parameter><Value>4580.76</Value></ParameterValue>
<ParameterValue><Region>900E9BA9-FBB6-4CDC-86A8-06338A48942B</Region><Parameter>3</Parameter><Value>2.99</Value></ParameterValue>
<ParameterValue><Region>CF3DE655-447A-4266-ABF0-E50339B80377</Region><Parameter>1</Parameter><Value>27400</Value></ParameterValue>
<ParameterValue><Region>CF3DE655-447A-4266-ABF0-E50339B80377</Region><Parameter>2</Parameter><Value>4741.28</Value></ParameterValue>
<ParameterValue><Region>CF3DE655-447A-4266-ABF0-E50339B80377</Region><Parameter>3</Parameter><Value>5.78</Value></ParameterValue>
<ParameterValue><Region>E7CAA522-4B6F-46D8-B9B7-587B1EC1E250</Region><Parameter>1</Parameter><Value>42450</Value></ParameterValue>
<ParameterValue><Region>E7CAA522-4B6F-46D8-B9B7-587B1EC1E250</Region><Parameter>2</Parameter><Value>4377.16</Value></ParameterValue>
<ParameterValue><Region>E7CAA522-4B6F-46D8-B9B7-587B1EC1E250</Region><Parameter>3</Parameter><Value>9.7</Value></ParameterValue>
<ParameterValue><Region>8C09FCD1-8F86-4EA0-981A-B21AC6BA816D</Region><Parameter>1</Parameter><Value>45075</Value></ParameterValue>
<ParameterValue><Region>8C09FCD1-8F86-4EA0-981A-B21AC6BA816D</Region><Parameter>2</Parameter><Value>1654.83</Value></ParameterValue>
<ParameterValue><Region>8C09FCD1-8F86-4EA0-981A-B21AC6BA816D</Region><Parameter>3</Parameter><Value>27.24</Value></ParameterValue>
<ParameterValue><Region>AC8F9D60-901D-498C-9632-FB9EE61EAB8E</Region><Parameter>1</Parameter><Value>17165</Value></ParameterValue>
<ParameterValue><Region>AC8F9D60-901D-498C-9632-FB9EE61EAB8E</Region><Parameter>2</Parameter><Value>5485.08</Value></ParameterValue>
<ParameterValue><Region>AC8F9D60-901D-498C-9632-FB9EE61EAB8E</Region><Parameter>3</Parameter><Value>3.13</Value></ParameterValue>
<ParameterValue><Region>852F13AE-A20B-44D1-8FB6-0458324078AE</Region><Parameter>1</Parameter><Value>27800</Value></ParameterValue>
<ParameterValue><Region>852F13AE-A20B-44D1-8FB6-0458324078AE</Region><Parameter>2</Parameter><Value>2403.22</Value></ParameterValue>
<ParameterValue><Region>852F13AE-A20B-44D1-8FB6-0458324078AE</Region><Parameter>3</Parameter><Value>11.57</Value></ParameterValue>
<ParameterValue><Region>F4809AEA-9887-420E-8619-F05A9A8718E8</Region><Parameter>1</Parameter><Value>12060</Value></ParameterValue>
<ParameterValue><Region>F4809AEA-9887-420E-8619-F05A9A8718E8</Region><Parameter>2</Parameter><Value>1415.19</Value></ParameterValue>
<ParameterValue><Region>F4809AEA-9887-420E-8619-F05A9A8718E8</Region><Parameter>3</Parameter><Value>8.52</Value></ParameterValue>
<ParameterValue><Region>9C63EFA8-D1AB-4303-8BE3-FF419D44D706</Region><Parameter>1</Parameter><Value>30400</Value></ParameterValue>
<ParameterValue><Region>9C63EFA8-D1AB-4303-8BE3-FF419D44D706</Region><Parameter>2</Parameter><Value>2627.44</Value></ParameterValue>
<ParameterValue><Region>9C63EFA8-D1AB-4303-8BE3-FF419D44D706</Region><Parameter>3</Parameter><Value>11.57</Value></ParameterValue>
<ParameterValue><Region>48C6E828-80F6-49B5-BFD8-0922B10CAB37</Region><Parameter>1</Parameter><Value>34800</Value></ParameterValue>
<ParameterValue><Region>48C6E828-80F6-49B5-BFD8-0922B10CAB37</Region><Parameter>2</Parameter><Value>3437.47</Value></ParameterValue>
<ParameterValue><Region>48C6E828-80F6-49B5-BFD8-0922B10CAB37</Region><Parameter>3</Parameter><Value>10.12</Value></ParameterValue>
<ParameterValue><Region>27600105-2934-4FAA-8779-5809D1763579</Region><Parameter>1</Parameter><Value>52200</Value></ParameterValue>
<ParameterValue><Region>27600105-2934-4FAA-8779-5809D1763579</Region><Parameter>2</Parameter><Value>1675.1</Value></ParameterValue>
<ParameterValue><Region>27600105-2934-4FAA-8779-5809D1763579</Region><Parameter>3</Parameter><Value>31.16</Value></ParameterValue>
<ParameterValue><Region>55451222-1B8F-44C2-81B3-8D632E5A600F</Region><Parameter>1</Parameter><Value>12200</Value></ParameterValue>
<ParameterValue><Region>55451222-1B8F-44C2-81B3-8D632E5A600F</Region><Parameter>2</Parameter><Value>1552.62</Value></ParameterValue>
<ParameterValue><Region>55451222-1B8F-44C2-81B3-8D632E5A600F</Region><Parameter>3</Parameter><Value>7.86</Value></ParameterValue>
<ParameterValue><Region>FE5402C3-DECF-4BBA-B8B8-EF96B1A0D782</Region><Parameter>1</Parameter><Value>20700</Value></ParameterValue>
<ParameterValue><Region>FE5402C3-DECF-4BBA-B8B8-EF96B1A0D782</Region><Parameter>2</Parameter><Value>1682.71</Value></ParameterValue>
<ParameterValue><Region>FE5402C3-DECF-4BBA-B8B8-EF96B1A0D782</Region><Parameter>3</Parameter><Value>12.3</Value></ParameterValue>
<ParameterValue><Region>51F1EA0E-D0DE-4DFA-BDD7-77B82442A144</Region><Parameter>1</Parameter><Value>109800</Value></ParameterValue>
<ParameterValue><Region>51F1EA0E-D0DE-4DFA-BDD7-77B82442A144</Region><Parameter>2</Parameter><Value>2167.48</Value></ParameterValue>
<ParameterValue><Region>51F1EA0E-D0DE-4DFA-BDD7-77B82442A144</Region><Parameter>3</Parameter><Value>50.66</Value></ParameterValue>
<ParameterValue><Region>9DA2C773-E56A-4B86-9FA8-F33371C85068</Region><Parameter>1</Parameter><Value>25800</Value></ParameterValue>
<ParameterValue><Region>9DA2C773-E56A-4B86-9FA8-F33371C85068</Region><Parameter>2</Parameter><Value>15371.77</Value></ParameterValue>
<ParameterValue><Region>9DA2C773-E56A-4B86-9FA8-F33371C85068</Region><Parameter>3</Parameter><Value>1.68</Value></ParameterValue>
<ParameterValue><Region>BA0C4E93-BC84-412C-88E7-7100FC73B423</Region><Parameter>1</Parameter><Value>14600</Value></ParameterValue>
<ParameterValue><Region>BA0C4E93-BC84-412C-88E7-7100FC73B423</Region><Parameter>2</Parameter><Value>1673.42</Value></ParameterValue>
<ParameterValue><Region>BA0C4E93-BC84-412C-88E7-7100FC73B423</Region><Parameter>3</Parameter><Value>8.72</Value></ParameterValue>
<ParameterValue><Region>6ED026C6-8CC9-41A2-A17F-7153408CCA49</Region><Parameter>1</Parameter><Value>16100</Value></ParameterValue>
<ParameterValue><Region>6ED026C6-8CC9-41A2-A17F-7153408CCA49</Region><Parameter>2</Parameter><Value>1420.92</Value></ParameterValue>
<ParameterValue><Region>6ED026C6-8CC9-41A2-A17F-7153408CCA49</Region><Parameter>3</Parameter><Value>11.33</Value></ParameterValue>
<ParameterValue><Region>2ADEA498-EA80-429C-986F-AF480F501D6C</Region><Parameter>1</Parameter><Value>14281</Value></ParameterValue>
<ParameterValue><Region>2ADEA498-EA80-429C-986F-AF480F501D6C</Region><Parameter>2</Parameter><Value>2215.13</Value></ParameterValue>
<ParameterValue><Region>2ADEA498-EA80-429C-986F-AF480F501D6C</Region><Parameter>3</Parameter><Value>6.45</Value></ParameterValue>
<ParameterValue><Region>70170F5F-C65F-4DD6-BE4C-5190021494FB</Region><Parameter>1</Parameter><Value>16977</Value></ParameterValue>
<ParameterValue><Region>70170F5F-C65F-4DD6-BE4C-5190021494FB</Region><Parameter>2</Parameter><Value>1535.3</Value></ParameterValue>
<ParameterValue><Region>70170F5F-C65F-4DD6-BE4C-5190021494FB</Region><Parameter>3</Parameter><Value>11.06</Value></ParameterValue>
<ParameterValue><Region>7F6A8E27-FFEB-4CE1-91E9-07C80964A3F9</Region><Parameter>1</Parameter><Value>14500</Value></ParameterValue>
<ParameterValue><Region>7F6A8E27-FFEB-4CE1-91E9-07C80964A3F9</Region><Parameter>2</Parameter><Value>1403.02</Value></ParameterValue>
<ParameterValue><Region>7F6A8E27-FFEB-4CE1-91E9-07C80964A3F9</Region><Parameter>3</Parameter><Value>10.33</Value></ParameterValue>
<ParameterValue><Region>AA6505FD-16C5-4612-A38E-98CA8545B2CE</Region><Parameter>1</Parameter><Value>16900</Value></ParameterValue>
<ParameterValue><Region>AA6505FD-16C5-4612-A38E-98CA8545B2CE</Region><Parameter>2</Parameter><Value>2522.23</Value></ParameterValue>
<ParameterValue><Region>AA6505FD-16C5-4612-A38E-98CA8545B2CE</Region><Parameter>3</Parameter><Value>6.7</Value></ParameterValue>
<ParameterValue><Region>C52FD184-872A-45D0-85A3-C52023EEF50A</Region><Parameter>1</Parameter><Value>23600</Value></ParameterValue>
<ParameterValue><Region>C52FD184-872A-45D0-85A3-C52023EEF50A</Region><Parameter>2</Parameter><Value>2407.62</Value></ParameterValue>
<ParameterValue><Region>C52FD184-872A-45D0-85A3-C52023EEF50A</Region><Parameter>3</Parameter><Value>9.8</Value></ParameterValue>
<ParameterValue><Region>8E708F8B-4E06-4A89-ADC5-5DFA8CECE8BB</Region><Parameter>1</Parameter><Value>20200</Value></ParameterValue>
<ParameterValue><Region>8E708F8B-4E06-4A89-ADC5-5DFA8CECE8BB</Region><Parameter>2</Parameter><Value>3089.19</Value></ParameterValue>
<ParameterValue><Region>8E708F8B-4E06-4A89-ADC5-5DFA8CECE8BB</Region><Parameter>3</Parameter><Value>6.54</Value></ParameterValue>
<ParameterValue><Region>2EFBCFB1-362F-4915-9390-844E0D8B7DE1</Region><Parameter>1</Parameter><Value>10880</Value></ParameterValue>
<ParameterValue><Region>2EFBCFB1-362F-4915-9390-844E0D8B7DE1</Region><Parameter>2</Parameter><Value>3877.98</Value></ParameterValue>
<ParameterValue><Region>2EFBCFB1-362F-4915-9390-844E0D8B7DE1</Region><Parameter>3</Parameter><Value>2.81</Value></ParameterValue>
<ParameterValue><Region>EBBFB69B-FEA9-4B5B-85AC-76570A113422</Region><Parameter>1</Parameter><Value>6455</Value></ParameterValue>
<ParameterValue><Region>EBBFB69B-FEA9-4B5B-85AC-76570A113422</Region><Parameter>2</Parameter><Value>3510.32</Value></ParameterValue>
<ParameterValue><Region>EBBFB69B-FEA9-4B5B-85AC-76570A113422</Region><Parameter>3</Parameter><Value>1.87</Value></ParameterValue>
<ParameterValue><Region>403AABBD-9346-4FD8-ABAC-4831EE0E27CD</Region><Parameter>1</Parameter><Value>97063</Value></ParameterValue>
<ParameterValue><Region>403AABBD-9346-4FD8-ABAC-4831EE0E27CD</Region><Parameter>2</Parameter><Value>144.41</Value></ParameterValue>
<ParameterValue><Region>403AABBD-9346-4FD8-ABAC-4831EE0E27CD</Region><Parameter>3</Parameter><Value>672.14</Value></ParameterValue>
<ParameterValue><Region>E733F602-56FD-41A6-9DEA-CFB1A2012DEA</Region><Parameter>1</Parameter><Value>156466</Value></ParameterValue>
<ParameterValue><Region>E733F602-56FD-41A6-9DEA-CFB1A2012DEA</Region><Parameter>2</Parameter><Value>428.74</Value></ParameterValue>
<ParameterValue><Region>E733F602-56FD-41A6-9DEA-CFB1A2012DEA</Region><Parameter>3</Parameter><Value>364.94</Value></ParameterValue>
<ParameterValue><Region>F6BFE632-2719-4E88-AA78-FAA5532F27EC</Region><Parameter>1</Parameter><Value>12373</Value></ParameterValue>
<ParameterValue><Region>F6BFE632-2719-4E88-AA78-FAA5532F27EC</Region><Parameter>2</Parameter><Value>2730.94</Value></ParameterValue>
<ParameterValue><Region>F6BFE632-2719-4E88-AA78-FAA5532F27EC</Region><Parameter>3</Parameter><Value>4.53</Value></ParameterValue>
<ParameterValue><Region>ADCD66BA-7C20-4D33-9820-801C01ECF4C0</Region><Parameter>1</Parameter><Value>15813</Value></ParameterValue>
<ParameterValue><Region>ADCD66BA-7C20-4D33-9820-801C01ECF4C0</Region><Parameter>2</Parameter><Value>14988.9</Value></ParameterValue>
<ParameterValue><Region>ADCD66BA-7C20-4D33-9820-801C01ECF4C0</Region><Parameter>3</Parameter><Value>1.05</Value></ParameterValue>
<ParameterValue><Region>40A2C4E1-C81B-49B4-8646-08E86657F123</Region><Parameter>1</Parameter><Value>34800</Value></ParameterValue>
<ParameterValue><Region>40A2C4E1-C81B-49B4-8646-08E86657F123</Region><Parameter>2</Parameter><Value>5565.59</Value></ParameterValue>
<ParameterValue><Region>40A2C4E1-C81B-49B4-8646-08E86657F123</Region><Parameter>3</Parameter><Value>6.25</Value></ParameterValue>
<ParameterValue><Region>ACA4F6D7-5F66-4F9C-B727-A6C771DEBC5F</Region><Parameter>1</Parameter><Value>31700</Value></ParameterValue>
<ParameterValue><Region>ACA4F6D7-5F66-4F9C-B727-A6C771DEBC5F</Region><Parameter>2</Parameter><Value>21061.56</Value></ParameterValue>
<ParameterValue><Region>ACA4F6D7-5F66-4F9C-B727-A6C771DEBC5F</Region><Parameter>3</Parameter><Value>1.51</Value></ParameterValue>
</ParameterValueXData>
}

XData ParameterXData
{
<ParameterXData>
    <Parameter>
    <Name>Население</Name>
    <UnitName>чел.</UnitName>
    </Parameter>
	<Parameter>
	<Name>Площадь</Name>
	<UnitName>кв.км.</UnitName>
	</Parameter>
	<Parameter>
	<Name>Плотность</Name>
	<UnitName>чел./кв.км.</UnitName>
	</Parameter>
</ParameterXData>
}

}

