# dsw-map
map examples of different regions to render in DeepSeeWeb

Installation
-----------

0. Be sure you have [MDX2JSON](https://github.com/intersystems-ru/Cache-MDX2JSON) and [DeepSeeWeb](https://github.com/intersystems-ru/DeepSeeWeb) installed.

1. Install [CacheUpdater](https://github.com/intersystems-ru/CacheUpdater/) in the target Namespace.
2. Run in the terminal:
```
    d ##class(CacheUpdater.Task).Update("intersystems-ru","dsw-map")
```
It will download classes and dfi from this repo and compiles it. JS files will be placed in .../CSP/Namespace folder.


3. For the map of Finland Run:
```
d ##class(FIN.Utils).Setup()
```
4. Get the working map of Finland on the URL:  yourserver:port/sw/index.html#/d/FIN/FinMap.dashboard?ns=Namespace.

![Finland](https://dl.dropboxusercontent.com/u/25822386/InterSystems/Finland1.png)
