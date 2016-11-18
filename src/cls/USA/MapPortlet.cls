/// Portlet that displays a clickable google map. Supports 2012.2 and higher versions of Cache.
/// Improvements compared to %DeepSee.Component.Widget.map:
/// 1) Polygon support. In addition to markers, this widget supports clickable colored polygons with tooltips.
///    The "coordsProperty" widget setting should be set to the name of a data source property that provides polygon coordinates. The value of this property is expected to contain one or more ordered sequences of coordinates each of which designates a closed loop.
///    Sequences are delimited by ; (semicolon). Coordinates in such a sequence are delimited by spaces, for example: 42.725042,55.257428,0 42.727162,55.270206,0 42.737196,55.27019,0 42.725042,55.257428,0
///    Each coordinate triple consists of latitude / longitude numbers and a noWrap flag (see http://code.google.com/intl/en/apis/maps/documentation/javascript/reference.html#LatLng for details).
///    An alternative approach is to store polygon coordinates in a static js file rather than in the database. See coordsJsFile property description for details.
/// 2) Configurable names of data source properties that provide marker and polygon data (latitude, longitude, color, opacity etc).
/// 3) Configurable "onclick" handler for markers and polygons. Configurable "onaddpolygon" and "onaddmarker" handlers.
/// 4) Drilldown capabilities.
/// 5) Convenience javascript methods: createInfoWindowAtPosition() and getControl().
Class USA.MapPortlet Extends %DeepSee.Component.Portlet.abstractPortlet
{

Parameter INCLUDEFILES = "script:http://maps.google.com/maps/api/js?sensor=false&language=en";

/// Initial latitude (as a decimal number).
Property latitude As %ZEN.Datatype.float [ InitialExpression = 42.36 ];

/// Initial longitude (as a decimal number).
Property longitude As %ZEN.Datatype.float [ InitialExpression = 288.92 ];

/// Initial zoom level (0 shows entire globe).
Property zoom As %ZEN.Datatype.integer [ InitialExpression = 12 ];

/// Initial map display.
Property mapType As %ZEN.Datatype.string(VALUELIST = ",ROADMAP,SATELLITE,HYBRID,TERRAIN") [ InitialExpression = "ROADMAP" ];

/// If true, then the markers on this map are draggable.
Property markersDraggable As %ZEN.Datatype.boolean [ InitialExpression = 0 ];

/// Name of property in data source that provides the latitude value for a marker.
Property latitudeProperty As %ZEN.Datatype.string;

/// Name of property in data source that provides the longitude value for a marker.
Property longitudeProperty As %ZEN.Datatype.string;

/// Name of property in data source that provides the coordinates array for a polygon.
Property coordsProperty As %ZEN.Datatype.string;

/// Name of property in data source that provides the color of a polygon.
Property colorProperty As %ZEN.Datatype.string;

/// onclickmarker event handler: if defined, this event is fired when a marker is clicked.
Property onclickmarker As %ZEN.Datatype.eventHandler;

/// onrightclickmarker event handler: if defined, this event is fired when a marker is clicked.
Property onrightclickmarker As %ZEN.Datatype.eventHandler;

/// onclickpolygon event handler: if defined, this event is fired when a polygon is clicked.
Property onclickpolygon As %ZEN.Datatype.eventHandler;

/// onrightclickpolygon event handler: if defined, this event is fired when a polygon is clicked.
Property onrightclickpolygon As %ZEN.Datatype.eventHandler;

/// Name of property in data source that provides the title of a marker (used for tooltip text).
Property markerTitleProperty As %ZEN.Datatype.string;

/// Name of property in data source that provides the title of a polygon (used for tooltip text).
Property polygonTitleProperty As %ZEN.Datatype.string;

/// List of properties in data source that provides data to be stored within the current marker. This data is visible from onclick event handler.
Property markerDataProperties As %ZEN.Datatype.string;

/// List of properties in data source that provides data to be stored within the current polygon. This data is visible from onclick event handler.
Property polygonDataProperties As %ZEN.Datatype.string;

/// ondrilldown event handler: if defined, this event is fired from drillDown() method.
Property ondrilldown As %ZEN.Datatype.eventHandler;

/// ondrillup event handler: if defined, this event is fired from drillUp() method.
Property ondrillup As %ZEN.Datatype.eventHandler;

/// Name of property in data source that provides polygon fill opacity.
Property fillOpacityProperty As %ZEN.Datatype.string;

/// Name of property in data source that provides "сlickable" attribute value for markers and polygons.
Property isClickableProperty As %ZEN.Datatype.string;

/// Hover opacity for clickable polygons.
Property hoverOpacity As %ZEN.Datatype.string;

/// Polygon stroke opacity.
Property strokeOpacity As %ZEN.Datatype.string;

/// Polygon stroke weight.
Property strokeWeight As %ZEN.Datatype.string;

/// Default fillOpacity for polygons.
Property fillOpacity As %ZEN.Datatype.string;

/// Name of property in data source that provides icon href for markers.
Property markerIconProperty As %ZEN.Datatype.string;

/// Default marker icon href.
Property markerIcon As %ZEN.Datatype.string;

/// Special marker icon href.                                                                     [+]
Property markerSpecialIcon As %ZEN.Datatype.string;

/// Special marker property                                                                       [+]
Property markerSpecialProperty As %ZEN.Datatype.string;

/// Marker icon size (ignored if both markerIcon and markerIconProperty are not set).
Property markerIconSize As %ZEN.Datatype.string;

/// onapplyfilters event handler
Property onapplyfilters As %ZEN.Datatype.eventHandler;

/// onaddpolygon event handler
Property onaddpolygon As %ZEN.Datatype.eventHandler;

/// onaddmarker event handler
Property onaddmarker As %ZEN.Datatype.eventHandler;

/// JS file containing "function loadCoordinates(polygonCoordsArray) {}" that populates a polygon coordinates associative array.
/// If <var>coordsJsFile</var> is specified then <var>coordsProperty</var> must contain name of the property that provides keys for the coordinates associative array.
Property coordsJsFile As %ZEN.Datatype.string;

/// Where "<< Back" button is located
Property drillUpButtonPosition As %ZEN.Datatype.string(VALUELIST = "top,bottom") [ InitialExpression = "top" ];

ClassMethod %OnGetPortletName() As %String
{
	quit "USA Map"
}

ClassMethod %OnGetPortletIcon() As %String
{
	quit "deepsee/world_48.gif"
}

ClassMethod %OnGetPortletSettings(Output pInfo As %List) As %Status
{
	kill pInfo
	// $LB(name,value,type,caption,title)

	set tTypeList = "ENUM^"_$$$Text("Roadmap","%DeepSee")_":ROADMAP,"_
			$$$Text("Satellite","%DeepSee")_":SATELLITE,"_
			$$$Text("Hybrid","%DeepSee")_":HYBRID,"_
			$$$Text("Terrain","%DeepSee")_":TERRAIN"

	set pInfo($I(pInfo)) = $LB("mapType","",tTypeList,$$$Text("Map Type","%DeepSee"),$$$Text("Initial display type for the map","%DeepSee"))
	set pInfo($I(pInfo)) = $LB("zoom",12,"%Integer",$$$Text("Zoom","%DeepSee"),$$$Text("Initial zoom level for the map","%DeepSee"))
	set pInfo($I(pInfo)) = $LB("latitude",55.74,"%Number",$$$Text("Starting latitude","%DeepSee"),$$$Text("Initial latitude for the map","%DeepSee"))
	set pInfo($I(pInfo)) = $LB("longitude",37.6,"%Number",$$$Text("Starting longitude","%DeepSee"),$$$Text("Initial longitude for the map","%DeepSee"))

	set pInfo($I(pInfo)) = $LB("onclickmarker","","%ZEN.Datatype.eventHandler","'onclickmarker' event handler","User callback for onclickmarker event")
	set pInfo($I(pInfo)) = $LB("onrightclickmarker","","%ZEN.Datatype.eventHandler","'onrightclickmarker' event handler","User callback for onrightclickmarker event")
	set pInfo($I(pInfo)) = $LB("markersdraggable",1,"%Boolean","Draggable markers?","Toggle markers drag'n'drop.")

	set pInfo($I(pInfo)) = $LB("latitudeProperty","","%ZEN.Datatype.string","Latitude property","Latitude property for markers")
	set pInfo($I(pInfo)) = $LB("longitudeProperty","","%ZEN.Datatype.string","Longitude property","Longitude property for markers")
	set pInfo($I(pInfo)) = $LB("markerTitleProperty","","%ZEN.Datatype.string","Marker title property","Title property for markers")
	set pInfo($I(pInfo)) = $LB("markerDataProperties","","%ZEN.Datatype.string","Marker data properties","List of data properties for markers")
	set pInfo($I(pInfo)) = $LB("markerIconProperty","","%ZEN.Datatype.string","Marker icon property","Marker icon property")
	set pInfo($I(pInfo)) = $LB("markerIcon","","%ZEN.Datatype.string","Marker icon","Default marker icon")
	set pInfo($I(pInfo)) = $LB("markerSpecialIcon","","%ZEN.Datatype.string","Marker special icon","Marker icon for special place")
	set pInfo($I(pInfo)) = $LB("markerSpecialProperty","","%ZEN.Datatype.string","Marker special property","Marker special property for special icon")
	set pInfo($I(pInfo)) = $LB("markerIconSize","","%ZEN.Datatype.string","Marker icon size","Default marker icon size (ingored if Marker icon is not set)")
	
	set pInfo($I(pInfo)) = $LB("coordsJsFile","","%ZEN.Datatype.string","JS file with coords","JS file with javascript 'function loadCoordinates(polygonCoordsArray) {...}' that populates polygonCoordsArray argument with polygon coordinates keyed by values from the data source property specified in 'Polygon coords property' setting.")
	set pInfo($I(pInfo)) = $LB("coordsProperty","","%ZEN.Datatype.string","Polygon coords property","Data source property that provides coordinates for polygons if 'JS file with coords' is not specified. Otherwise this setting should contain name of data source property that provides keys for associative array which is populated by javascript code in 'JS file with coords'.")
	
	set pInfo($I(pInfo)) = $LB("onclickpolygon","","%ZEN.Datatype.eventHandler","'onclickpolygon' event handler","User callback for onclickpolygon event")	
	set pInfo($I(pInfo)) = $LB("onrightclickpolygon","","%ZEN.Datatype.eventHandler","'onrightclickpolygon' event handler","User callback for onrightclickpolygon event")	
	
	
	set pInfo($I(pInfo)) = $LB("colorProperty","","%ZEN.Datatype.string","Polygon сolor property","Color property for polygons")
	set pInfo($I(pInfo)) = $LB("polygonTitleProperty","","%ZEN.Datatype.string","Polygon title property","Title property for polygons")
	set pInfo($I(pInfo)) = $LB("polygonDataProperties","","%ZEN.Datatype.string","Polygon data properties","List of data properties for polygons")
	set pInfo($I(pInfo)) = $LB("fillOpacityProperty","","%ZEN.Datatype.string","Fill opacity property","Fill opacity property for polygons")
	set pInfo($I(pInfo)) = $LB("isClickableProperty","","%ZEN.Datatype.string","IsClickable flag property","IsClickable flag property for polygons")
	
	set pInfo($I(pInfo)) = $LB("fillOpacity","","%ZEN.Datatype.string","Fill opacity","Default fill opacity for polygons")
	set pInfo($I(pInfo)) = $LB("hoverOpacity","","%ZEN.Datatype.string","Hover opacity","Hover opacity for clickable polygons")
	set pInfo($I(pInfo)) = $LB("strokeOpacity","","%ZEN.Datatype.string","Stroke opacity","Stroke opacity for polygons")
	set pInfo($I(pInfo)) = $LB("strokeWeight","","%ZEN.Datatype.string","Stroke weight","Stroke weight for polygons")
	
	set pInfo($I(pInfo)) = $LB("drillUpButtonPosition","top","ENUM^top,bottom","Drill-up button position","Where ""<< Back"" button is located")
		
	set pInfo($I(pInfo)) = $LB("ondrilldown","","%ZEN.Datatype.eventHandler","'ondrilldown' event handler","User callback for ondrilldown event")
	set pInfo($I(pInfo)) = $LB("ondrillup","","%ZEN.Datatype.eventHandler","'ondrillup' event handler","User callback for ondrillup event")
	
	set pInfo($I(pInfo)) = $LB("onapplyfilters","","%ZEN.Datatype.eventHandler","'onapplyfilters' event handler","User callback for onapplyfilters event")
	set pInfo($I(pInfo)) = $LB("onaddpolygon","","%ZEN.Datatype.eventHandler","'onaddpolygon' event handler","User callback for onaddpolygon event")
	set pInfo($I(pInfo)) = $LB("onaddmarker","","%ZEN.Datatype.eventHandler","'onaddmarker' event handler","User callback for onaddmarker event")

	quit $$$OK
}

/// Client-side method to render control.
ClientMethod renderContents() [ Language = javascript ]
{
	this._mapObject = null;
	var mapDiv = this.getEnclosingDiv();

	// test if we have not been rendered yet
	if (mapDiv == null) return;

	// make sure our div has some area
	var width = isNaN(parseFloat(this.width)) ? 200 : parseFloat(this.width);
	var height = isNaN(parseFloat(this.height)) ? 200 : parseFloat(this.height);
	if ('' == this.enclosingStyle) {
		mapDiv.style.width = width + 'px';
		mapDiv.style.height = height + 'px';
	}

	// get data from controller, if present.
	this.acquireData();

	// create map
	this.initMap(mapDiv);

	// add markers
	this.syncMarkers();
	
	// add polygons
	this.syncPolygons();
	
	zenPage.dashboardEventHandler('', '', '', 'refresh', '*', '');
}

/// Initialize the map
ClientMethod initMap(mapDiv) [ Language = javascript ]
{
	if (('undefined' == typeof google)||('undefined' == typeof google.maps)) {
		mapDiv.innerHTML = $$$Text('Unable to load google map api.');
		return;
	}
	
	// Отключить использование тестовых версий карты
	google.maps.visualRefresh = false;


	var mapTypeId = this.getMapTypeId(this.mapType);
	
	this.latitude = parseFloat(this.latitude);
	if (isNaN(this.latitude)) this.latitude = 42.36;
	
	this.longitude = parseFloat(this.longitude);
	if (isNaN(this.longitude)) this.longitude = 288.92;
	
	var mapLatlng = new google.maps.LatLng(this.latitude, this.longitude);
	
	this.zoom = parseInt(this.zoom, 10);
	if (isNaN(this.zoom)) this.zoom = 0;
	
	var mapOptions = {
		zoom: this.zoom,
		center: mapLatlng,
		mapTypeId: mapTypeId
	}
	var map = new google.maps.Map(mapDiv, mapOptions);
	this._mapObject = map;
	
	// array of markers
	this._markers = [];
	
	// array of polygons
	this._polygons = [];
	
	// drilldown arrays
	this._prevZoom = [];
	this._prevCenter = [];
	this._drillDownTitle = [];
	
	this._infoWindow = new google.maps.InfoWindow();

	// slider range -----------------------------------
	this._sliderRangeData = {isChanged: false, currGuid:''};
	

	var sliderDiv = document.createElement('div');
	sliderDiv.style.padding = '3px';

	var sliderUI = document.createElement('div');
	sliderUI.id = 'rangeSliderEdit';
	sliderUI.innerHTML = '<div id=\'rightSliderPart\'><input id=\'btnSaveRanges\' type=\'button\'  class=\'sliderEditRight\' value=\'Change range\' onclick="zenPage.getComponentById(\'' + this.id + '\').openEditRange();"/></div><div id=\'leftSliderPart\' class=\'sliderEditLeft\'><input title=\'Minimum value of the parameter\' readonly=\'true\' type=\'text\' id=\'minSliderRange\'/><input title=\'Borders of color palette\' readonly=\'true\' type=\'text\' id=\'valuesSliderRange\'/><input title=\'Maximum value of the parameter\' readonly=\'true\' type=\'text\' id=\'maxSliderRange\'/><div id=\'slider-range\' widgetId=\'' + this.id + '\'></div></div>';
	sliderDiv.appendChild(sliderUI);
	//sliderDiv.index = 1;
	map.controls[google.maps.ControlPosition.TOP_RIGHT].push(sliderDiv);
    // ------------------------------------------------
	
	// add listeners
	var code = new Function('zenPage.getComponent('+this.index+').zoomChangedHandler();');
	google.maps.event.addListener(map, 'zoom_changed', code);

	var code = new Function('zenPage.getComponent('+this.index+').dragendHandler();');
	google.maps.event.addListener(map, 'dragend', code);
	
	var code = new Function('zenPage.getComponent('+this.index+').centerChangedHandler();');
	google.maps.event.addListener(map, 'center_changed', code);
}

/// Callback for zoom-changed event.
ClientMethod zoomChangedHandler() [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		this.zoom = map.getZoom();
	}
}

