Class DSWMap.Utils
{

ClassMethod SetupAll()
{

    for map="CZ","FIN","RSA","SE","RF.SAKH","RF.KHAB","USA","UK","KZ","UA","RF.PERM","BG" {
        do $CLASSMETHOD(map_".Utils", "Setup")
        }
}

}

