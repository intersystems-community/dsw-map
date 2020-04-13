ARG IMAGE=store/intersystems/irishealth:2019.3.0.308.0-community
ARG IMAGE=store/intersystems/iris-community:2019.3.0.309.0
ARG IMAGE=store/intersystems/iris-community:2019.4.0.379.0
ARG IMAGE=store/intersystems/iris-community:2020.1.0.199.0
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.209.0-zpm
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
COPY irissession.sh /
RUN chmod +x /irissession.sh 


USER irisowner

COPY  Installer.cls .
COPY  src/cls src
COPY  src/dfi src
COPY  src/gbl src
COPY  src/js /usr/irissys/csp/irisapp
SHELL ["/irissession.sh"]

RUN \
  do $SYSTEM.OBJ.Load("Installer.cls", "ck") \
  zpm "install dsw" \
  zpm "install isc-dev" \
  set sc = ##class(App.Installer).setup() \
  zn "IRISAPP" \
  do ##class(DSWMap.Utils).EnableAnalytics() \
  do ##class(USA.Utils).Setup()


# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