/// Callback for map dragend event.
ClientMethod dragendHandler() [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var latLng = map.getCenter();
		this.latitude = latLng.lat();
		this.longitude = latLng.lng();
	}
}

/// Return the google map API object used by the map view.
ClientMethod getMapObject() [ Language = javascript ]
{
	return this._mapObject;
}

/// Given the name of a map type, convert to a map type id.
ClientMethod getMapTypeId(type) [ Language = javascript ]
{
	if (('undefined' == typeof google)||('undefined' == typeof google.maps)) {
		return '';
	}

	var mapType = google.maps.MapTypeId.ROADMAP;
	switch (type) {
	case 'HYBRID':
		mapType = google.maps.MapTypeId.HYBRID;
		break;
	case 'SATELLITE':
		mapType = google.maps.MapTypeId.SATELLITE;
		break;
	case 'TERRAIN':
		mapType = google.maps.MapTypeId.TERRAIN;
		break;
	case 'ROADMAP':
	default:
		break;
	}

	return mapType;
}

/// Set the value of a named property.
ClientMethod setProperty(property, value, value2) [ Language = javascript ]
{
	var map = this.getMapObject();

	switch(property) {
	case 'latitude':
	case 'longitude':
		this[property] = value;
		if (map) {
			var mapLatlng = new google.maps.LatLng(parseFloat(this.latitude), parseFloat(this.longitude));
			map.panTo(mapLatlng);
		}
		break;

	case 'zoom':
		this[property] = value;
		if (map) {
			map.setZoom(parseInt(this.zoom,10));
		}
		break;

	case 'mapType':
		this[property] = value;
		if (map) {
			var mapTypeId = this.getMapTypeId(this.mapType);
			map.setMapTypeId(mapTypeId);
		}
		break;

	default:
		return this.invokeSuper('setProperty',arguments);
	}
	return true;
}

