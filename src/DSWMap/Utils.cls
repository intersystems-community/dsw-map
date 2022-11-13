Class DSWMap.Utils
{

ClassMethod SetupAll()
{

    for map="CZ","FIN","RSA","SE","RF.SAKH","RF.KHAB","USA","UK","KZ","UA","UA21","RF.PERM","BG" {
        do $CLASSMETHOD(map_".Utils", "Setup")
        }
}

ClassMethod EnableAnalytics() As %Status
{
    set namespace = $ZNspace
	set app = $System.CSP.GetDefaultApp(namespace) _ "/"

	try {
		do EnableDeepSee^%SYS.cspServer(app)
	} catch (ex) {
		set tSC=ex.AsStatus()
		write !,"WARNING: failed to enable DeepSee for "_namespace_" namespace."
	}
}

}
