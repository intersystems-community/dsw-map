# dsw-map

[![Gitter](https://img.shields.io/badge/chat-on%20telegram-blue.svg)](https://t.me/joinchat/FoZ4M0rd1_WFij2rqvUR2A)
[![Gitter](https://img.shields.io/badge/demo-server-green.svg)](http://37.139.6.217:52774/dsw/index.html#!/?ns=dswmap)

map examples of different regions to render in DeepSeeWeb

Non issue
-----------
If you are using the local host as the server, then replace **localhost** with IP **127.0.0.1** to avoid an error.

Installation
-----------

0. Be sure you have [MDX2JSON](https://github.com/intersystems-ru/Cache-MDX2JSON) and [DeepSeeWeb](https://github.com/intersystems-ru/DeepSeeWeb) installed.

1. Download [release.xml](https://github.com/intersystems-ru/dsw-map/releases/) file and import it into a target Namespace.
2. To setup all the maps run in the terminal:
```
    d ##class(DSWMap.Utils).SetupAll()
```
Or run following to setup special map only:
```
    d ##class([MapName].Utils).Setup()
```
3. Download [polygons.zip](https://github.com/intersystems-ru/dsw-map/releases/) and place polygons files in /csp/yourtargetnamespace.
4. Download [TermList.xml] and impot it into target Namespace
5. Open yourserver/dsw/ in a target namespace and get the maps.
