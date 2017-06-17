# dsw-map
map examples of different regions to render in DeepSeeWeb

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
4. Open yourserver/dsw/ in a target namespace and get the maps.
