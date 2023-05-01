Class SE.Utils
{

ClassMethod Setup()
{
	do ..Populate()
	do ##class(%DeepSee.Utils).%BuildCube("SECube",0)
}

ClassMethod Populate() As %Status
{
	do $CLASSMETHOD("SE.Area", "%KillExtent")
	do ..ImportXData("SE.Region", "RegionXData")
	do ..ImportXData("SE.Parameter", "ParameterXData")
	do ..ImportXData("SE.ParameterValue", "ParameterValueXData")
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

		#dim stream As %Stream.Object = ##class(%Dictionary.CompiledXData).%OpenId("SE.Utils"_"||"_xDataName).Data
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
        <Name>Gotlands län</Name>
        <Guid>09</Guid>
        <DataUrl>Gotlands län</DataUrl>
    </Region>
    <Region>
        <Name>Blekinge län</Name>
        <Guid>10</Guid>
        <DataUrl>Blekinge län</DataUrl>
    </Region>
    <Region>
        <Name>Örebro län</Name>
        <Guid>18</Guid>
        <DataUrl>Örebro län</DataUrl>
    </Region>
    <Region>
        <Name>Kronobergs län</Name>
        <Guid>07</Guid>
        <DataUrl>Kronobergs län</DataUrl>
    </Region>
    <Region>
        <Name>Hallands län</Name>
        <Guid>13</Guid>
        <DataUrl>Hallands län</DataUrl>
    </Region>
    <Region>
        <Name>Västra Götalands län</Name>
        <Guid>14</Guid>
        <DataUrl>Västra Götalands län</DataUrl>
    </Region>
    <Region>
        <Name>Jönköpings län</Name>
        <Guid>06</Guid>
        <DataUrl>Jönköpings län</DataUrl>
    </Region>
    <Region>
        <Name>Gävleborgs län</Name>
        <Guid>21</Guid>
        <DataUrl>Gävleborgs län</DataUrl>
    </Region>
    <Region>
        <Name>Norrbottens län</Name>
        <Guid>25</Guid>
        <DataUrl>Norrbottens län</DataUrl>
    </Region>
    <Region>
        <Name>Skåne län</Name>
        <Guid>12</Guid>
        <DataUrl>Skåne län</DataUrl>
    </Region>
    <Region>
        <Name>Kalmar län</Name>
        <Guid>08</Guid>
        <DataUrl>Kalmar län</DataUrl>
    </Region>
    <Region>
        <Name>Östergötlands län</Name>
        <Guid>05</Guid>
        <DataUrl>Östergötlands län</DataUrl>
    </Region>
    <Region>
        <Name>Värmlands län</Name>
        <Guid>17</Guid>
        <DataUrl>Värmlands län</DataUrl>
    </Region>
    <Region>
        <Name>Dalarnas län</Name>
        <Guid>20</Guid>
        <DataUrl>Dalarnas län</DataUrl>
    </Region>
    <Region>
        <Name>Västernorrlands län</Name>
        <Guid>22</Guid>
        <DataUrl>Västernorrlands län</DataUrl>
    </Region>
    <Region>
        <Name>Västerbottens län</Name>
        <Guid>24</Guid>
        <DataUrl>Västerbottens län</DataUrl>
    </Region>
    <Region>
        <Name>Jämtlands län</Name>
        <Guid>23</Guid>
        <DataUrl>Jämtlands län</DataUrl>
    </Region>
    <Region>
        <Name>Södermanlands län</Name>
        <Guid>04</Guid>
        <DataUrl>Södermanlands län</DataUrl>
    </Region>
    <Region>
        <Name>Stockholms län</Name>
        <Guid>01</Guid>
        <DataUrl>Stockholms län</DataUrl>
    </Region>
    <Region>
        <Name>Västmanlands län</Name>
        <Guid>19</Guid>
        <DataUrl>Västmanlands län</DataUrl>
    </Region>
    <Region>
        <Name>Uppsala län</Name>
        <Guid>03</Guid>
        <DataUrl>Uppsala län</DataUrl>
    </Region>
    <Region>
        <Name>Härryda kommun</Name>
        <Guid>1401</Guid>
        <DataUrl>Härryda kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Ockelbo kommun</Name>
        <Guid>2101</Guid>
        <DataUrl>Ockelbo kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Ovanåkers kommun</Name>
        <Guid>2121</Guid>
        <DataUrl>Ovanåkers kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Gotlands kommun</Name>
        <Guid>0980</Guid>
        <DataUrl>Gotlands kommun</DataUrl>
        <ParentRegion>09</ParentRegion>
    </Region>
    <Region>
        <Name>Knivsta kommun</Name>
        <Guid>0330</Guid>
        <DataUrl>Knivsta kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Upplands Väsby kommun</Name>
        <Guid>0114</Guid>
        <DataUrl>Upplands Väsby kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Täby kommun</Name>
        <Guid>0160</Guid>
        <DataUrl>Täby kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Sollentuna kommun</Name>
        <Guid>0163</Guid>
        <DataUrl>Sollentuna kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Danderyds kommun</Name>
        <Guid>0162</Guid>
        <DataUrl>Danderyds kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Gnosjö kommun</Name>
        <Guid>0617</Guid>
        <DataUrl>Gnosjö kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Munkedals kommun</Name>
        <Guid>1430</Guid>
        <DataUrl>Munkedals kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Hylte kommun</Name>
        <Guid>1315</Guid>
        <DataUrl>Hylte kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Älvsbyns kommun</Name>
        <Guid>2560</Guid>
        <DataUrl>Älvsbyns kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Munkfors kommun</Name>
        <Guid>1762</Guid>
        <DataUrl>Munkfors kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Perstorps kommun</Name>
        <Guid>1275</Guid>
        <DataUrl>Perstorps kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Örkelljunga kommun</Name>
        <Guid>1257</Guid>
        <DataUrl>Örkelljunga kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Mjölby kommun</Name>
        <Guid>0586</Guid>
        <DataUrl>Mjölby kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Vilhelmina kommun</Name>
        <Guid>2462</Guid>
        <DataUrl>Vilhelmina kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Sunne kommun</Name>
        <Guid>1766</Guid>
        <DataUrl>Sunne kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Vännäs kommun</Name>
        <Guid>2460</Guid>
        <DataUrl>Vännäs kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Östra Göinge kommun</Name>
        <Guid>1256</Guid>
        <DataUrl>Östra Göinge kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Klippans kommun</Name>
        <Guid>1276</Guid>
        <DataUrl>Klippans kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Vindelns kommun</Name>
        <Guid>2404</Guid>
        <DataUrl>Vindelns kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Eslövs kommun</Name>
        <Guid>1285</Guid>
        <DataUrl>Eslövs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Bollebygds kommun</Name>
        <Guid>1443</Guid>
        <DataUrl>Bollebygds kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Svalövs kommun</Name>
        <Guid>1214</Guid>
        <DataUrl>Svalövs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Tibro kommun</Name>
        <Guid>1472</Guid>
        <DataUrl>Tibro kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Sjöbo kommun</Name>
        <Guid>1265</Guid>
        <DataUrl>Sjöbo kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Töreboda kommun</Name>
        <Guid>1473</Guid>
        <DataUrl>Töreboda kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Forshaga kommun</Name>
        <Guid>1763</Guid>
        <DataUrl>Forshaga kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Kils kommun</Name>
        <Guid>1715</Guid>
        <DataUrl>Kils kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Grums kommun</Name>
        <Guid>1764</Guid>
        <DataUrl>Grums kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Lycksele kommun</Name>
        <Guid>2481</Guid>
        <DataUrl>Lycksele kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Uddevalla kommun</Name>
        <Guid>1485</Guid>
        <DataUrl>Uddevalla kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Färgelanda kommun</Name>
        <Guid>1439</Guid>
        <DataUrl>Färgelanda kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Söderhamns kommun</Name>
        <Guid>2182</Guid>
        <DataUrl>Söderhamns kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Malå kommun</Name>
        <Guid>2418</Guid>
        <DataUrl>Malå kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Norsjö kommun</Name>
        <Guid>2417</Guid>
        <DataUrl>Norsjö kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Sorsele kommun</Name>
        <Guid>2422</Guid>
        <DataUrl>Sorsele kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Arvidsjaurs kommun</Name>
        <Guid>2505</Guid>
        <DataUrl>Arvidsjaurs kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Storumans kommun</Name>
        <Guid>2421</Guid>
        <DataUrl>Storumans kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Arvika kommun</Name>
        <Guid>1784</Guid>
        <DataUrl>Arvika kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Åsele kommun</Name>
        <Guid>2463</Guid>
        <DataUrl>Åsele kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Bollnäs kommun</Name>
        <Guid>2183</Guid>
        <DataUrl>Bollnäs kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Vansbro kommun</Name>
        <Guid>2021</Guid>
        <DataUrl>Vansbro kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Bengtsfors kommun</Name>
        <Guid>1460</Guid>
        <DataUrl>Bengtsfors kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Hällefors kommun</Name>
        <Guid>1863</Guid>
        <DataUrl>Hällefors kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Krokoms kommun</Name>
        <Guid>2309</Guid>
        <DataUrl>Krokoms kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Bergs kommun</Name>
        <Guid>2326</Guid>
        <DataUrl>Bergs kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Åre kommun</Name>
        <Guid>2321</Guid>
        <DataUrl>Åre kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Östersunds kommun</Name>
        <Guid>2380</Guid>
        <DataUrl>Östersunds kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Robertsfors kommun</Name>
        <Guid>2409</Guid>
        <DataUrl>Robertsfors kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Tingsryds kommun</Name>
        <Guid>0763</Guid>
        <DataUrl>Tingsryds kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Emmaboda kommun</Name>
        <Guid>0862</Guid>
        <DataUrl>Emmaboda kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Lessebo kommun</Name>
        <Guid>0761</Guid>
        <DataUrl>Lessebo kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Nybro kommun</Name>
        <Guid>0881</Guid>
        <DataUrl>Nybro kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Växjö kommun</Name>
        <Guid>0780</Guid>
        <DataUrl>Växjö kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Habo kommun</Name>
        <Guid>0643</Guid>
        <DataUrl>Habo kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Hjo kommun</Name>
        <Guid>1497</Guid>
        <DataUrl>Hjo kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Åmåls kommun</Name>
        <Guid>1492</Guid>
        <DataUrl>Åmåls kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Melleruds kommun</Name>
        <Guid>1461</Guid>
        <DataUrl>Melleruds kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Vaggeryds kommun</Name>
        <Guid>0665</Guid>
        <DataUrl>Vaggeryds kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Gnesta kommun</Name>
        <Guid>0461</Guid>
        <DataUrl>Gnesta kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Surahammars kommun</Name>
        <Guid>1907</Guid>
        <DataUrl>Surahammars kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Aneby kommun</Name>
        <Guid>0604</Guid>
        <DataUrl>Aneby kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Vadstena kommun</Name>
        <Guid>0584</Guid>
        <DataUrl>Vadstena kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Tranås kommun</Name>
        <Guid>0687</Guid>
        <DataUrl>Tranås kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Boxholms kommun</Name>
        <Guid>0560</Guid>
        <DataUrl>Boxholms kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Ydre kommun</Name>
        <Guid>0512</Guid>
        <DataUrl>Ydre kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Karlsborgs kommun</Name>
        <Guid>1446</Guid>
        <DataUrl>Karlsborgs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Ödeshögs kommun</Name>
        <Guid>0509</Guid>
        <DataUrl>Ödeshögs kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Mönsterås kommun</Name>
        <Guid>0861</Guid>
        <DataUrl>Mönsterås kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Kalmar kommun</Name>
        <Guid>0880</Guid>
        <DataUrl>Kalmar kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Borgholms kommun</Name>
        <Guid>0885</Guid>
        <DataUrl>Borgholms kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Ronneby kommun</Name>
        <Guid>1081</Guid>
        <DataUrl>Ronneby kommun</DataUrl>
        <ParentRegion>10</ParentRegion>
    </Region>
    <Region>
        <Name>Båstads kommun</Name>
        <Guid>1278</Guid>
        <DataUrl>Båstads kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Lomma kommun</Name>
        <Guid>1262</Guid>
        <DataUrl>Lomma kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Ystads kommun</Name>
        <Guid>1286</Guid>
        <DataUrl>Ystads kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Trelleborgs kommun</Name>
        <Guid>1287</Guid>
        <DataUrl>Trelleborgs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Kävlinge kommun</Name>
        <Guid>1261</Guid>
        <DataUrl>Kävlinge kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Falkenbergs kommun</Name>
        <Guid>1382</Guid>
        <DataUrl>Falkenbergs kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Marks kommun</Name>
        <Guid>1463</Guid>
        <DataUrl>Marks kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Varbergs kommun</Name>
        <Guid>1383</Guid>
        <DataUrl>Varbergs kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Lysekils kommun</Name>
        <Guid>1484</Guid>
        <DataUrl>Lysekils kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Sotenäs kommun</Name>
        <Guid>1427</Guid>
        <DataUrl>Sotenäs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Tjörns kommun</Name>
        <Guid>1419</Guid>
        <DataUrl>Tjörns kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Orust kommun</Name>
        <Guid>1421</Guid>
        <DataUrl>Orust kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Karlstads kommun</Name>
        <Guid>1780</Guid>
        <DataUrl>Karlstads kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Storfors kommun</Name>
        <Guid>1760</Guid>
        <DataUrl>Storfors kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Hammarö kommun</Name>
        <Guid>1761</Guid>
        <DataUrl>Hammarö kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Högsby kommun</Name>
        <Guid>0821</Guid>
        <DataUrl>Högsby kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Uppvidinge kommun</Name>
        <Guid>0760</Guid>
        <DataUrl>Uppvidinge kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Härnösands kommun</Name>
        <Guid>2280</Guid>
        <DataUrl>Härnösands kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Orsa kommun</Name>
        <Guid>2034</Guid>
        <DataUrl>Orsa kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Öckerö kommun</Name>
        <Guid>1407</Guid>
        <DataUrl>Öckerö kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Kungsbacka kommun</Name>
        <Guid>1384</Guid>
        <DataUrl>Kungsbacka kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Bjurholms kommun</Name>
        <Guid>2403</Guid>
        <DataUrl>Bjurholms kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Kramfors kommun</Name>
        <Guid>2282</Guid>
        <DataUrl>Kramfors kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Arjeplogs kommun</Name>
        <Guid>2506</Guid>
        <DataUrl>Arjeplogs kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Alvesta kommun</Name>
        <Guid>0764</Guid>
        <DataUrl>Alvesta kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Värnamo kommun</Name>
        <Guid>0683</Guid>
        <DataUrl>Värnamo kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Tomelilla kommun</Name>
        <Guid>1270</Guid>
        <DataUrl>Tomelilla kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Umeå kommun</Name>
        <Guid>2480</Guid>
        <DataUrl>Umeå kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Sigtuna kommun</Name>
        <Guid>0191</Guid>
        <DataUrl>Sigtuna kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Vallentuna kommun</Name>
        <Guid>0115</Guid>
        <DataUrl>Vallentuna kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Mölndals kommun</Name>
        <Guid>1481</Guid>
        <DataUrl>Mölndals kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Göteborgs kommun</Name>
        <Guid>1480</Guid>
        <DataUrl>Göteborgs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Sölvesborgs kommun</Name>
        <Guid>1083</Guid>
        <DataUrl>Sölvesborgs kommun</DataUrl>
        <ParentRegion>10</ParentRegion>
    </Region>
    <Region>
        <Name>Skurups kommun</Name>
        <Guid>1264</Guid>
        <DataUrl>Skurups kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Stenungsunds kommun</Name>
        <Guid>1415</Guid>
        <DataUrl>Stenungsunds kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Kungälvs kommun</Name>
        <Guid>1482</Guid>
        <DataUrl>Kungälvs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Dals-Eds kommun</Name>
        <Guid>1438</Guid>
        <DataUrl>Dals-Eds kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Ljusnarsbergs kommun</Name>
        <Guid>1864</Guid>
        <DataUrl>Ljusnarsbergs kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Simrishamns kommun</Name>
        <Guid>1291</Guid>
        <DataUrl>Simrishamns kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Osby kommun</Name>
        <Guid>1273</Guid>
        <DataUrl>Osby kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Örnsköldsviks kommun</Name>
        <Guid>2284</Guid>
        <DataUrl>Örnsköldsviks kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Nordmalings kommun</Name>
        <Guid>2401</Guid>
        <DataUrl>Nordmalings kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Kristianstads kommun</Name>
        <Guid>1290</Guid>
        <DataUrl>Kristianstads kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Bromölla kommun</Name>
        <Guid>1272</Guid>
        <DataUrl>Bromölla kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Skinnskattebergs kommun</Name>
        <Guid>1904</Guid>
        <DataUrl>Skinnskattebergs kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Jönköpings kommun</Name>
        <Guid>0680</Guid>
        <DataUrl>Jönköpings kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Ragunda kommun</Name>
        <Guid>2303</Guid>
        <DataUrl>Ragunda kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Kumla kommun</Name>
        <Guid>1881</Guid>
        <DataUrl>Kumla kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Kiruna kommun</Name>
        <Guid>2584</Guid>
        <DataUrl>Kiruna kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Mörbylånga kommun</Name>
        <Guid>0840</Guid>
        <DataUrl>Mörbylånga kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Vellinge kommun</Name>
        <Guid>1233</Guid>
        <DataUrl>Vellinge kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Svedala kommun</Name>
        <Guid>1263</Guid>
        <DataUrl>Svedala kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Malmö kommun</Name>
        <Guid>1280</Guid>
        <DataUrl>Malmö kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Burlövs kommun</Name>
        <Guid>1231</Guid>
        <DataUrl>Burlövs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Nordanstigs kommun</Name>
        <Guid>2132</Guid>
        <DataUrl>Nordanstigs kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Flens kommun</Name>
        <Guid>0482</Guid>
        <DataUrl>Flens kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Fagersta kommun</Name>
        <Guid>1982</Guid>
        <DataUrl>Fagersta kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Norbergs kommun</Name>
        <Guid>1962</Guid>
        <DataUrl>Norbergs kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Avesta kommun</Name>
        <Guid>2084</Guid>
        <DataUrl>Avesta kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Oskarshamns kommun</Name>
        <Guid>0882</Guid>
        <DataUrl>Oskarshamns kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Nykvarns kommun</Name>
        <Guid>0140</Guid>
        <DataUrl>Nykvarns kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Gällivare kommun</Name>
        <Guid>2523</Guid>
        <DataUrl>Gällivare kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Malung-Sälens kommun</Name>
        <Guid>2023</Guid>
        <DataUrl>Malung-Sälens kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Smedjebackens kommun</Name>
        <Guid>2061</Guid>
        <DataUrl>Smedjebackens kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Borlänge kommun</Name>
        <Guid>2081</Guid>
        <DataUrl>Borlänge kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Gagnefs kommun</Name>
        <Guid>2026</Guid>
        <DataUrl>Gagnefs kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Hagfors kommun</Name>
        <Guid>1783</Guid>
        <DataUrl>Hagfors kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Torsby kommun</Name>
        <Guid>1737</Guid>
        <DataUrl>Torsby kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Strömstads kommun</Name>
        <Guid>1486</Guid>
        <DataUrl>Strömstads kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Tanums kommun</Name>
        <Guid>1435</Guid>
        <DataUrl>Tanums kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Karlshamns kommun</Name>
        <Guid>1082</Guid>
        <DataUrl>Karlshamns kommun</DataUrl>
        <ParentRegion>10</ParentRegion>
    </Region>
    <Region>
        <Name>Olofströms kommun</Name>
        <Guid>1060</Guid>
        <DataUrl>Olofströms kommun</DataUrl>
        <ParentRegion>10</ParentRegion>
    </Region>
    <Region>
        <Name>Älmhults kommun</Name>
        <Guid>0765</Guid>
        <DataUrl>Älmhults kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Oxelösunds kommun</Name>
        <Guid>0481</Guid>
        <DataUrl>Oxelösunds kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Söderköpings kommun</Name>
        <Guid>0582</Guid>
        <DataUrl>Söderköpings kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Askersunds kommun</Name>
        <Guid>1882</Guid>
        <DataUrl>Askersunds kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Hallsbergs kommun</Name>
        <Guid>1861</Guid>
        <DataUrl>Hallsbergs kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Finspångs kommun</Name>
        <Guid>0562</Guid>
        <DataUrl>Finspångs kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Karlskrona kommun</Name>
        <Guid>1080</Guid>
        <DataUrl>Karlskrona kommun</DataUrl>
        <ParentRegion>10</ParentRegion>
    </Region>
    <Region>
        <Name>Torsås kommun</Name>
        <Guid>0834</Guid>
        <DataUrl>Torsås kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Lunds kommun</Name>
        <Guid>1281</Guid>
        <DataUrl>Lunds kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Staffanstorps kommun</Name>
        <Guid>1230</Guid>
        <DataUrl>Staffanstorps kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Valdemarsviks kommun</Name>
        <Guid>0563</Guid>
        <DataUrl>Valdemarsviks kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Norrköpings kommun</Name>
        <Guid>0581</Guid>
        <DataUrl>Norrköpings kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Vingåkers kommun</Name>
        <Guid>0428</Guid>
        <DataUrl>Vingåkers kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Kungsörs kommun</Name>
        <Guid>1960</Guid>
        <DataUrl>Kungsörs kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Köpings kommun</Name>
        <Guid>1983</Guid>
        <DataUrl>Köpings kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Skellefteå kommun</Name>
        <Guid>2482</Guid>
        <DataUrl>Skellefteå kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Tierps kommun</Name>
        <Guid>0360</Guid>
        <DataUrl>Tierps kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Älvkarleby kommun</Name>
        <Guid>0319</Guid>
        <DataUrl>Älvkarleby kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Gävle kommun</Name>
        <Guid>2180</Guid>
        <DataUrl>Gävle kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Eskilstuna kommun</Name>
        <Guid>0484</Guid>
        <DataUrl>Eskilstuna kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Hallstahammars kommun</Name>
        <Guid>1961</Guid>
        <DataUrl>Hallstahammars kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Laxå kommun</Name>
        <Guid>1860</Guid>
        <DataUrl>Laxå kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Gullspångs kommun</Name>
        <Guid>1447</Guid>
        <DataUrl>Gullspångs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Kristinehamns kommun</Name>
        <Guid>1781</Guid>
        <DataUrl>Kristinehamns kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Degerfors kommun</Name>
        <Guid>1862</Guid>
        <DataUrl>Degerfors kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Lekebergs kommun</Name>
        <Guid>1814</Guid>
        <DataUrl>Lekebergs kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Arboga kommun</Name>
        <Guid>1984</Guid>
        <DataUrl>Arboga kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Lindesbergs kommun</Name>
        <Guid>1885</Guid>
        <DataUrl>Lindesbergs kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Nora kommun</Name>
        <Guid>1884</Guid>
        <DataUrl>Nora kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Örebro kommun</Name>
        <Guid>1880</Guid>
        <DataUrl>Örebro kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Karlskoga kommun</Name>
        <Guid>1883</Guid>
        <DataUrl>Karlskoga kommun</DataUrl>
        <ParentRegion>18</ParentRegion>
    </Region>
    <Region>
        <Name>Leksands kommun</Name>
        <Guid>2029</Guid>
        <DataUrl>Leksands kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Rättviks kommun</Name>
        <Guid>2031</Guid>
        <DataUrl>Rättviks kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Mariestads kommun</Name>
        <Guid>1493</Guid>
        <DataUrl>Mariestads kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Säffle kommun</Name>
        <Guid>1785</Guid>
        <DataUrl>Säffle kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Årjängs kommun</Name>
        <Guid>1765</Guid>
        <DataUrl>Årjängs kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Eda kommun</Name>
        <Guid>1730</Guid>
        <DataUrl>Eda kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Haparanda kommun</Name>
        <Guid>2583</Guid>
        <DataUrl>Haparanda kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Överkalix kommun</Name>
        <Guid>2513</Guid>
        <DataUrl>Överkalix kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Hultsfreds kommun</Name>
        <Guid>0860</Guid>
        <DataUrl>Hultsfreds kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Eksjö kommun</Name>
        <Guid>0686</Guid>
        <DataUrl>Eksjö kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Härjedalens kommun</Name>
        <Guid>2361</Guid>
        <DataUrl>Härjedalens kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Hudiksvalls kommun</Name>
        <Guid>2184</Guid>
        <DataUrl>Hudiksvalls kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Ljusdals kommun</Name>
        <Guid>2161</Guid>
        <DataUrl>Ljusdals kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Ale kommun</Name>
        <Guid>1440</Guid>
        <DataUrl>Ale kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Bodens kommun</Name>
        <Guid>2582</Guid>
        <DataUrl>Bodens kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Kalix kommun</Name>
        <Guid>2514</Guid>
        <DataUrl>Kalix kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Luleå kommun</Name>
        <Guid>2580</Guid>
        <DataUrl>Luleå kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Piteå kommun</Name>
        <Guid>2581</Guid>
        <DataUrl>Piteå kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Halmstads kommun</Name>
        <Guid>1380</Guid>
        <DataUrl>Halmstads kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Laholms kommun</Name>
        <Guid>1381</Guid>
        <DataUrl>Laholms kommun</DataUrl>
        <ParentRegion>13</ParentRegion>
    </Region>
    <Region>
        <Name>Ljungby kommun</Name>
        <Guid>0781</Guid>
        <DataUrl>Ljungby kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Markaryds kommun</Name>
        <Guid>0767</Guid>
        <DataUrl>Markaryds kommun</DataUrl>
        <ParentRegion>07</ParentRegion>
    </Region>
    <Region>
        <Name>Tranemo kommun</Name>
        <Guid>1452</Guid>
        <DataUrl>Tranemo kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Svenljunga kommun</Name>
        <Guid>1465</Guid>
        <DataUrl>Svenljunga kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Gislaveds kommun</Name>
        <Guid>0662</Guid>
        <DataUrl>Gislaveds kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Mullsjö kommun</Name>
        <Guid>0642</Guid>
        <DataUrl>Mullsjö kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Sandvikens kommun</Name>
        <Guid>2181</Guid>
        <DataUrl>Sandvikens kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Hofors kommun</Name>
        <Guid>2104</Guid>
        <DataUrl>Hofors kommun</DataUrl>
        <ParentRegion>21</ParentRegion>
    </Region>
    <Region>
        <Name>Hedemora kommun</Name>
        <Guid>2083</Guid>
        <DataUrl>Hedemora kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Falu kommun</Name>
        <Guid>2080</Guid>
        <DataUrl>Falu kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Säters kommun</Name>
        <Guid>2082</Guid>
        <DataUrl>Säters kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Ulricehamns kommun</Name>
        <Guid>1491</Guid>
        <DataUrl>Ulricehamns kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Lerums kommun</Name>
        <Guid>1441</Guid>
        <DataUrl>Lerums kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Partille kommun</Name>
        <Guid>1402</Guid>
        <DataUrl>Partille kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Vänersborgs kommun</Name>
        <Guid>1487</Guid>
        <DataUrl>Vänersborgs kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Lilla Edets kommun</Name>
        <Guid>1462</Guid>
        <DataUrl>Lilla Edets kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Trollhättans kommun</Name>
        <Guid>1488</Guid>
        <DataUrl>Trollhättans kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Nyköpings kommun</Name>
        <Guid>0480</Guid>
        <DataUrl>Nyköpings kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Katrineholms kommun</Name>
        <Guid>0483</Guid>
        <DataUrl>Katrineholms kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Jokkmokks kommun</Name>
        <Guid>2510</Guid>
        <DataUrl>Jokkmokks kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Vimmerby kommun</Name>
        <Guid>0884</Guid>
        <DataUrl>Vimmerby kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Kinda kommun</Name>
        <Guid>0513</Guid>
        <DataUrl>Kinda kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Landskrona kommun</Name>
        <Guid>1282</Guid>
        <DataUrl>Landskrona kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Ängelholms kommun</Name>
        <Guid>1292</Guid>
        <DataUrl>Ängelholms kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Bjuvs kommun</Name>
        <Guid>1260</Guid>
        <DataUrl>Bjuvs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Höganäs kommun</Name>
        <Guid>1284</Guid>
        <DataUrl>Höganäs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Åstorps kommun</Name>
        <Guid>1277</Guid>
        <DataUrl>Åstorps kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Sala kommun</Name>
        <Guid>1981</Guid>
        <DataUrl>Sala kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Östhammars kommun</Name>
        <Guid>0382</Guid>
        <DataUrl>Östhammars kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Helsingborgs kommun</Name>
        <Guid>1283</Guid>
        <DataUrl>Helsingborgs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Hässleholms kommun</Name>
        <Guid>1293</Guid>
        <DataUrl>Hässleholms kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Hörby kommun</Name>
        <Guid>1266</Guid>
        <DataUrl>Hörby kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Höörs kommun</Name>
        <Guid>1267</Guid>
        <DataUrl>Höörs kommun</DataUrl>
        <ParentRegion>12</ParentRegion>
    </Region>
    <Region>
        <Name>Vaxholms kommun</Name>
        <Guid>0187</Guid>
        <DataUrl>Vaxholms kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Herrljunga kommun</Name>
        <Guid>1466</Guid>
        <DataUrl>Herrljunga kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Alingsås kommun</Name>
        <Guid>1489</Guid>
        <DataUrl>Alingsås kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Sundbybergs kommun</Name>
        <Guid>0183</Guid>
        <DataUrl>Sundbybergs kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Järfälla kommun</Name>
        <Guid>0123</Guid>
        <DataUrl>Järfälla kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Solna kommun</Name>
        <Guid>0184</Guid>
        <DataUrl>Solna kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Åtvidabergs kommun</Name>
        <Guid>0561</Guid>
        <DataUrl>Åtvidabergs kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Västerviks kommun</Name>
        <Guid>0883</Guid>
        <DataUrl>Västerviks kommun</DataUrl>
        <ParentRegion>08</ParentRegion>
    </Region>
    <Region>
        <Name>Bräcke kommun</Name>
        <Guid>2305</Guid>
        <DataUrl>Bräcke kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Ånge kommun</Name>
        <Guid>2260</Guid>
        <DataUrl>Ånge kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Ludvika kommun</Name>
        <Guid>2085</Guid>
        <DataUrl>Ludvika kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Filipstads kommun</Name>
        <Guid>1782</Guid>
        <DataUrl>Filipstads kommun</DataUrl>
        <ParentRegion>17</ParentRegion>
    </Region>
    <Region>
        <Name>Övertorneå kommun</Name>
        <Guid>2518</Guid>
        <DataUrl>Övertorneå kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Pajala kommun</Name>
        <Guid>2521</Guid>
        <DataUrl>Pajala kommun</DataUrl>
        <ParentRegion>25</ParentRegion>
    </Region>
    <Region>
        <Name>Sollefteå kommun</Name>
        <Guid>2283</Guid>
        <DataUrl>Sollefteå kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Dorotea kommun</Name>
        <Guid>2425</Guid>
        <DataUrl>Dorotea kommun</DataUrl>
        <ParentRegion>24</ParentRegion>
    </Region>
    <Region>
        <Name>Strömsunds kommun</Name>
        <Guid>2313</Guid>
        <DataUrl>Strömsunds kommun</DataUrl>
        <ParentRegion>23</ParentRegion>
    </Region>
    <Region>
        <Name>Norrtälje kommun</Name>
        <Guid>0188</Guid>
        <DataUrl>Norrtälje kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Österåkers kommun</Name>
        <Guid>0117</Guid>
        <DataUrl>Österåkers kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Tyresö kommun</Name>
        <Guid>0138</Guid>
        <DataUrl>Tyresö kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Trosa kommun</Name>
        <Guid>0488</Guid>
        <DataUrl>Trosa kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Nynäshamns kommun</Name>
        <Guid>0192</Guid>
        <DataUrl>Nynäshamns kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Södertälje kommun</Name>
        <Guid>0181</Guid>
        <DataUrl>Södertälje kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Salems kommun</Name>
        <Guid>0128</Guid>
        <DataUrl>Salems kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Botkyrka kommun</Name>
        <Guid>0127</Guid>
        <DataUrl>Botkyrka kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Haninge kommun</Name>
        <Guid>0136</Guid>
        <DataUrl>Haninge kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Ekerö kommun</Name>
        <Guid>0125</Guid>
        <DataUrl>Ekerö kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Strängnäs kommun</Name>
        <Guid>0486</Guid>
        <DataUrl>Strängnäs kommun</DataUrl>
        <ParentRegion>04</ParentRegion>
    </Region>
    <Region>
        <Name>Upplands-Bro kommun</Name>
        <Guid>0139</Guid>
        <DataUrl>Upplands-Bro kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Håbo kommun</Name>
        <Guid>0305</Guid>
        <DataUrl>Håbo kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Uppsala kommun</Name>
        <Guid>0380</Guid>
        <DataUrl>Uppsala kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Heby kommun</Name>
        <Guid>0331</Guid>
        <DataUrl>Heby kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Västerås kommun</Name>
        <Guid>1980</Guid>
        <DataUrl>Västerås kommun</DataUrl>
        <ParentRegion>19</ParentRegion>
    </Region>
    <Region>
        <Name>Enköpings kommun</Name>
        <Guid>0381</Guid>
        <DataUrl>Enköpings kommun</DataUrl>
        <ParentRegion>03</ParentRegion>
    </Region>
    <Region>
        <Name>Linköpings kommun</Name>
        <Guid>0580</Guid>
        <DataUrl>Linköpings kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Motala kommun</Name>
        <Guid>0583</Guid>
        <DataUrl>Motala kommun</DataUrl>
        <ParentRegion>05</ParentRegion>
    </Region>
    <Region>
        <Name>Sundsvalls kommun</Name>
        <Guid>2281</Guid>
        <DataUrl>Sundsvalls kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Timrå kommun</Name>
        <Guid>2262</Guid>
        <DataUrl>Timrå kommun</DataUrl>
        <ParentRegion>22</ParentRegion>
    </Region>
    <Region>
        <Name>Huddinge kommun</Name>
        <Guid>0126</Guid>
        <DataUrl>Huddinge kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Stockholms kommun</Name>
        <Guid>0180</Guid>
        <DataUrl>Stockholms kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Tidaholms kommun</Name>
        <Guid>1498</Guid>
        <DataUrl>Tidaholms kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Lidingö kommun</Name>
        <Guid>0186</Guid>
        <DataUrl>Lidingö kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Falköpings kommun</Name>
        <Guid>1499</Guid>
        <DataUrl>Falköpings kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Skövde kommun</Name>
        <Guid>1496</Guid>
        <DataUrl>Skövde kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Götene kommun</Name>
        <Guid>1471</Guid>
        <DataUrl>Götene kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Skara kommun</Name>
        <Guid>1495</Guid>
        <DataUrl>Skara kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Älvdalens kommun</Name>
        <Guid>2039</Guid>
        <DataUrl>Älvdalens kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Mora kommun</Name>
        <Guid>2062</Guid>
        <DataUrl>Mora kommun</DataUrl>
        <ParentRegion>20</ParentRegion>
    </Region>
    <Region>
        <Name>Vetlanda kommun</Name>
        <Guid>0685</Guid>
        <DataUrl>Vetlanda kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Sävsjö kommun</Name>
        <Guid>0684</Guid>
        <DataUrl>Sävsjö kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Nässjö kommun</Name>
        <Guid>0682</Guid>
        <DataUrl>Nässjö kommun</DataUrl>
        <ParentRegion>06</ParentRegion>
    </Region>
    <Region>
        <Name>Nacka kommun</Name>
        <Guid>0182</Guid>
        <DataUrl>Nacka kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Värmdö kommun</Name>
        <Guid>0120</Guid>
        <DataUrl>Värmdö kommun</DataUrl>
        <ParentRegion>01</ParentRegion>
    </Region>
    <Region>
        <Name>Borås kommun</Name>
        <Guid>1490</Guid>
        <DataUrl>Borås kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Vårgårda kommun</Name>
        <Guid>1442</Guid>
        <DataUrl>Vårgårda kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Grästorps kommun</Name>
        <Guid>1444</Guid>
        <DataUrl>Grästorps kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Essunga kommun</Name>
        <Guid>1445</Guid>
        <DataUrl>Essunga kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Vara kommun</Name>
        <Guid>1470</Guid>
        <DataUrl>Vara kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
    <Region>
        <Name>Lidköpings kommun</Name>
        <Guid>1494</Guid>
        <DataUrl>Lidköpings kommun</DataUrl>
        <ParentRegion>14</ParentRegion>
    </Region>
</RegionXData>
}

XData ParameterValueXData
{
<ParameterValueXData>
    <ParameterValue>
        <Region>09</Region>
        <Parameter>1</Parameter>
        <Value>58114</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>09</Region>
        <Parameter>2</Parameter>
        <Value>3183.7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>10</Region>
        <Parameter>1</Parameter>
        <Value>158819</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>10</Region>
        <Parameter>2</Parameter>
        <Value>2941</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>18</Region>
        <Parameter>1</Parameter>
        <Value>295725</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>18</Region>
        <Parameter>2</Parameter>
        <Value>8517</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>07</Region>
        <Parameter>1</Parameter>
        <Value>195484</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>07</Region>
        <Parameter>2</Parameter>
        <Value>8458</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>13</Region>
        <Parameter>1</Parameter>
        <Value>320960</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>13</Region>
        <Parameter>2</Parameter>
        <Value>5454</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>14</Region>
        <Parameter>1</Parameter>
        <Value>1676588</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>14</Region>
        <Parameter>2</Parameter>
        <Value>23942</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>06</Region>
        <Parameter>1</Parameter>
        <Value>353817</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>06</Region>
        <Parameter>2</Parameter>
        <Value>10475</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>21</Region>
        <Parameter>1</Parameter>
        <Value>284802</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>21</Region>
        <Parameter>2</Parameter>
        <Value>18191</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>25</Region>
        <Parameter>1</Parameter>
        <Value>250609</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>25</Region>
        <Parameter>2</Parameter>
        <Value>98911</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>12</Region>
        <Parameter>1</Parameter>
        <Value>1329111</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>12</Region>
        <Parameter>2</Parameter>
        <Value>11302</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>08</Region>
        <Parameter>1</Parameter>
        <Value>242185</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>08</Region>
        <Parameter>2</Parameter>
        <Value>11171</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>05</Region>
        <Parameter>1</Parameter>
        <Value>242185</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>05</Region>
        <Parameter>2</Parameter>
        <Value>11171</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>17</Region>
        <Parameter>1</Parameter>
        <Value>279583</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>17</Region>
        <Parameter>2</Parameter>
        <Value>17583</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>20</Region>
        <Parameter>1</Parameter>
        <Value>284939</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>20</Region>
        <Parameter>2</Parameter>
        <Value>28193</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>22</Region>
        <Parameter>1</Parameter>
        <Value>245944</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>22</Region>
        <Parameter>2</Parameter>
        <Value>21678</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>24</Region>
        <Parameter>1</Parameter>
        <Value>266318</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>24</Region>
        <Parameter>2</Parameter>
        <Value>55432</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>23</Region>
        <Parameter>1</Parameter>
        <Value>128985</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>23</Region>
        <Parameter>2</Parameter>
        <Value>49443</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>04</Region>
        <Parameter>1</Parameter>
        <Value>288909</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>04</Region>
        <Parameter>2</Parameter>
        <Value>6060</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>01</Region>
        <Parameter>1</Parameter>
        <Value>2277856</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>01</Region>
        <Parameter>2</Parameter>
        <Value>6519</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>19</Region>
        <Parameter>1</Parameter>
        <Value>268560</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>19</Region>
        <Parameter>2</Parameter>
        <Value>5146</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>03</Region>
        <Parameter>1</Parameter>
        <Value>362989</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>03</Region>
        <Parameter>2</Parameter>
        <Value>8209</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1401</Region>
        <Parameter>1</Parameter>
        <Value>37185</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1401</Region>
        <Parameter>2</Parameter>
        <Value>291.66</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2101</Region>
        <Parameter>1</Parameter>
        <Value>5859</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2101</Region>
        <Parameter>2</Parameter>
        <Value>1129.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2121</Region>
        <Parameter>1</Parameter>
        <Value>11585</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2121</Region>
        <Parameter>2</Parameter>
        <Value>2016.98</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0980</Region>
        <Parameter>1</Parameter>
        <Value>58114</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0980</Region>
        <Parameter>2</Parameter>
        <Value>3166.75</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0330</Region>
        <Parameter>1</Parameter>
        <Value>17533</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0330</Region>
        <Parameter>2</Parameter>
        <Value>295.11</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0114</Region>
        <Parameter>1</Parameter>
        <Value>44085</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0114</Region>
        <Parameter>2</Parameter>
        <Value>83.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0160</Region>
        <Parameter>1</Parameter>
        <Value>69561</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0160</Region>
        <Parameter>2</Parameter>
        <Value>66.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0163</Region>
        <Parameter>1</Parameter>
        <Value>71090</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0163</Region>
        <Parameter>2</Parameter>
        <Value>55.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0162</Region>
        <Parameter>1</Parameter>
        <Value>32704</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0162</Region>
        <Parameter>2</Parameter>
        <Value>26.55</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0617</Region>
        <Parameter>1</Parameter>
        <Value>9675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0617</Region>
        <Parameter>2</Parameter>
        <Value>450.05</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1430</Region>
        <Parameter>1</Parameter>
        <Value>10370</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1430</Region>
        <Parameter>2</Parameter>
        <Value>667.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1315</Region>
        <Parameter>1</Parameter>
        <Value>11028</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1315</Region>
        <Parameter>2</Parameter>
        <Value>1046.6</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2560</Region>
        <Parameter>1</Parameter>
        <Value>8235</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2560</Region>
        <Parameter>2</Parameter>
        <Value>1795.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1762</Region>
        <Parameter>1</Parameter>
        <Value>3751</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1762</Region>
        <Parameter>2</Parameter>
        <Value>147.97</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1275</Region>
        <Parameter>1</Parameter>
        <Value>7354</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1275</Region>
        <Parameter>2</Parameter>
        <Value>161.93</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1257</Region>
        <Parameter>1</Parameter>
        <Value>9949</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1257</Region>
        <Parameter>2</Parameter>
        <Value>329.7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0586</Region>
        <Parameter>1</Parameter>
        <Value>26791</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0586</Region>
        <Parameter>2</Parameter>
        <Value>557.38</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2462</Region>
        <Parameter>1</Parameter>
        <Value>6777</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2462</Region>
        <Parameter>2</Parameter>
        <Value>8740.52</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1766</Region>
        <Parameter>1</Parameter>
        <Value>13430</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1766</Region>
        <Parameter>2</Parameter>
        <Value>1448.25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2460</Region>
        <Parameter>1</Parameter>
        <Value>8709</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2460</Region>
        <Parameter>2</Parameter>
        <Value>553.7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1256</Region>
        <Parameter>1</Parameter>
        <Value>14468</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1256</Region>
        <Parameter>2</Parameter>
        <Value>451.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1276</Region>
        <Parameter>1</Parameter>
        <Value>17304</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1276</Region>
        <Parameter>2</Parameter>
        <Value>379.41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2404</Region>
        <Parameter>1</Parameter>
        <Value>5417</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2404</Region>
        <Parameter>2</Parameter>
        <Value>2846.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1285</Region>
        <Parameter>1</Parameter>
        <Value>32970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1285</Region>
        <Parameter>2</Parameter>
        <Value>424.68</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1443</Region>
        <Parameter>1</Parameter>
        <Value>9151</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1443</Region>
        <Parameter>2</Parameter>
        <Value>282.39</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1214</Region>
        <Parameter>1</Parameter>
        <Value>13956</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1214</Region>
        <Parameter>2</Parameter>
        <Value>388.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1472</Region>
        <Parameter>1</Parameter>
        <Value>11099</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1472</Region>
        <Parameter>2</Parameter>
        <Value>235.2</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1265</Region>
        <Parameter>1</Parameter>
        <Value>18773</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1265</Region>
        <Parameter>2</Parameter>
        <Value>506.64</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1473</Region>
        <Parameter>1</Parameter>
        <Value>9479</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1473</Region>
        <Parameter>2</Parameter>
        <Value>591.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1763</Region>
        <Parameter>1</Parameter>
        <Value>11471</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1763</Region>
        <Parameter>2</Parameter>
        <Value>397.29</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1715</Region>
        <Parameter>1</Parameter>
        <Value>11797</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1715</Region>
        <Parameter>2</Parameter>
        <Value>406.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1764</Region>
        <Parameter>1</Parameter>
        <Value>9093</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1764</Region>
        <Parameter>2</Parameter>
        <Value>478.81</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2481</Region>
        <Parameter>1</Parameter>
        <Value>12226</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2481</Region>
        <Parameter>2</Parameter>
        <Value>5888.93</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1485</Region>
        <Parameter>1</Parameter>
        <Value>55270</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1485</Region>
        <Parameter>2</Parameter>
        <Value>650.31</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1439</Region>
        <Parameter>1</Parameter>
        <Value>6634</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1439</Region>
        <Parameter>2</Parameter>
        <Value>618.32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2182</Region>
        <Parameter>1</Parameter>
        <Value>25930</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2182</Region>
        <Parameter>2</Parameter>
        <Value>1171.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2418</Region>
        <Parameter>1</Parameter>
        <Value>3105</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2418</Region>
        <Parameter>2</Parameter>
        <Value>1727.48</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2417</Region>
        <Parameter>1</Parameter>
        <Value>4105</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2417</Region>
        <Parameter>2</Parameter>
        <Value>1923.58</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2422</Region>
        <Parameter>1</Parameter>
        <Value>2521</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2422</Region>
        <Parameter>2</Parameter>
        <Value>7957.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2505</Region>
        <Parameter>1</Parameter>
        <Value>6448</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2505</Region>
        <Parameter>2</Parameter>
        <Value>6126.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2421</Region>
        <Parameter>1</Parameter>
        <Value>5887</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2421</Region>
        <Parameter>2</Parameter>
        <Value>8234.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1784</Region>
        <Parameter>1</Parameter>
        <Value>25998</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1784</Region>
        <Parameter>2</Parameter>
        <Value>1956.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2463</Region>
        <Parameter>1</Parameter>
        <Value>2847</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2463</Region>
        <Parameter>2</Parameter>
        <Value>4543.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2183</Region>
        <Parameter>1</Parameter>
        <Value>26880</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2183</Region>
        <Parameter>2</Parameter>
        <Value>1976.64</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2021</Region>
        <Parameter>1</Parameter>
        <Value>6851</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2021</Region>
        <Parameter>2</Parameter>
        <Value>1657.34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1460</Region>
        <Parameter>1</Parameter>
        <Value>9915</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1460</Region>
        <Parameter>2</Parameter>
        <Value>1059.18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1863</Region>
        <Parameter>1</Parameter>
        <Value>7062</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1863</Region>
        <Parameter>2</Parameter>
        <Value>1151.26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2309</Region>
        <Parameter>1</Parameter>
        <Value>14840</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2309</Region>
        <Parameter>2</Parameter>
        <Value>6812.61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2326</Region>
        <Parameter>1</Parameter>
        <Value>7113</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2326</Region>
        <Parameter>2</Parameter>
        <Value>6145.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2321</Region>
        <Parameter>1</Parameter>
        <Value>11116</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2321</Region>
        <Parameter>2</Parameter>
        <Value>8236.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2380</Region>
        <Parameter>1</Parameter>
        <Value>62028</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2380</Region>
        <Parameter>2</Parameter>
        <Value>2501.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2409</Region>
        <Parameter>1</Parameter>
        <Value>6801</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2409</Region>
        <Parameter>2</Parameter>
        <Value>1313.38</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0763</Region>
        <Parameter>1</Parameter>
        <Value>12382</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0763</Region>
        <Parameter>2</Parameter>
        <Value>1207.25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0862</Region>
        <Parameter>1</Parameter>
        <Value>9326</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0862</Region>
        <Parameter>2</Parameter>
        <Value>718.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0761</Region>
        <Parameter>1</Parameter>
        <Value>8760</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0761</Region>
        <Parameter>2</Parameter>
        <Value>456.36</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0881</Region>
        <Parameter>1</Parameter>
        <Value>20235</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0881</Region>
        <Parameter>2</Parameter>
        <Value>1201.63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0780</Region>
        <Parameter>1</Parameter>
        <Value>89983</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0780</Region>
        <Parameter>2</Parameter>
        <Value>1914.25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0643</Region>
        <Parameter>1</Parameter>
        <Value>11623</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0643</Region>
        <Parameter>2</Parameter>
        <Value>462.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1497</Region>
        <Parameter>1</Parameter>
        <Value>9077</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1497</Region>
        <Parameter>2</Parameter>
        <Value>584.47</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1492</Region>
        <Parameter>1</Parameter>
        <Value>12802</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1492</Region>
        <Parameter>2</Parameter>
        <Value>889.72</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1461</Region>
        <Parameter>1</Parameter>
        <Value>9415</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1461</Region>
        <Parameter>2</Parameter>
        <Value>944.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0665</Region>
        <Parameter>1</Parameter>
        <Value>13700</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0665</Region>
        <Parameter>2</Parameter>
        <Value>858.15</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0461</Region>
        <Parameter>1</Parameter>
        <Value>10839</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0461</Region>
        <Parameter>2</Parameter>
        <Value>538.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1907</Region>
        <Parameter>1</Parameter>
        <Value>10019</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1907</Region>
        <Parameter>2</Parameter>
        <Value>368.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0604</Region>
        <Parameter>1</Parameter>
        <Value>6649</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0604</Region>
        <Parameter>2</Parameter>
        <Value>553.89</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0584</Region>
        <Parameter>1</Parameter>
        <Value>7334</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0584</Region>
        <Parameter>2</Parameter>
        <Value>413.26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0687</Region>
        <Parameter>1</Parameter>
        <Value>18811</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0687</Region>
        <Parameter>2</Parameter>
        <Value>437.74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0560</Region>
        <Parameter>1</Parameter>
        <Value>5394</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0560</Region>
        <Parameter>2</Parameter>
        <Value>603.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0512</Region>
        <Parameter>1</Parameter>
        <Value>3691</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0512</Region>
        <Parameter>2</Parameter>
        <Value>778.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1446</Region>
        <Parameter>1</Parameter>
        <Value>6938</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1446</Region>
        <Parameter>2</Parameter>
        <Value>797.32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0509</Region>
        <Parameter>1</Parameter>
        <Value>5364</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0509</Region>
        <Parameter>2</Parameter>
        <Value>668.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0861</Region>
        <Parameter>1</Parameter>
        <Value>13401</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0861</Region>
        <Parameter>2</Parameter>
        <Value>608.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0880</Region>
        <Parameter>1</Parameter>
        <Value>66783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0880</Region>
        <Parameter>2</Parameter>
        <Value>960.58</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0885</Region>
        <Parameter>1</Parameter>
        <Value>10868</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0885</Region>
        <Parameter>2</Parameter>
        <Value>681.4</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1081</Region>
        <Parameter>1</Parameter>
        <Value>29345</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1081</Region>
        <Parameter>2</Parameter>
        <Value>861.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1278</Region>
        <Parameter>1</Parameter>
        <Value>14629</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1278</Region>
        <Parameter>2</Parameter>
        <Value>217.75</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1262</Region>
        <Parameter>1</Parameter>
        <Value>23967</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1262</Region>
        <Parameter>2</Parameter>
        <Value>56.34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1286</Region>
        <Parameter>1</Parameter>
        <Value>29486</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1286</Region>
        <Parameter>2</Parameter>
        <Value>355.04</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1287</Region>
        <Parameter>1</Parameter>
        <Value>44120</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1287</Region>
        <Parameter>2</Parameter>
        <Value>342.18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1261</Region>
        <Parameter>1</Parameter>
        <Value>30563</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1261</Region>
        <Parameter>2</Parameter>
        <Value>153.63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1382</Region>
        <Parameter>1</Parameter>
        <Value>43832</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1382</Region>
        <Parameter>2</Parameter>
        <Value>1156.34</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1463</Region>
        <Parameter>1</Parameter>
        <Value>34343</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1463</Region>
        <Parameter>2</Parameter>
        <Value>1013.2</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1383</Region>
        <Parameter>1</Parameter>
        <Value>62038</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1383</Region>
        <Parameter>2</Parameter>
        <Value>909.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1484</Region>
        <Parameter>1</Parameter>
        <Value>14593</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1484</Region>
        <Parameter>2</Parameter>
        <Value>209.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1427</Region>
        <Parameter>1</Parameter>
        <Value>9049</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1427</Region>
        <Parameter>2</Parameter>
        <Value>139.43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1419</Region>
        <Parameter>1</Parameter>
        <Value>15675</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1419</Region>
        <Parameter>2</Parameter>
        <Value>168.15</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1421</Region>
        <Parameter>1</Parameter>
        <Value>15074</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1421</Region>
        <Parameter>2</Parameter>
        <Value>391.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1780</Region>
        <Parameter>1</Parameter>
        <Value>90475</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1780</Region>
        <Parameter>2</Parameter>
        <Value>1517.74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1760</Region>
        <Parameter>1</Parameter>
        <Value>4076</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1760</Region>
        <Parameter>2</Parameter>
        <Value>472.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1761</Region>
        <Parameter>1</Parameter>
        <Value>15805</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1761</Region>
        <Parameter>2</Parameter>
        <Value>464.15</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0821</Region>
        <Parameter>1</Parameter>
        <Value>6053</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0821</Region>
        <Parameter>2</Parameter>
        <Value>799.42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0760</Region>
        <Parameter>1</Parameter>
        <Value>9526</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0760</Region>
        <Parameter>2</Parameter>
        <Value>1226.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2280</Region>
        <Parameter>1</Parameter>
        <Value>25368</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2280</Region>
        <Parameter>2</Parameter>
        <Value>1100.96</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2034</Region>
        <Parameter>1</Parameter>
        <Value>6881</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2034</Region>
        <Parameter>2</Parameter>
        <Value>1797.39</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1407</Region>
        <Parameter>1</Parameter>
        <Value>12818</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1407</Region>
        <Parameter>2</Parameter>
        <Value>25.88</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1384</Region>
        <Parameter>1</Parameter>
        <Value>80610</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1384</Region>
        <Parameter>2</Parameter>
        <Value>641.77</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2403</Region>
        <Parameter>1</Parameter>
        <Value>2439</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2403</Region>
        <Parameter>2</Parameter>
        <Value>1363.76</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2282</Region>
        <Parameter>1</Parameter>
        <Value>18669</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2282</Region>
        <Parameter>2</Parameter>
        <Value>1785.06</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2506</Region>
        <Parameter>1</Parameter>
        <Value>2870</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2506</Region>
        <Parameter>2</Parameter>
        <Value>14494.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0764</Region>
        <Parameter>1</Parameter>
        <Value>19889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0764</Region>
        <Parameter>2</Parameter>
        <Value>1074.26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0683</Region>
        <Parameter>1</Parameter>
        <Value>33924</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0683</Region>
        <Parameter>2</Parameter>
        <Value>1382.43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1270</Region>
        <Parameter>1</Parameter>
        <Value>13350</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1270</Region>
        <Parameter>2</Parameter>
        <Value>397.39</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2480</Region>
        <Parameter>1</Parameter>
        <Value>123405</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2480</Region>
        <Parameter>2</Parameter>
        <Value>2397.61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0191</Region>
        <Parameter>1</Parameter>
        <Value>46612</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0191</Region>
        <Parameter>2</Parameter>
        <Value>350.26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0115</Region>
        <Parameter>1</Parameter>
        <Value>32923</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0115</Region>
        <Parameter>2</Parameter>
        <Value>368.45</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1481</Region>
        <Parameter>1</Parameter>
        <Value>64841</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1481</Region>
        <Parameter>2</Parameter>
        <Value>152.28</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1480</Region>
        <Parameter>1</Parameter>
        <Value>558638</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1480</Region>
        <Parameter>2</Parameter>
        <Value>462.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1083</Region>
        <Parameter>1</Parameter>
        <Value>17430</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1083</Region>
        <Parameter>2</Parameter>
        <Value>185.89</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1264</Region>
        <Parameter>1</Parameter>
        <Value>15431</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1264</Region>
        <Parameter>2</Parameter>
        <Value>195.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1415</Region>
        <Parameter>1</Parameter>
        <Value>25972</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1415</Region>
        <Parameter>2</Parameter>
        <Value>265.89</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1482</Region>
        <Parameter>1</Parameter>
        <Value>43428</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1482</Region>
        <Parameter>2</Parameter>
        <Value>370.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1438</Region>
        <Parameter>1</Parameter>
        <Value>4779</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1438</Region>
        <Parameter>2</Parameter>
        <Value>825.43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1864</Region>
        <Parameter>1</Parameter>
        <Value>4970</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1864</Region>
        <Parameter>2</Parameter>
        <Value>631.1</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1291</Region>
        <Parameter>1</Parameter>
        <Value>19461</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1291</Region>
        <Parameter>2</Parameter>
        <Value>393.44</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1273</Region>
        <Parameter>1</Parameter>
        <Value>13163</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1273</Region>
        <Parameter>2</Parameter>
        <Value>599.85</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2284</Region>
        <Parameter>1</Parameter>
        <Value>56091</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2284</Region>
        <Parameter>2</Parameter>
        <Value>6739.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2401</Region>
        <Parameter>1</Parameter>
        <Value>7077</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2401</Region>
        <Parameter>2</Parameter>
        <Value>1269.8</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1290</Region>
        <Parameter>1</Parameter>
        <Value>83403</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1290</Region>
        <Parameter>2</Parameter>
        <Value>1339.35</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1272</Region>
        <Parameter>1</Parameter>
        <Value>12618</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1272</Region>
        <Parameter>2</Parameter>
        <Value>185.27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1904</Region>
        <Parameter>1</Parameter>
        <Value>4459</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1904</Region>
        <Parameter>2</Parameter>
        <Value>718.18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0680</Region>
        <Parameter>1</Parameter>
        <Value>135783</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0680</Region>
        <Parameter>2</Parameter>
        <Value>1925.01</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2303</Region>
        <Parameter>1</Parameter>
        <Value>5407</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2303</Region>
        <Parameter>2</Parameter>
        <Value>2633.1</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1881</Region>
        <Parameter>1</Parameter>
        <Value>21435</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1881</Region>
        <Parameter>2</Parameter>
        <Value>205.79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2584</Region>
        <Parameter>1</Parameter>
        <Value>23194</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2584</Region>
        <Parameter>2</Parameter>
        <Value>20551.45</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0840</Region>
        <Parameter>1</Parameter>
        <Value>14863</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0840</Region>
        <Parameter>2</Parameter>
        <Value>668.45</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1233</Region>
        <Parameter>1</Parameter>
        <Value>35305</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1233</Region>
        <Parameter>2</Parameter>
        <Value>143.85</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1263</Region>
        <Parameter>1</Parameter>
        <Value>20837</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1263</Region>
        <Parameter>2</Parameter>
        <Value>227.11</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1280</Region>
        <Parameter>1</Parameter>
        <Value>329903</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1280</Region>
        <Parameter>2</Parameter>
        <Value>158.36</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1231</Region>
        <Parameter>1</Parameter>
        <Value>17638</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1231</Region>
        <Parameter>2</Parameter>
        <Value>19.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2132</Region>
        <Parameter>1</Parameter>
        <Value>9462</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2132</Region>
        <Parameter>2</Parameter>
        <Value>1455.33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0482</Region>
        <Parameter>1</Parameter>
        <Value>16861</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0482</Region>
        <Parameter>2</Parameter>
        <Value>826.04</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1982</Region>
        <Parameter>1</Parameter>
        <Value>13456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1982</Region>
        <Parameter>2</Parameter>
        <Value>310.4</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1962</Region>
        <Parameter>1</Parameter>
        <Value>5811</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1962</Region>
        <Parameter>2</Parameter>
        <Value>447.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2084</Region>
        <Parameter>1</Parameter>
        <Value>23208</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2084</Region>
        <Parameter>2</Parameter>
        <Value>669.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0882</Region>
        <Parameter>1</Parameter>
        <Value>26873</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0882</Region>
        <Parameter>2</Parameter>
        <Value>1094.97</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0140</Region>
        <Parameter>1</Parameter>
        <Value>10437</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0140</Region>
        <Parameter>2</Parameter>
        <Value>176.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2523</Region>
        <Parameter>1</Parameter>
        <Value>17942</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2523</Region>
        <Parameter>2</Parameter>
        <Value>16818.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2023</Region>
        <Parameter>1</Parameter>
        <Value>10112</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2023</Region>
        <Parameter>2</Parameter>
        <Value>4312.5</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2061</Region>
        <Parameter>1</Parameter>
        <Value>10853</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2061</Region>
        <Parameter>2</Parameter>
        <Value>1057.81</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2081</Region>
        <Parameter>1</Parameter>
        <Value>51710</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2081</Region>
        <Parameter>2</Parameter>
        <Value>635.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2026</Region>
        <Parameter>1</Parameter>
        <Value>10179</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2026</Region>
        <Parameter>2</Parameter>
        <Value>812.33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1783</Region>
        <Parameter>1</Parameter>
        <Value>11889</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1783</Region>
        <Parameter>2</Parameter>
        <Value>2000.15</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1737</Region>
        <Parameter>1</Parameter>
        <Value>12075</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1737</Region>
        <Parameter>2</Parameter>
        <Value>4357.42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1486</Region>
        <Parameter>1</Parameter>
        <Value>13061</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1486</Region>
        <Parameter>2</Parameter>
        <Value>477.6</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1435</Region>
        <Parameter>1</Parameter>
        <Value>12596</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1435</Region>
        <Parameter>2</Parameter>
        <Value>954.84</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1082</Region>
        <Parameter>1</Parameter>
        <Value>32193</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1082</Region>
        <Parameter>2</Parameter>
        <Value>508.6</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1060</Region>
        <Parameter>1</Parameter>
        <Value>13423</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1060</Region>
        <Parameter>2</Parameter>
        <Value>413.44</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0765</Region>
        <Parameter>1</Parameter>
        <Value>16763</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0765</Region>
        <Parameter>2</Parameter>
        <Value>978.22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0481</Region>
        <Parameter>1</Parameter>
        <Value>11976</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0481</Region>
        <Parameter>2</Parameter>
        <Value>35.59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0582</Region>
        <Parameter>1</Parameter>
        <Value>14452</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0582</Region>
        <Parameter>2</Parameter>
        <Value>693.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1882</Region>
        <Parameter>1</Parameter>
        <Value>11239</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1882</Region>
        <Parameter>2</Parameter>
        <Value>1019.74</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1861</Region>
        <Parameter>1</Parameter>
        <Value>15715</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1861</Region>
        <Parameter>2</Parameter>
        <Value>670.22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0562</Region>
        <Parameter>1</Parameter>
        <Value>21540</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0562</Region>
        <Parameter>2</Parameter>
        <Value>1215.04</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1080</Region>
        <Parameter>1</Parameter>
        <Value>66428</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1080</Region>
        <Parameter>2</Parameter>
        <Value>1069.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0834</Region>
        <Parameter>1</Parameter>
        <Value>7035</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0834</Region>
        <Parameter>2</Parameter>
        <Value>469.94</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1281</Region>
        <Parameter>1</Parameter>
        <Value>119176</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1281</Region>
        <Parameter>2</Parameter>
        <Value>439.91</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1230</Region>
        <Parameter>1</Parameter>
        <Value>23777</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1230</Region>
        <Parameter>2</Parameter>
        <Value>107.27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0563</Region>
        <Parameter>1</Parameter>
        <Value>7849</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0563</Region>
        <Parameter>2</Parameter>
        <Value>777.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0581</Region>
        <Parameter>1</Parameter>
        <Value>139950</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0581</Region>
        <Parameter>2</Parameter>
        <Value>1604.51</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0428</Region>
        <Parameter>1</Parameter>
        <Value>9155</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0428</Region>
        <Parameter>2</Parameter>
        <Value>439.45</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1960</Region>
        <Parameter>1</Parameter>
        <Value>8505</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1960</Region>
        <Parameter>2</Parameter>
        <Value>227.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1983</Region>
        <Parameter>1</Parameter>
        <Value>26032</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1983</Region>
        <Parameter>2</Parameter>
        <Value>644.48</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2482</Region>
        <Parameter>1</Parameter>
        <Value>72316</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2482</Region>
        <Parameter>2</Parameter>
        <Value>7174.29</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0360</Region>
        <Parameter>1</Parameter>
        <Value>20753</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0360</Region>
        <Parameter>2</Parameter>
        <Value>1604.46</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0319</Region>
        <Parameter>1</Parameter>
        <Value>9434</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0319</Region>
        <Parameter>2</Parameter>
        <Value>235.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2180</Region>
        <Parameter>1</Parameter>
        <Value>100060</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2180</Region>
        <Parameter>2</Parameter>
        <Value>1782.99</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0484</Region>
        <Parameter>1</Parameter>
        <Value>103990</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0484</Region>
        <Parameter>2</Parameter>
        <Value>1250.49</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1961</Region>
        <Parameter>1</Parameter>
        <Value>15842</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1961</Region>
        <Parameter>2</Parameter>
        <Value>180.26</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1860</Region>
        <Parameter>1</Parameter>
        <Value>5695</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1860</Region>
        <Parameter>2</Parameter>
        <Value>737.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1447</Region>
        <Parameter>1</Parameter>
        <Value>5260</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1447</Region>
        <Parameter>2</Parameter>
        <Value>554.95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1781</Region>
        <Parameter>1</Parameter>
        <Value>24681</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1781</Region>
        <Parameter>2</Parameter>
        <Value>1384.43</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1862</Region>
        <Parameter>1</Parameter>
        <Value>9617</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1862</Region>
        <Parameter>2</Parameter>
        <Value>433.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1814</Region>
        <Parameter>1</Parameter>
        <Value>7661</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1814</Region>
        <Parameter>2</Parameter>
        <Value>481.67</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1984</Region>
        <Parameter>1</Parameter>
        <Value>13897</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1984</Region>
        <Parameter>2</Parameter>
        <Value>419.38</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1885</Region>
        <Parameter>1</Parameter>
        <Value>23769</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1885</Region>
        <Parameter>2</Parameter>
        <Value>1480.5</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1884</Region>
        <Parameter>1</Parameter>
        <Value>10664</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1884</Region>
        <Parameter>2</Parameter>
        <Value>690.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1880</Region>
        <Parameter>1</Parameter>
        <Value>147423</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1880</Region>
        <Parameter>2</Parameter>
        <Value>1620.59</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1883</Region>
        <Parameter>1</Parameter>
        <Value>30475</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1883</Region>
        <Parameter>2</Parameter>
        <Value>510.36</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2029</Region>
        <Parameter>1</Parameter>
        <Value>15554</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2029</Region>
        <Parameter>2</Parameter>
        <Value>1411.98</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2031</Region>
        <Parameter>1</Parameter>
        <Value>10817</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2031</Region>
        <Parameter>2</Parameter>
        <Value>2137.81</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1493</Region>
        <Parameter>1</Parameter>
        <Value>24217</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1493</Region>
        <Parameter>2</Parameter>
        <Value>1503.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1785</Region>
        <Parameter>1</Parameter>
        <Value>15608</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1785</Region>
        <Parameter>2</Parameter>
        <Value>2497.51</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1765</Region>
        <Parameter>1</Parameter>
        <Value>9952</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1765</Region>
        <Parameter>2</Parameter>
        <Value>1653.04</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1730</Region>
        <Parameter>1</Parameter>
        <Value>8564</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1730</Region>
        <Parameter>2</Parameter>
        <Value>894.93</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2583</Region>
        <Parameter>1</Parameter>
        <Value>9832</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2583</Region>
        <Parameter>2</Parameter>
        <Value>959.85</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2513</Region>
        <Parameter>1</Parameter>
        <Value>3365</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2513</Region>
        <Parameter>2</Parameter>
        <Value>2919.47</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0860</Region>
        <Parameter>1</Parameter>
        <Value>14600</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0860</Region>
        <Parameter>2</Parameter>
        <Value>1187</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0686</Region>
        <Parameter>1</Parameter>
        <Value>17183</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0686</Region>
        <Parameter>2</Parameter>
        <Value>873.3</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2361</Region>
        <Parameter>1</Parameter>
        <Value>10220</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2361</Region>
        <Parameter>2</Parameter>
        <Value>11859.63</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2184</Region>
        <Parameter>1</Parameter>
        <Value>37290</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2184</Region>
        <Parameter>2</Parameter>
        <Value>2744.7</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2161</Region>
        <Parameter>1</Parameter>
        <Value>19027</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2161</Region>
        <Parameter>2</Parameter>
        <Value>5609.79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1440</Region>
        <Parameter>1</Parameter>
        <Value>29692</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1440</Region>
        <Parameter>2</Parameter>
        <Value>332.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2582</Region>
        <Parameter>1</Parameter>
        <Value>28107</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2582</Region>
        <Parameter>2</Parameter>
        <Value>4285.1</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2514</Region>
        <Parameter>1</Parameter>
        <Value>16221</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2514</Region>
        <Parameter>2</Parameter>
        <Value>1903.76</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2580</Region>
        <Parameter>1</Parameter>
        <Value>76755</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2580</Region>
        <Parameter>2</Parameter>
        <Value>2242.47</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2581</Region>
        <Parameter>1</Parameter>
        <Value>41954</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2581</Region>
        <Parameter>2</Parameter>
        <Value>3235.08</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1380</Region>
        <Parameter>1</Parameter>
        <Value>98743</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1380</Region>
        <Parameter>2</Parameter>
        <Value>1030.95</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1381</Region>
        <Parameter>1</Parameter>
        <Value>24709</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1381</Region>
        <Parameter>2</Parameter>
        <Value>902.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0781</Region>
        <Parameter>1</Parameter>
        <Value>28096</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0781</Region>
        <Parameter>2</Parameter>
        <Value>1995.13</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0767</Region>
        <Parameter>1</Parameter>
        <Value>10085</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0767</Region>
        <Parameter>2</Parameter>
        <Value>532.84</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1452</Region>
        <Parameter>1</Parameter>
        <Value>11799</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1452</Region>
        <Parameter>2</Parameter>
        <Value>778.48</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1465</Region>
        <Parameter>1</Parameter>
        <Value>10708</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1465</Region>
        <Parameter>2</Parameter>
        <Value>987.14</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0662</Region>
        <Parameter>1</Parameter>
        <Value>29510</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0662</Region>
        <Parameter>2</Parameter>
        <Value>1220.72</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0642</Region>
        <Parameter>1</Parameter>
        <Value>7236</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0642</Region>
        <Parameter>2</Parameter>
        <Value>211.04</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2181</Region>
        <Parameter>1</Parameter>
        <Value>39147</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2181</Region>
        <Parameter>2</Parameter>
        <Value>1296.64</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2104</Region>
        <Parameter>1</Parameter>
        <Value>9562</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2104</Region>
        <Parameter>2</Parameter>
        <Value>445.72</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2083</Region>
        <Parameter>1</Parameter>
        <Value>15452</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2083</Region>
        <Parameter>2</Parameter>
        <Value>928.81</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2080</Region>
        <Parameter>1</Parameter>
        <Value>57930</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2080</Region>
        <Parameter>2</Parameter>
        <Value>2275.22</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2082</Region>
        <Parameter>1</Parameter>
        <Value>11131</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2082</Region>
        <Parameter>2</Parameter>
        <Value>624.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1491</Region>
        <Parameter>1</Parameter>
        <Value>24021</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1491</Region>
        <Parameter>2</Parameter>
        <Value>1116.89</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1441</Region>
        <Parameter>1</Parameter>
        <Value>40833</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1441</Region>
        <Parameter>2</Parameter>
        <Value>308.41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1402</Region>
        <Parameter>1</Parameter>
        <Value>37541</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1402</Region>
        <Parameter>2</Parameter>
        <Value>58.41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1487</Region>
        <Parameter>1</Parameter>
        <Value>38962</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1487</Region>
        <Parameter>2</Parameter>
        <Value>898.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1462</Region>
        <Parameter>1</Parameter>
        <Value>13727</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1462</Region>
        <Parameter>2</Parameter>
        <Value>341.79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1488</Region>
        <Parameter>1</Parameter>
        <Value>57862</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1488</Region>
        <Parameter>2</Parameter>
        <Value>427.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0480</Region>
        <Parameter>1</Parameter>
        <Value>55087</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0480</Region>
        <Parameter>2</Parameter>
        <Value>1554.39</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0483</Region>
        <Parameter>1</Parameter>
        <Value>33851</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0483</Region>
        <Parameter>2</Parameter>
        <Value>1189.54</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2510</Region>
        <Parameter>1</Parameter>
        <Value>5074</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2510</Region>
        <Parameter>2</Parameter>
        <Value>19334.4</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0884</Region>
        <Parameter>1</Parameter>
        <Value>15665</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0884</Region>
        <Parameter>2</Parameter>
        <Value>1219.8</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0513</Region>
        <Parameter>1</Parameter>
        <Value>9853</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0513</Region>
        <Parameter>2</Parameter>
        <Value>1301.96</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1282</Region>
        <Parameter>1</Parameter>
        <Value>44724</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1282</Region>
        <Parameter>2</Parameter>
        <Value>141.02</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1292</Region>
        <Parameter>1</Parameter>
        <Value>41490</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1292</Region>
        <Parameter>2</Parameter>
        <Value>431.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1260</Region>
        <Parameter>1</Parameter>
        <Value>15247</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1260</Region>
        <Parameter>2</Parameter>
        <Value>115.8</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1284</Region>
        <Parameter>1</Parameter>
        <Value>25860</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1284</Region>
        <Parameter>2</Parameter>
        <Value>143.88</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1277</Region>
        <Parameter>1</Parameter>
        <Value>15541</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1277</Region>
        <Parameter>2</Parameter>
        <Value>92.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1981</Region>
        <Parameter>1</Parameter>
        <Value>22456</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1981</Region>
        <Parameter>2</Parameter>
        <Value>1204.37</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0382</Region>
        <Parameter>1</Parameter>
        <Value>21802</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0382</Region>
        <Parameter>2</Parameter>
        <Value>1502.67</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1283</Region>
        <Parameter>1</Parameter>
        <Value>141300</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1283</Region>
        <Parameter>2</Parameter>
        <Value>345.32</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1293</Region>
        <Parameter>1</Parameter>
        <Value>51791</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1293</Region>
        <Parameter>2</Parameter>
        <Value>1306.39</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1266</Region>
        <Parameter>1</Parameter>
        <Value>15341</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1266</Region>
        <Parameter>2</Parameter>
        <Value>433.07</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1267</Region>
        <Parameter>1</Parameter>
        <Value>16216</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1267</Region>
        <Parameter>2</Parameter>
        <Value>319.87</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0187</Region>
        <Parameter>1</Parameter>
        <Value>11657</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0187</Region>
        <Parameter>2</Parameter>
        <Value>58.35</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1466</Region>
        <Parameter>1</Parameter>
        <Value>9508</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1466</Region>
        <Parameter>2</Parameter>
        <Value>509.52</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1489</Region>
        <Parameter>1</Parameter>
        <Value>40072</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1489</Region>
        <Parameter>2</Parameter>
        <Value>551.16</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0183</Region>
        <Parameter>1</Parameter>
        <Value>48270</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0183</Region>
        <Parameter>2</Parameter>
        <Value>8.79</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0123</Region>
        <Parameter>1</Parameter>
        <Value>74809</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0123</Region>
        <Parameter>2</Parameter>
        <Value>63.03</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0184</Region>
        <Parameter>1</Parameter>
        <Value>78183</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0184</Region>
        <Parameter>2</Parameter>
        <Value>20.01</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0561</Region>
        <Parameter>1</Parameter>
        <Value>11622</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0561</Region>
        <Parameter>2</Parameter>
        <Value>780.28</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0883</Region>
        <Parameter>1</Parameter>
        <Value>36483</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0883</Region>
        <Parameter>2</Parameter>
        <Value>2026.92</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2305</Region>
        <Parameter>1</Parameter>
        <Value>6503</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2305</Region>
        <Parameter>2</Parameter>
        <Value>3783.41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2260</Region>
        <Parameter>1</Parameter>
        <Value>9510</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2260</Region>
        <Parameter>2</Parameter>
        <Value>3295.61</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2085</Region>
        <Parameter>1</Parameter>
        <Value>26985</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2085</Region>
        <Parameter>2</Parameter>
        <Value>1647.81</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1782</Region>
        <Parameter>1</Parameter>
        <Value>10918</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1782</Region>
        <Parameter>2</Parameter>
        <Value>1711.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2518</Region>
        <Parameter>1</Parameter>
        <Value>4513</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2518</Region>
        <Parameter>2</Parameter>
        <Value>2492.52</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2521</Region>
        <Parameter>1</Parameter>
        <Value>6099</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2521</Region>
        <Parameter>2</Parameter>
        <Value>8050.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2283</Region>
        <Parameter>1</Parameter>
        <Value>19872</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2283</Region>
        <Parameter>2</Parameter>
        <Value>5761.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2425</Region>
        <Parameter>1</Parameter>
        <Value>2686</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2425</Region>
        <Parameter>2</Parameter>
        <Value>2939.91</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2313</Region>
        <Parameter>1</Parameter>
        <Value>11758</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2313</Region>
        <Parameter>2</Parameter>
        <Value>11780.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0188</Region>
        <Parameter>1</Parameter>
        <Value>59765</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0188</Region>
        <Parameter>2</Parameter>
        <Value>2113.98</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0117</Region>
        <Parameter>1</Parameter>
        <Value>43400</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0117</Region>
        <Parameter>2</Parameter>
        <Value>323.27</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0138</Region>
        <Parameter>1</Parameter>
        <Value>47150</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0138</Region>
        <Parameter>2</Parameter>
        <Value>72.62</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0488</Region>
        <Parameter>1</Parameter>
        <Value>12520</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0488</Region>
        <Parameter>2</Parameter>
        <Value>217.41</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0192</Region>
        <Parameter>1</Parameter>
        <Value>27839</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0192</Region>
        <Parameter>2</Parameter>
        <Value>365.51</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0181</Region>
        <Parameter>1</Parameter>
        <Value>94983</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0181</Region>
        <Parameter>2</Parameter>
        <Value>610.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0128</Region>
        <Parameter>1</Parameter>
        <Value>16678</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0128</Region>
        <Parameter>2</Parameter>
        <Value>71.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0127</Region>
        <Parameter>1</Parameter>
        <Value>90992</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0127</Region>
        <Parameter>2</Parameter>
        <Value>209.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0136</Region>
        <Parameter>1</Parameter>
        <Value>86213</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0136</Region>
        <Parameter>2</Parameter>
        <Value>464.37</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0125</Region>
        <Parameter>1</Parameter>
        <Value>27445</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0125</Region>
        <Parameter>2</Parameter>
        <Value>384.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0486</Region>
        <Parameter>1</Parameter>
        <Value>34630</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0486</Region>
        <Parameter>2</Parameter>
        <Value>975.09</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0139</Region>
        <Parameter>1</Parameter>
        <Value>26991</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0139</Region>
        <Parameter>2</Parameter>
        <Value>325.23</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0305</Region>
        <Parameter>1</Parameter>
        <Value>20829</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0305</Region>
        <Parameter>2</Parameter>
        <Value>186.47</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0380</Region>
        <Parameter>1</Parameter>
        <Value>215762</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0380</Region>
        <Parameter>2</Parameter>
        <Value>2234.44</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0331</Region>
        <Parameter>1</Parameter>
        <Value>13712</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0331</Region>
        <Parameter>2</Parameter>
        <Value>1225.58</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1980</Region>
        <Parameter>1</Parameter>
        <Value>148083</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1980</Region>
        <Parameter>2</Parameter>
        <Value>1137.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0381</Region>
        <Parameter>1</Parameter>
        <Value>43164</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0381</Region>
        <Parameter>2</Parameter>
        <Value>1323.82</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0580</Region>
        <Parameter>1</Parameter>
        <Value>156381</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0580</Region>
        <Parameter>2</Parameter>
        <Value>1568.57</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0583</Region>
        <Parameter>1</Parameter>
        <Value>43375</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0583</Region>
        <Parameter>2</Parameter>
        <Value>1266.75</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2281</Region>
        <Parameter>1</Parameter>
        <Value>98419</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2281</Region>
        <Parameter>2</Parameter>
        <Value>3452.29</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2262</Region>
        <Parameter>1</Parameter>
        <Value>18015</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2262</Region>
        <Parameter>2</Parameter>
        <Value>822.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0126</Region>
        <Parameter>1</Parameter>
        <Value>107867</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0126</Region>
        <Parameter>2</Parameter>
        <Value>140.67</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0180</Region>
        <Parameter>1</Parameter>
        <Value>939238</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0180</Region>
        <Parameter>2</Parameter>
        <Value>207.33</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1498</Region>
        <Parameter>1</Parameter>
        <Value>12803</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1498</Region>
        <Parameter>2</Parameter>
        <Value>522.94</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0186</Region>
        <Parameter>1</Parameter>
        <Value>46882</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0186</Region>
        <Parameter>2</Parameter>
        <Value>31.18</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1499</Region>
        <Parameter>1</Parameter>
        <Value>32876</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1499</Region>
        <Parameter>2</Parameter>
        <Value>1065.77</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1496</Region>
        <Parameter>1</Parameter>
        <Value>54316</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1496</Region>
        <Parameter>2</Parameter>
        <Value>685.08</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1471</Region>
        <Parameter>1</Parameter>
        <Value>13235</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1471</Region>
        <Parameter>2</Parameter>
        <Value>620.71</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1495</Region>
        <Parameter>1</Parameter>
        <Value>18958</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1495</Region>
        <Parameter>2</Parameter>
        <Value>448.69</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2039</Region>
        <Parameter>1</Parameter>
        <Value>7034</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2039</Region>
        <Parameter>2</Parameter>
        <Value>7142.83</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2062</Region>
        <Parameter>1</Parameter>
        <Value>20242</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>2062</Region>
        <Parameter>2</Parameter>
        <Value>3111.54</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0685</Region>
        <Parameter>1</Parameter>
        <Value>27284</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0685</Region>
        <Parameter>2</Parameter>
        <Value>1600.42</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0684</Region>
        <Parameter>1</Parameter>
        <Value>11500</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0684</Region>
        <Parameter>2</Parameter>
        <Value>729.56</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0682</Region>
        <Parameter>1</Parameter>
        <Value>30939</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0682</Region>
        <Parameter>2</Parameter>
        <Value>988.5</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0182</Region>
        <Parameter>1</Parameter>
        <Value>99702</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0182</Region>
        <Parameter>2</Parameter>
        <Value>99.25</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0120</Region>
        <Parameter>1</Parameter>
        <Value>42380</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>0120</Region>
        <Parameter>2</Parameter>
        <Value>456.58</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1490</Region>
        <Parameter>1</Parameter>
        <Value>110112</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1490</Region>
        <Parameter>2</Parameter>
        <Value>967.53</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1442</Region>
        <Parameter>1</Parameter>
        <Value>11328</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1442</Region>
        <Parameter>2</Parameter>
        <Value>441.24</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1444</Region>
        <Parameter>1</Parameter>
        <Value>5721</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1444</Region>
        <Parameter>2</Parameter>
        <Value>280.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1445</Region>
        <Parameter>1</Parameter>
        <Value>5620</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1445</Region>
        <Parameter>2</Parameter>
        <Value>235.68</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1470</Region>
        <Parameter>1</Parameter>
        <Value>15875</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1470</Region>
        <Parameter>2</Parameter>
        <Value>700.65</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1494</Region>
        <Parameter>1</Parameter>
        <Value>39340</Value>
    </ParameterValue>
    <ParameterValue>
        <Region>1494</Region>
        <Parameter>2</Parameter>
        <Value>1372.6</Value>
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