/// Notification that the dataController associated with this dataView has raised an event.
ClientMethod notifyViewHandler(reason, data1, data2, data3) [ Language = javascript ]
{
	switch(reason) {
	case 'dataChange':
		this.onApplyFilters(true);
	case 'modelChange':
		// some change in dataController
		this.acquireData();
		this.syncMarkers();
		this.syncPolygons();
		break;
	case 'seriesChange':
		break;
	}
}

/// Add a marker to the map at given coordinates.<br/>
/// <var>id</var> is a user-defined identifier associated with the marker.<br/>
/// Returns the marker object.
ClientMethod addMarker(id, latitude, longitude, title, isClickable, icon, data) [ Language = javascript ]
{
	var marker = null;
	var map = this.getMapObject();
	if (map && !isNaN(parseFloat(latitude)) && !isNaN(parseFloat(longitude))) {
		var mapLatlng = new google.maps.LatLng(parseFloat(latitude), parseFloat(longitude));
		marker = new google.maps.Marker({
			position: mapLatlng,
			map: map,
			draggable: this.markersDraggable,
			title:title,
			clickable: (isClickable == 1),
			icon: (icon ? (this.markerIconSize ? new google.maps.MarkerImage(icon, null, null, null, new google.maps.Size(this.markerIconSize, this.markerIconSize)) : icon) : null),
			data: data});

		// add to list
		marker._id = id;
		var index = this._markers.length;
		this._markers[index] = marker;

		// add event handler(s)
		if (this.markersDraggable) {
			var code = new Function('zenPage.getComponent('+this.index+').markerDragEndHandler("'+index+'");');
			google.maps.event.addListener(marker, 'dragend', code);
		}

		var code = new Function('zenPage.getComponent('+this.index+').markerClickHandler("'+index+'");');
		google.maps.event.addListener(marker, 'click', code);
		
		code = new Function('zenPage.getComponent('+this.index+').markerRightClickHandler("'+index+'");');
		google.maps.event.addListener(marker, 'rightclick', code);
	}
	return marker;
}

/// Add a polygon to the map at given coordinates.<br/>
/// <var>id</var> is a user-defined identifier associated with the polygon.<br/>
/// Returns the polygon object.
ClientMethod addPolygon(id, coords, color, fo, isClickable, title, data) [ Language = javascript ]
{
	var polygon = null;
	var map = this.getMapObject();
	if (map) 
	{
		if (color.substring(0, 4) === "rgb(" && color.indexOf(")") == (color.length - 1) && color.indexOf(".") > -1)
		{
			var colorAr = color.substring(4, color.length - 1).split(",");
			color = "rgb(" + String(parseFloat(colorAr[0])).split(".")[0] + "," + String(parseFloat(colorAr[1])).split(".")[0] + "," + String(parseFloat(colorAr[2])).split(".")[0] + ")";
		}
		
		polygon = new google.maps.Polygon({
			tooltip: '',
			title: title,
			fillColor: (color.substring(0, "hsv2rgb".length) === "hsv2rgb" ? eval(color) : color),
			fillOpacity: fo,
			clickable: (isClickable == 1),
			strokeColor: (color.substring(0, "hsv2rgb".length) === "hsv2rgb" ? eval(color) : color),
			strokeOpacity: (this.strokeOpacity ? this.strokeOpacity : 0.5),
			strokeWeight: (this.strokeWeight ? this.strokeWeight : 3),
			paths: coords,
			map: map,
			data: data,
			defaultFO: fo});
			
		// add to list
		polygon._id = id;
		var index = this._polygons.length;
		this._polygons[index] = polygon;

		var code = new Function('event', 'zenPage.getComponent('+this.index+').polygonClickHandler("'+index+'", event);');
		google.maps.event.addListener(polygon, 'click', code);

		code = new Function('event', 'zenPage.getComponent('+this.index+').polygonRightClickHandler("'+index+'", event);');
		google.maps.event.addListener(polygon, 'rightclick', code);
		
		code = new Function('event', 'zenPage.getComponent('+this.index+').polygonMouseOver("'+index+'", event);');
		google.maps.event.addListener(polygon, 'mouseover', code);
		
		code = new Function('event', 'zenPage.getComponent('+this.index+').polygonMouseMove("'+index+'", event);');
		google.maps.event.addListener(polygon, 'mousemove', code);

		code = new Function('event', 'zenPage.getComponent('+this.index+').polygonMouseOut("'+index+'", event);');
		google.maps.event.addListener(polygon, 'mouseout', code);
	}
	return polygon;
}

ClientMethod polygonMouseOver(index, event) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon && polygon.clickable) polygon.setOptions({fillOpacity: (this.hoverOpacity ? this.hoverOpacity : 0.35)});
	}
}

ClientMethod polygonMouseMove(index, event) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon && polygon.tooltip) 
		{	
			clearTimeout(polygon.tooltipTimer);
			polygon.tooltipTimer = setTimeout('zenPage.getComponent('+this.index+').polygonTooltipTimer('+index+',' + event.latLng.lat() + ',' + event.latLng.lng() + ');', 100);
		}
	}
}

ClientMethod polygonTooltipTimer(index, lat, lng) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon && polygon.tooltip) polygon.tooltip.show(new google.maps.LatLng(lat, lng));
	}
}

ClientMethod polygonMouseOut(index, event) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon) 
		{
			if (polygon.clickable) polygon.setOptions({fillOpacity: polygon.defaultFO});
			
			if (polygon.tooltip)
			{
				polygon.tooltip.hide();
				clearTimeout(polygon.tooltipTimer);
			}
		}
	}
}

ClientMethod polygonClickHandler(index, event) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon) {
			if (polygon.tooltip)
			{
				polygon.tooltip.hide();
				clearTimeout(polygon.tooltipTimer);
			}
			zenInvokeCallbackMethod(this.onclickpolygon,this,'onclickpolygon','polygon',polygon,'position',event.latLng);
		}
	}
}

ClientMethod polygonRightClickHandler(index, event) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var polygon = this.getPolygon(index);
		if (polygon) {
			if (polygon.tooltip)
			{
				polygon.tooltip.hide();
				clearTimeout(polygon.tooltipTimer);
			}
			zenInvokeCallbackMethod(this.onrightclickpolygon,this,'onrightclickpolygon','polygon',polygon,'position',event.latLng);
		}
	}
}

/// Find marker in marker list by index # (0-based).
ClientMethod getMarker(index) [ Internal, Language = javascript ]
{
	return this._markers ? this._markers[index] : null;
}

/// Find polygon in polygon list by index # (0-based).
ClientMethod getPolygon(index) [ Internal, Language = javascript ]
{
	return this._polygons ? this._polygons[index] : null;
}

