Class DSWMap.Utils
{

ClassMethod SetupAll()
{

    for map="CZ","FIN","RSA","SE","RF.SAKH","USA" {
        do $CLASSMETHOD(map_".Utils", "Setup")
        }
}

}

