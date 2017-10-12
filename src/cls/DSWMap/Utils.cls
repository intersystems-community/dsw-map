Class DSWMap.Utils
{

ClassMethod SetupAll()
{

    for map="CZ","FIN","RSA","SE","RF.SAKH","RF.KHAB","USA","UK" {
        do $CLASSMETHOD(map_".Utils", "Setup")
        }
}

}