/// Callback for marker dragend event.
ClientMethod markerDragEndHandler(index) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var marker = this.getMarker(index);
		if (marker) {
			this.createInfoWindow(marker,'Marker moved to:<br/>' + marker.getPosition());
		}
	}
}

/// Callback for marker click event.
ClientMethod markerClickHandler(index) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var marker = this.getMarker(index);
		if (marker) {
			zenInvokeCallbackMethod(this.onclickmarker,this,'onclickmarker','marker',marker);
		}
	}
}

/// Callback for marker click event.
ClientMethod markerRightClickHandler(index) [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	if (map) {
		var marker = this.getMarker(index);
		if (marker) {
			zenInvokeCallbackMethod(this.onrightclickmarker,this,'onrightclickmarker','marker',marker);
		}
	}
}

/// Show an info window at the specified position.
ClientMethod openInfoWindowAtPosition(position, content) [ Language = javascript ]
{
	var map = this.getMapObject();
	if (map && position) 
	{
		this._infoWindow.setContent(content);
 		this._infoWindow.setPosition(position);
	    this._infoWindow.open(map);
	}
}

/// Remove a marker from the map.
/// <var>marker</var> is the marker to remove.
ClientMethod removeMarker(marker) [ Language = javascript ]
{
	try {
		marker.setMap(null);
	}
	catch(ex) {
		// swallow google error!
	}
}

/// Remove a polygon from the map.
/// <var>polygon</var> is the polygon to remove.
ClientMethod removePolygon(polygon) [ Language = javascript ]
{
	try {
		if (polygon.tooltip) polygon.tooltip.setMap(null);
		polygon.setMap(null);
	}
	catch(ex) {
		// swallow google error!
	}
}

/// Internal method: acquire data for this view and store a copy in a local cache.
ClientMethod acquireData() [ Internal, Language = javascript ]
{
	var controller = this.getController();
	if (null == controller) {
		// try to connect to dataController
		this.connectToController();
		controller = this.getController();
	}

	// array of marker data
	this._markerData = [];
	
	if (controller && (this.latitudeProperty != '') && (this.longitudeProperty != ''))
	{
		// get data from controller (make sure data is loaded)
		var dims = controller.getDimensions();
		
		// are we connected to a pivot table?
		var invert = controller.getSelectedRange;
		if (!invert) {
			var seriesSize = controller.getDimSize(1);
			var seriesCount = controller.getDimSize(2);
			var labelDim = 2;
			var titleCol = -1;
			var latCol = -1;
			var longCol = -1;
			var clickableCol = -1;
			var miCol = -1;
			var specIconCol = -1;
		}
		else {
			var seriesSize = controller.getDimSize(2);
			var seriesCount = controller.getDimSize(1);
			var labelDim = 1;
		}
		
		if (seriesCount > 0)
		{
			// find long and lat and title columns
			if (!invert)
				for (var p = 0; p < seriesSize; p++) 
				{
					var pname = controller.getPropertyName(p);
					if (pname == this.latitudeProperty) {
						latCol = p;
					}
					if (pname == this.longitudeProperty) {
						longCol = p;
					}
					if (pname == this.markerTitleProperty) {
						titleCol = p;
					}
					if (pname == this.isClickableProperty) {
						clickableCol = p;
					}
					if (pname == this.markerIconProperty) {
						miCol = p;
					}
					if (pname == this.markerSpecialProperty) {
						specIconCol = p;
					}
				}
		
			
			// each series corresponds to a marker
			if (invert || (latCol >= 0 && longCol >= 0))
				for (var n = 0; n < seriesCount; n++) 
				{
					var isClickable = 1;
					var mi = null;
					var specIcon = 0;
					var sname = controller.getLabel(n,labelDim);

					if (!invert) {
						var lat = controller.getData(latCol,n);
						var long = controller.getData(longCol,n);
						if (titleCol >= 0) sname = controller.getData(titleCol,n);
						if (clickableCol >= 0) isClickable = controller.getData(clickableCol,n);
						if (miCol >= 0) mi = controller.getData(miCol,n);
						if (specIconCol >= 0) specIcon = controller.getData(specIconCol,n);
					}
					else {
						var lat = controller.getDataByName(this.latitudeProperty,n);
						var long = controller.getDataByName(this.longitudeProperty,n);
						if (this.markerTitleProperty != '') sname = controller.getDataByName(this.markerTitleProperty,n);
						if (this.isClickableProperty != '') isClickable = controller.getDataByName(this.isClickableProperty,n);
						if (this.markerIconProperty != '') mi = controller.getDataByName(this.markerIconProperty,n);
						if (this.markerSpecialProperty != '') specIcon = controller.getDataByName(this.markerSpecialProperty,n);
					}
			
					if (!isNaN(parseFloat(lat)) && !isNaN(parseFloat(long))) {
						var data = [];
						if (this.markerDataProperties != '')
						{
							var props = this.markerDataProperties.split(",");
							for (var i = 0; i < props.length; i++) {
							    data[props[i]] = controller.getDataByName(props[i],n);
							}
						}
						
						if (!mi) mi = this.markerIcon;
					
						this._markerData[this._markerData.length] = {
							title: sname,
							latitude: lat,
							longitude: long,
							isClickable: (!isClickable ? 1 : isClickable),
							icon: mi,
							specialIcon: specIcon,
							data: data
						};
					}
				}
		}
	}
	
	// array of polygon data
	this._polygonData = [];
	
	if (this.coordsJsFile && !this._polygonCoords)
	{
		this._polygonCoords = [];
		loadCoordinates(this._polygonCoords);
	}
	
	if (controller && (this.coordsProperty != '')) 
	{
		// get data from controller (make sure data is loaded)
		var dims = controller.getDimensions();
		
		// are we connected to a pivot table?
		var invert = controller.getSelectedRange;
		if (!invert) {
			var seriesSize = controller.getDimSize(1);
			var seriesCount = controller.getDimSize(2);
			var labelDim = 2;
			var titleCol = -1;
			var coordsCol = -1;
			var colorCol = -1;
			var foCol = -1;
			var clickableCol = -1;
		}
		else {
			var seriesSize = controller.getDimSize(2);
			var seriesCount = controller.getDimSize(1);
			var labelDim = 1;
		}

		if (seriesCount > 0)
		{
			// find coords and color columns
			if (!invert)
				for (var p = 0; p < seriesSize; p++) 
				{
					var pname = controller.getPropertyName(p);
					if (pname == this.coordsProperty) {
						coordsCol = p;
					}
					if (pname == this.colorProperty) {
						colorCol = p;
					}
					if (pname == this.fillOpacityProperty) {
						foCol = p;
					}
					if (pname == this.isClickableProperty) {
						clickableCol = p;
					}					
					if (pname == this.polygonTitleProperty) {
						titleCol = p;
					}
				}

			// each series corresponds to a poly
			for (var n = 0; n < seriesCount; n++)
			{
				var color = 'purple';
				var fo = this.fillOpacity;  // default opacity
				var isClickable = 1;
				
				var sname = controller.getLabel(n,labelDim);

				if (!invert) {
					if (coordsCol<0) break;
					var coords = controller.getData(coordsCol,n);
					if (colorCol >= 0) color = controller.getData(colorCol,n);
					if (foCol >= 0) fo = controller.getData(foCol,n);
					if (clickableCol >= 0) isClickable = controller.getData(clickableCol,n);
					if (titleCol >= 0) sname = controller.getData(titleCol,n);
				}
				else {
					var coords = controller.getDataByName(this.coordsProperty,n);
					if (this.colorProperty != '') color = controller.getDataByName(this.colorProperty,n);
					if (this.fillOpacityProperty != '') fo = controller.getDataByName(this.fillOpacityProperty,n);
					if (this.isClickableProperty != '') isClickable = controller.getDataByName(this.isClickableProperty,n);
					if (this.polygonTitleProperty != '') sname = controller.getDataByName(this.polygonTitleProperty,n);
				}
				
				if (!fo) fo = this.fillOpacity;  // default opacity

				if (this.coordsJsFile) coords = this._polygonCoords[coords];
				
				if (!coords) continue;
				
				var pathsSets = coords.split(";");
				for (var j = 0; j < pathsSets.length; j++) {
					var paths = pathsSets[j].split(" ");
					for (var i = 0; i < paths.length; i++) {
						var p = paths[i].split(",")
					    paths[i] = new google.maps.LatLng(p[1], p[0], p[2]);
					}
					pathsSets[j] = paths;
				}
			
				var data = [];
			
				if (this.polygonDataProperties != '')
				{
					var props = this.polygonDataProperties.split(",");
					for (var i = 0; i < props.length; i++) {
					    data[props[i]] = controller.getDataByName(props[i],n);
					}
				}
				
				this._polygonData[this._polygonData.length] = {
					title: sname,
					coords: pathsSets,
					color: (!color ? 'purple' : color),
					fo: (!fo ? 0.1 : fo),
					isClickable: (!isClickable ? 1 : isClickable),
					data: data
				};

			}
		}
	}
	
	// Нет полигонов - скрываем слайдер
	if (this._polygonData && this._polygonData.length > 0) 
		$("#rangeSliderEdit").show();
	else
		$("#rangeSliderEdit").hide();
	
	// При каждом обновлении данных закрываем слайдер
	$("#leftSliderPart" ).hide();
	$("#btnSaveRanges").attr('value', 'Change range');
}

/// Internal method: sync markers to data from controller.
ClientMethod syncMarkers() [ Internal, Language = javascript ]
{
	try {
		var controller = this.getController();
		if (null == controller) {
			return;
		}
	
		this.clearMarkers();

		if (this._markerData) {
			for (var n = 0; n < this._markerData.length; n++) {
				var md = this._markerData[n];
				if (md) 
				{
					if(this.markerSpecialIcon != "" && md.specialIcon == 1)
						md.icon = this.markerSpecialIcon;
						
					// Имя маркера + значение для него, значение разбивается по тройкам
					md.title = md.data.Name + ' (' + this.beatNumber(md.data['Value']) + ' ' + this._sliderRangeData.unitName + ')';
					
					var marker = this.addMarker(n,md.latitude,md.longitude,md.title,md.isClickable,md.icon,md.data);
					if (marker) zenInvokeCallbackMethod(this.onaddmarker,this,'onaddmarker','marker',marker);
				}
			}
		}
	}
	catch(ex) {
		alert('Error in syncMarkers ' + ex.message);
	}
}

/// Internal method: sync polygons to data from controller.
ClientMethod syncPolygons() [ Internal, Language = javascript ]
{
	function TooltipOverlay(map, title)
	{
		this.map_ = map; 
		this.div_ = null;
		this.title_ = title;
		this.setMap(map);
	};
  	
	TooltipOverlay.prototype = new google.maps.OverlayView();
	
	TooltipOverlay.prototype.onAdd = function()
	{
		var div = document.createElement('div');
		div.appendChild(document.createTextNode(this.title_));
		div.style.border = 'solid 1px #000000';
		div.style.color = '#000000';
		div.style.backgroundColor = '#ffffe1';
		div.style.whiteSpace = 'nowrap';
		div.style.font = 'icon';
		if (navigator.userAgent.indexOf("Safari")>=0 || navigator.userAgent.indexOf("Chrome")>=0)
		{
			div.style.fontFamily = "Tahoma,sans-serif";
			div.style.fontSize = "13px";
		}
		div.style.MozBoxShadow = '2px 2px 4px #7f7f7f';
		div.style.boxShadow = '2px 2px 4px #7f7f7f';
		div.style.padding = '2px 3px'; 
		div.style.position = 'absolute';
		div.style.visibility = "hidden";
		this.div_ = div;
		
		var panes = this.getPanes();
		panes.floatShadow.appendChild(div);
	}
	
	TooltipOverlay.prototype.onRemove = function() 
	{
		if (this.div_) this.div_.parentNode.removeChild(this.div_);
		this.div_ = null;
	}
	
	TooltipOverlay.prototype.draw = function() {}
	
	TooltipOverlay.prototype.hide = function() 
	{
		if (this.div_) this.div_.style.visibility = "hidden";
	}

	TooltipOverlay.prototype.show = function(latLng)
	{
		if (this.div_) 
		{
			var point = this.getProjection().fromLatLngToDivPixel(latLng)
			this.div_.style.left = point.x + 'px';
			this.div_.style.top = (point.y - parseInt(this.div_.offsetHeight)) + 'px';
			this.div_.style.visibility = "visible";
		}
	}
	
	var map = this.getMapObject();
	
	try {
		var controller = this.getController();
		if (null == controller) {
			return;
		}
	
		this.clearPolygons();
		
		if (this._polygonData && this._polygonData.length > 0) 
		{
			
			// Максимальное и минимальное значение из выборки
			var minMaxData = {min: null, max: null};
			this.setMinMaxPolygonValue(minMaxData, 'Value');
			
			if(!$("#leftSliderPart").is(":visible"))
			{
				// Границы для этой выборки и имя у.е. - min;max;y.e
				var bordersData = this.GetBordersData(this._polygonData[0].data.ParameterId, this._polygonData[0].data.Level, this._sliderRangeData.currGuid).split(';');
				
				this._sliderRangeData = {parameterId: this._polygonData[0].data.ParameterId,
										 currGuid: this._sliderRangeData.currGuid,
										 level: this._polygonData[0].data.Level,
										 rangeValueMax: Math.ceil(minMaxData.max),
										 rangeValueMin: Math.floor(minMaxData.min),
										 currRangeValueMin: Math.floor(bordersData[0]),
										 currRangeValueMax: Math.ceil(bordersData[1]),
										 unitName: bordersData[2],
										 isChanged: false};
			}
			
			for (var n = 0; n < this._polygonData.length; n++) 
			{
				var md = this._polygonData[n];
				if (md) 
				{
					// Имя полигона + значение для него, значение разбивается по тройкам
					md.title = md.data.Name + ' (' + this.beatNumber(md.data.Value) + ' ' + this._sliderRangeData.unitName + ')';
					md.color = this.getColor(this._sliderRangeData.currRangeValueMin, this._sliderRangeData.currRangeValueMax, md.data['Value']);
					
					var poly = this.addPolygon(n, md.coords, md.color, md.fo, md.isClickable, md.title, md.data);
					
					if (poly && map && md.title) 
						poly.tooltip = new TooltipOverlay(map, md.title);
					
					if (poly) 
						zenInvokeCallbackMethod(this.onaddpolygon,this,'onaddpolygon','polygon',poly);
				}
			}
			
			
		}
	}
	catch(ex) {
		alert('Error in syncPolygons ' + ex.message);
	}
}

/// Calculate color for polygon
ClientMethod getColor(min, max, value) [ Language = javascript ]
{
	if (!value) return 'rgb(0,0,0)';
	
	// Крайнии границы: красный и зеленый, цвет для середины - желтый
	var middle = (max + min) / 2;
	
	if (value <= middle)
    {
        var redPart = (value - min) / (middle - min);
        return "rgb(" + Math.round(255 * redPart) + ",255, 0)";
    }
    else
    {
        var greenPart = (max - value) / (max - middle);
        return "rgb(255," + Math.round(255 * greenPart) + ", 0)";
    }
}

/// Search and set min|max values from all polygons.
ClientMethod setMinMaxPolygonValue(minMaxData, nameValueProperty) [ Language = javascript ]
{
	if (this._polygonData.length == 0 || !nameValueProperty)
		return;
	
	minMaxData.min = parseFloat(this._polygonData[0].data[nameValueProperty]); 
	minMaxData.max = parseFloat(this._polygonData[0].data[nameValueProperty]);
	
	for (var n = 1; n < this._polygonData.length; n++) 
	{
		var value = parseFloat(this._polygonData[n].data[nameValueProperty]);
		if (minMaxData.min > value)
			minMaxData.min = value;
		else if (minMaxData.max < value)
			minMaxData.max = value;
	}
}

/// Perform a drilldown
ClientMethod drillDown(title, latLng, zoom, data) [ Internal, Language = javascript ]
{
	
	var map = this.getMapObject();
	
	if (map)
	{
		this._prevZoom.push(map.getZoom());
		this._prevCenter.push(map.getCenter());
	
		map.setZoom(parseInt(zoom));
		map.setCenter(latLng);
	
		if (this._drillDownTitle.length > 0) this._drillDownTitle[this._drillDownTitle.length - 1].hide();
		
		this._drillDownTitle.push(this.newDrillDownTitleOverlay(map, 'zenPage.getComponent('+this.index+').drillUp();', title, this.drillUpButtonPosition));
		this._drillDownTitle[this._drillDownTitle.length - 1].show();
	
		zenInvokeCallbackMethod(this.ondrilldown,this,'ondrilldown','data',data);
	}
}

ClientMethod newDrillDownTitleOverlay(mapRef, clickHandler, text, drillUpButtonPosition) [ Internal, Language = javascript ]
{
 	function DrillDownTitleOverlay(map, onclickHandler, titleText, drillUpButtonPosition) 
	{
		this.map_ = map; 
		this.div_ = null;
		this.divTitle_ = null;
		this.titleText_ = titleText;
		this.onclickHandler_ = onclickHandler;
		this.rect_ = null;
		this.visible_ = false;
		this.drillUpButtonPosition_ = drillUpButtonPosition;
		this.setMap(map);
	};

	DrillDownTitleOverlay.prototype = new google.maps.OverlayView();

	DrillDownTitleOverlay.prototype.onAdd = function() 
	{
		this.visible_ = true;
	}

	DrillDownTitleOverlay.prototype.onRemove = function() 
	{
		if (this.div_) this.div_.parentNode.removeChild(this.div_);
		if (this.divTitle_) this.divTitle_.parentNode.removeChild(this.divTitle_);
		if (this.rect_) this.rect_.setMap(null);
		this.div_ = null;
		this.divTitle_ = null;
		this.rect_ = null;
	}

	DrillDownTitleOverlay.prototype.draw = function() 
	{
		var overlayProjection = this.getProjection();
		
		if (this.div_) this.div_.parentNode.removeChild(this.div_);
		if (this.divTitle_) this.divTitle_.parentNode.removeChild(this.divTitle_);
		if (this.rect_) this.rect_.setMap(null);

		var div = document.createElement('div');
		div.appendChild(document.createTextNode('<<  ' + 'Back'));
		div.style.border = 'solid 1px #000000';
		div.style.color = '#ffffff';
		div.style.backgroundColor = '#356B8D';
		div.style.MozBoxShadow = '2px 2px 4px #7f7f7f';
		div.style.boxShadow = '2px 2px 4px #7f7f7f';
		div.style.whiteSpace = 'nowrap';
		div.style.font = 'icon';
		if (navigator.userAgent.indexOf("Safari")>=0 || navigator.userAgent.indexOf("Chrome")>=0)
		{
			div.style.fontFamily = "Tahoma,sans-serif";
			div.style.fontSize = "13px";
		}
		div.style.padding = '2px 8px'; 
		div.style.position = 'absolute';
		div.style.display = 'block';
		div.style.visibility = (this.visible_ ? "visible" : "hidden");
		this.div_ = div;
		var div2 = document.createElement('div');
		div2.appendChild(document.createTextNode(this.titleText_));
		div2.style.border = 'solid 1px #000000';
		div2.style.color = '#000000';
		if (navigator.userAgent.indexOf("MSIE")>=0)
		{
			div2.style.backgroundColor = 'white';
		}
		else
		{
			div2.style.backgroundColor = 'rgba(255, 255, 255, 0.8)';
		}	
		div2.style.MozBoxShadow = '2px 2px 4px #7f7f7f';
		div2.style.boxShadow = '2px 2px 4px #7f7f7f';
		div2.style.whiteSpace = 'nowrap';
		div2.style.font = 'icon';
		if (navigator.userAgent.indexOf("Safari")>=0 || navigator.userAgent.indexOf("Chrome")>=0)
		{
			div2.style.fontFamily = "Tahoma,sans-serif";
			div2.style.fontSize = "13px";
		}
		div2.style.fontWeight = 'bold';
		div2.style.padding = '2px 8px'; 
		div2.style.position = 'absolute';
		div2.style.display = 'block';
		div2.style.visibility = (this.visible_ ? "visible" : "hidden");
		this.divTitle_ = div2;

		var panes = this.getPanes();
		panes.floatPane.appendChild(this.div_);
		panes.floatPane.appendChild(this.divTitle_);
	
		if (this.drillUpButtonPosition_ == 'bottom')
		{
			var x = 12
			var y = parseInt(this.map_.getDiv().style.height) - 50
		}
		else
		{
			var x = 70
			var y = 5
		}
		var point = overlayProjection.fromLatLngToDivPixel(overlayProjection.fromContainerPixelToLatLng(new google.maps.Point(x, y)));
		this.div_.style.left = point.x + 'px';
		this.div_.style.top = point.y + 'px';

		var sw = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(point.x, point.y + parseInt(this.div_.offsetHeight)));
		var ne = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(point.x + parseInt(this.div_.offsetWidth), point.y));
		var rectBounds = new google.maps.LatLngBounds(sw, ne);

		this.rect_ = new google.maps.Rectangle({
			bounds: rectBounds,
			clickable: true,
			fillOpacity: 0,
			strokeOpacity: 0,
			zIndex: 10,
			map: (this.visible_ ? this.map_ : null)});

		google.maps.event.addListener(this.rect_, 'click', new Function(this.onclickHandler_));

		var point = new google.maps.Point(x + parseInt(this.div_.offsetWidth) - 1, 5);
		point = overlayProjection.fromLatLngToDivPixel(overlayProjection.fromContainerPixelToLatLng(point));
		this.divTitle_.style.left = point.x + 'px';
		this.divTitle_.style.top = this.div_.style.top;
		
		this.div_.style.height = (parseInt(this.divTitle_.offsetHeight) - 6) + 'px';
		this.divTitle_.style.height = (parseInt(this.divTitle_.offsetHeight) - 6) + 'px';
	}

	DrillDownTitleOverlay.prototype.hide = function() 
	{
		if (this.div_) this.div_.style.visibility = "hidden";
		if (this.divTitle_) this.divTitle_.style.visibility = "hidden";
		if (this.rect_) this.rect_.setMap(null);
		
		this.visible_ = false;
	}

	DrillDownTitleOverlay.prototype.show = function() 
	{
		if (this.div_) this.div_.style.visibility = "visible";
		if (this.divTitle_) this.divTitle_.style.visibility = "visible";
		if (this.rect_) this.rect_.setMap(this.map_);
		
		this.visible_ = true;
	}
	
	return new DrillDownTitleOverlay(mapRef, clickHandler, text, drillUpButtonPosition);
}

ClientMethod centerChangedHandler() [ Internal, Language = javascript ]
{
	if (this._drillDownTitle.length > 0) this._drillDownTitle[this._drillDownTitle.length - 1].draw();
}

/// Restores map parameters (center, zoom and "drilldown title") to their state before drilldown was performed
ClientMethod drillUp() [ Internal, Language = javascript ]
{
	var map = this.getMapObject();
	
	if (map)
	{
		if (this._drillDownTitle.length > 0)
		{
			this._drillDownTitle[this._drillDownTitle.length - 1].hide();
			this._drillDownTitle[this._drillDownTitle.length - 1].setMap(null);
			this._drillDownTitle.pop();
			if (this._drillDownTitle.length > 0) this._drillDownTitle[this._drillDownTitle.length - 1].show();
		}

		if (this._prevZoom.length > 0)
		{
			map.setZoom(this._prevZoom[this._prevZoom.length - 1]);
			this._prevZoom.pop();
		}
		
		if (this._prevCenter.length > 0)
		{
			map.setCenter(this._prevCenter[this._prevCenter.length - 1]);
			this._prevCenter.pop();
		}
	
		zenInvokeCallbackMethod(this.ondrillup,this,'ondrillup');
	}
}

/// Obtain a reference to a filter (or any other widget control).
ClientMethod getControl(ind) [ Language = javascript ]
{
  return zenPage.getComponent(this.parent.parent.controlIndices[ind]);
}

/// Get the array of filter state information for the widget.
ClientMethod getFilterStateArray() [ Language = javascript ]
{
	return this.parent.parent.getFilterStateArray();
}

/// Internal method: clear markers from map.
ClientMethod clearMarkers() [ Internal, Language = javascript ]
{
	try {
		// kill old markers
		if (this._markers) {
			for (var n = 0; n < this._markers.length; n++) {
				this.removeMarker(this._markers[n]);
			}
		}
		this._markers = [];
	}
	catch(ex) {
		alert('Error in clearMarkers ' + ex.message);
	}
}

/// Internal method: clear polygons from map.
ClientMethod clearPolygons() [ Internal, Language = javascript ]
{
	try {
		// kill old polygons
		if (this._polygons) {
			for (var n = 0; n < this._polygons.length; n++) {
				this.removePolygon(this._polygons[n]);
			}
		}
		this._polygons = [];
	}
	catch(ex) {
		alert('Error in clearPolygons ' + ex.message);
	}
}

/// Invoke the google geocoder api to lookup an address string and move the map to view it.
/// Applications that call this are responsible for adhering to the google geocoder api terms of use.
ClientMethod panToAddress(address) [ Language = javascript ]
{
	if (('undefined' == typeof google)||('undefined' == typeof google.maps)) {
		return '';
	}

	var callback = new Function('results','status','zenPage.getComponent('+this.index+').geocodeAddressHandler(results,status)');
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({ 'address': address}, callback);
}

/// Callback for geocoder API.
ClientMethod geocodeAddressHandler(results, status) [ Internal, Language = javascript ]
{
	if (status == google.maps.GeocoderStatus.OK) {
		var map = this.getMapObject();
		if (map) {
			map.setCenter(results[0].geometry.location);
		}
	}
	else {
		alert("Address not found: " + status);
	}
}

Method %DrawHTML()
{
	// This causes ZEN to render this component on the client.
	set ..renderFlag = ..renderFlag + 1
	
	// copy ..settings into properties
	#dim propName As %String = $order(..settings(""))
	while (propName '= "")
	{
		if ("" '= $get(..settings(propName)))
			try
			{
				set $property($this, propName) = ..settings(propName)
			}
			catch {}

		set propName = $order(..settings(propName))
	}
	
	&html<<script type="text/javascript">
	function hsv2rgb(h,s,v) 
	{
		// Adapted from http://www.easyrgb.com/math.html
		// hsv values = 0 - 1, rgb values = 0 - 255
		var r, g, b;
		var RGB = new Array();
		if(s == 0)
		{
		  RGB['red']=RGB['green']=RGB['blue']=Math.round(v*255);
		}
		else
		{
		  var var_h = h * 6;  // h must be < 1
		  if (var_h == 6) var_h = 0;
		  var var_i = Math.floor( var_h );
		  var var_1 = v*(1-s);
		  var var_2 = v*(1-s*(var_h-var_i));
		  var var_3 = v*(1-s*(1-(var_h-var_i)));
		  if (var_i == 0)
		  {
		    var_r = v; 
		    var_g = var_3; 
		    var_b = var_1;
		  }
		  else if (var_i == 1)
		  {
		    var_r = var_2;
		    var_g = v;
		    var_b = var_1;
		  }
		  else if (var_i == 2)
		  {
		    var_r = var_1;
		    var_g = v;
		    var_b = var_3
		  }
		  else if (var_i == 3)
		  {
		    var_r = var_1;
		    var_g = var_2;
		    var_b = v;
		  }
		  else if (var_i == 4)
		  {
		    var_r = var_3;
		    var_g = var_1;
		    var_b = v;
		  }
		  else
		  {
		    var_r = v;
		    var_g = var_1;
		    var_b = var_2
		  }
		  RGB['red'] = Math.round(var_r * 255);
		  RGB['green'] = Math.round(var_g * 255);
		  RGB['blue'] = Math.round(var_b * 255);
		}
		return '#' + RGB['red'].toString(16) + RGB['green'].toString(16) + RGB['blue'].toString(16);
	};
	</script>>
	
	if (..coordsJsFile '= "")
	{
		&html<<script type='text/javascript' src='#(..coordsJsFile)#'></script>>
	}
	
	// JQUERY Libraries
	&html<<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	      <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>>
}

ClientMethod onApplyFilters(refresh) [ Internal, Language = javascript ]
{
	zenInvokeCallbackMethod(this.onapplyfilters,this,'onapplyfilters','refresh',refresh);
}

/// Save borders for current level, parameter and parent region
Method SaveBorders(paramId As %String, level As %Integer, regionId As %String, min As %Integer, max As %Integer) As %ZEN.Datatype.string [ ZenMethod ]
{
	quit ##class(USA.Borders).SetBorders(paramId, level, regionId, min, max)
}

/// Get the minimum and maximum value, and unit name ("min;max;y.e")
Method GetBordersData(paramId As %String, level As %Integer, regionId As %String) As %ZEN.Datatype.string [ ZenMethod ]
{
	quit ##class(USA.Borders).GetBorders(paramId, level, regionId)
}

/// Beat any number on three-digit numbers (123131413.45 => 123 131 413.45)
ClientMethod beatNumber(num) [ Language = javascript ]
{
	if (num == undefined) return '';
	
	return num.toString().replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 ');
}

/// All parameters data in infowindow
Method GetParametersDataForInfoWindow(guid As %String) As %ZEN.Datatype.string [ ZenMethod ]
{
	set result = ""
	
	&sql(DECLARE PCur CURSOR FOR 
		 SELECT Parameter->Name, Parameter->UnitName, Value  
		 FROM USA.ParameterValue
		 WHERE Area = :guid)	
		 
	&sql(OPEN PCur)
	for  
	{
		&sql(FETCH PCur INTO :paramName, :paramUnitName, :paramValue) 
		quit:(SQLCODE '= 0)
		
		if (paramValue = 0)
		{
			set paramValue = "нет данных"
			set paramUnitName = ""
		}
		else
		{
			set paramValue = $NUMBER(paramValue,3)
		}
		
		set result = result_"<br/>"_paramName_" : "_paramValue_" "_paramUnitName
	}
	
	&sql(CLOSE PCur)
	
	quit result
}

/// Open|close slider
ClientMethod openEditRange() [ Language = javascript ]
{
	if($("#leftSliderPart").is(":visible"))
	{
		$("#leftSliderPart" ).hide(1);
		$("#btnSaveRanges").attr('value', 'Change range');
		
		if (this._sliderRangeData.isChanged == true)
		{
			var res = this.SaveBorders(this._sliderRangeData.parameterId, this._sliderRangeData.level, this._sliderRangeData.currGuid, this._sliderRangeData.currRangeValueMin, this._sliderRangeData.currRangeValueMax);
			if (res != 1) alert('Ошибка. Диапазон не сохранен.');
		}
		
		this._sliderRangeData.isChanged = false;
	}
	else
	{
		// Шаг и диапазон - int
		var range = this._sliderRangeData.rangeValueMax - this._sliderRangeData.rangeValueMin;
		var step = 1;
		
		if (range >= 100000000)	step = 100000;
		else if (range >= 10000000)	step = 10000;
		else if (range >= 1000000) step = 1000;
		else if (range >= 100000) step = 100;
		else if (range >= 10000) step = 10;
		
		var modulo = range % step;
		
		if (modulo != 0)
		{
			// Если диапазон не кратен шагу, то распределяем остаток по "бокам" - поровну. Если слева уходим в минус, то остаток прибавлем к правой границе.
			var halfModulo = (step - modulo)/2;
			
			if ( this._sliderRangeData.rangeValueMin < Math.floor(halfModulo))
			{
				this._sliderRangeData.rangeValueMax += Math.ceil(halfModulo) + (Math.floor(halfModulo) - this._sliderRangeData.rangeValueMin);
				this._sliderRangeData.rangeValueMin = 0;
			}
			else
			{
				this._sliderRangeData.rangeValueMin -= Math.floor(halfModulo);
				this._sliderRangeData.rangeValueMax += Math.ceil(halfModulo);
			}
		}
		
		
		$( "#slider-range" ).slider({
								 range: true,
								 min: this._sliderRangeData.rangeValueMin,
								 max: this._sliderRangeData.rangeValueMax,
								 step: step,
								 values: [ this._sliderRangeData.currRangeValueMin, this._sliderRangeData.currRangeValueMax],
								 stop: function(event, ui) 
								 		{ 
											var values = $("#slider-range").slider( "option", "values" );
											
											var mapPortlet = zenPage.getComponentById($( "#slider-range" ).attr('widgetId'));
											mapPortlet._sliderRangeData.currRangeValueMin = values[0];
											mapPortlet._sliderRangeData.currRangeValueMax = values[1];
											mapPortlet._sliderRangeData.isChanged = true;
											mapPortlet.syncPolygons();
								 		},
								 slide: function( event, ui ) 
								 		{
											var mapPortlet = zenPage.getComponentById($( "#slider-range" ).attr('widgetId'));
											
											$( "#valuesSliderRange" ).val( mapPortlet.beatNumber(ui.values[ 0 ]) + "   -   " + mapPortlet.beatNumber(ui.values[ 1 ]) + " " + mapPortlet._sliderRangeData.unitName );
										}
								});
	
		$( "#minSliderRange" ).val( this.beatNumber(this._sliderRangeData.rangeValueMin) + " " + this._sliderRangeData.unitName);
		$( "#maxSliderRange" ).val( this.beatNumber(this._sliderRangeData.rangeValueMax) + " " + this._sliderRangeData.unitName);	
		$( "#valuesSliderRange" ).val(this.beatNumber($( "#slider-range" ).slider( "values", 0 )) + "   -   " + this.beatNumber($( "#slider-range" ).slider( "values", 1 )) + " " + this._sliderRangeData.unitName);

	
		$("#leftSliderPart" ).show(1);
		$("#btnSaveRanges").attr('value', 'Save range');
	}
}

/// Style for the portlet
XData Style
{
<style type="text/css">
input:read-only
{
	background-color:white;
}

.sliderEditLeft,.sliderEditRight,.sliderEditLeftAction {
  border: 1px solid rgb(0, 0, 0);
color: rgb(255, 255, 255);
background-color: rgb(53, 107, 141);
box-shadow: rgb(127, 127, 127) 2px 2px 4px;
white-space: nowrap;
font: icon;
font-family: Tahoma, sans-serif;
font-size: 13px;
padding: 1px 8px;
display: block;
visibility: visible;
left: 70px;
top: 5px;
}

#btnSaveRanges:hover, #slider-range:hover,.sliderEditLeftAction:hover 
{

	cursor: pointer;
}

#btnSaveRanges
{
	float: right;
}

#maxSliderRange, #minSliderRange, #valuesSliderRange 
{
	width: 220px;
	border: 0; 
	color: #356B8D; 
	font-weight: bold;
}

#maxSliderRange:hover, #minSliderRange:hover, #valuesSliderRange:hover
{
	cursor: pointer;
}


#valuesSliderRange
{
	text-align: center;
}

#minSliderRange
{
	text-align: left;
}

#maxSliderRange
{
	text-align: right;
}

.sliderEditLeft{
background-color: white;
}

#leftSliderPart
{
	float:left; 
	height:48px;
	width: 650px;
	display: none;
	padding: 5px 15px 8px 15px;
	margin-top: -2px;
}

.sliderEditLeftAction
{
	display: inline;
	margin: 5px 0 0 37px;
}

#rightSliderPart
{
	margin-right: -2px;
}

#actionButtons
{
	padding-top: 5px;
}

	@-moz-document url-prefix() 
	{
  		#leftSliderPart 
  		{
	  		margin-top: -1px;
			margin-right: -2px;
			height:44px;
		}
		
		#maxSliderRange, #minSliderRange, #valuesSliderRange 
		{
			padding-bottom: 5px;
		}
		
		#rightSliderPart 
		{
    		margin-top: 2px;
		}
		
		.sliderEditLeft,.sliderEditRight,.sliderEditLeftAction 
		{
			padding: 0px 8px;
		}
	}

.portletDiv {
	padding: 5px;
	font-size: 25px;
}

/*=========================*/
.ui-slider {
	position: relative;
	text-align: left;
}

.ui-slider .ui-slider-handle {
	position: absolute;
	z-index: 2;
	width: 1.2em;
	height: 1.2em;
	cursor: default;
}
.ui-slider .ui-slider-range {
	position: absolute;
	z-index: 1;
	font-size: .7em;
	display: block;
	border: 0;
	background-position: 0 0;
}

/* For IE8 - See #6727 */
.ui-slider.ui-state-disabled .ui-slider-handle,
.ui-slider.ui-state-disabled .ui-slider-range {
	filter: inherit;
}

.ui-slider-horizontal {
	height: .8em;
}
.ui-slider-horizontal .ui-slider-handle {
	top: -.3em;
	margin-left: -.6em;
}
.ui-slider-horizontal .ui-slider-range {
	top: 0;
	height: 100%;
}
.ui-slider-horizontal .ui-slider-range-min {
	left: 0;
}
.ui-slider-horizontal .ui-slider-range-max {
	right: 0;
}

.ui-widget {
	font-family: Verdana,Arial,sans-serif;
	font-size: 1.1em;
}
.ui-widget .ui-widget {
	font-size: 1em;
}
.ui-widget input,
.ui-widget select,
.ui-widget textarea,
.ui-widget button {
	font-family: Verdana,Arial,sans-serif;
	font-size: 1em;
}
.ui-widget-content {
	border: 1px solid #aaaaaa;
	background: #ffffff url(images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x;
	color: #222222;
}
.ui-widget-content a {
	color: #222222;
}
.ui-widget-header {
	border: 1px solid #aaaaaa;
	background-color: #cccccc;
	color: #222222;
	font-weight: bold;
}
.ui-widget-header a {
	color: #222222;
}

.ui-state-default,
.ui-widget-content .ui-state-default,
.ui-widget-header .ui-state-default {
	border: 1px solid #d3d3d3;
	background: #e6e6e6 url(images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x;
	font-weight: normal;
	color: #555555;
}
.ui-state-default a,
.ui-state-default a:link,
.ui-state-default a:visited {
	color: #555555;
	text-decoration: none;
}
.ui-state-hover,
.ui-widget-content .ui-state-hover,
.ui-widget-header .ui-state-hover,
.ui-state-focus,
.ui-widget-content .ui-state-focus,
.ui-widget-header .ui-state-focus {
	border: 1px solid #999999;
	background: #dadada url(images/ui-bg_glass_75_dadada_1x400.png) 50% 50% repeat-x;
	font-weight: normal;
	color: #212121;
}
.ui-state-hover a,
.ui-state-hover a:hover,
.ui-state-hover a:link,
.ui-state-hover a:visited {
	color: #212121;
	text-decoration: none;
}
.ui-state-active,
.ui-widget-content .ui-state-active,
.ui-widget-header .ui-state-active {
	border: 1px solid #aaaaaa;
	background: #ffffff url(images/ui-bg_glass_65_ffffff_1x400.png) 50% 50% repeat-x;
	font-weight: normal;
	color: #212121;
}
.ui-state-active a,
.ui-state-active a:link,
.ui-state-active a:visited {
	color: #212121;
	text-decoration: none;
}

.ui-state-highlight,
.ui-widget-content .ui-state-highlight,
.ui-widget-header .ui-state-highlight {
	border: 1px solid #fcefa1;
	background: #fbf9ee url(images/ui-bg_glass_55_fbf9ee_1x400.png) 50% 50% repeat-x;
	color: #363636;
}
.ui-state-highlight a,
.ui-widget-content .ui-state-highlight a,
.ui-widget-header .ui-state-highlight a {
	color: #363636;
}
.ui-state-error,
.ui-widget-content .ui-state-error,
.ui-widget-header .ui-state-error {
	border: 1px solid #cd0a0a;
	background: #fef1ec url(images/ui-bg_glass_95_fef1ec_1x400.png) 50% 50% repeat-x;
	color: #cd0a0a;
}
.ui-state-error a,
.ui-widget-content .ui-state-error a,
.ui-widget-header .ui-state-error a {
	color: #cd0a0a;
}
.ui-state-error-text,
.ui-widget-content .ui-state-error-text,
.ui-widget-header .ui-state-error-text {
	color: #cd0a0a;
}
.ui-priority-primary,
.ui-widget-content .ui-priority-primary,
.ui-widget-header .ui-priority-primary {
	font-weight: bold;
}
.ui-priority-secondary,
.ui-widget-content .ui-priority-secondary,
.ui-widget-header .ui-priority-secondary {
	opacity: .7;
	filter:Alpha(Opacity=70);
	font-weight: normal;
}
.ui-state-disabled,
.ui-widget-content .ui-state-disabled,
.ui-widget-header .ui-state-disabled {
	opacity: .35;
	filter:Alpha(Opacity=35);
	background-image: none;
}
.ui-state-disabled .ui-icon {
	filter:Alpha(Opacity=35); /* For IE8 - See #6059 */
}

.ui-widget-content .ui-icon {
	background-image: url(images/ui-icons_222222_256x240.png);
}

.ui-widget-header .ui-icon {
	background-image: url(images/ui-icons_222222_256x240.png);
}

.ui-state-default .ui-icon {
	background-image: url(images/ui-icons_888888_256x240.png);
}

/* Corner radius */
.ui-corner-all,
.ui-corner-top,
.ui-corner-left,
.ui-corner-tl {
	border-top-left-radius: 4px;
}
.ui-corner-all,
.ui-corner-top,
.ui-corner-right,
.ui-corner-tr {
	border-top-right-radius: 4px;
}
.ui-corner-all,
.ui-corner-bottom,
.ui-corner-left,
.ui-corner-bl {
	border-bottom-left-radius: 4px;
}
.ui-corner-all,
.ui-corner-bottom,
.ui-corner-right,
.ui-corner-br {
	border-bottom-right-radius: 4px;
}

</style>
}

Parameter XMLTYPE = "USAXMLTYPE";

/// This parameter provides the default XMLTYPE for the class. If it is
/// empty then the class name will be used to construct a default XML type.
/// 
/// The default XMLTYPE is used when naming and referencing this type 
/// in a schema and the schema context did not provide an XML type name.

}

