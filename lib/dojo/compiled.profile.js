dependencies = {	
	// plugd options
	silly: "off",
	redundant: "off",
	compat: "off",
	conflict: "on",
	autoConflict: "off", 
	magicQuery: "on",
	superMagic: "off",
	
	// compile options
	version:"1.3.0-p",
	releaseName:"compiled",
	releaseDir:"../../../../public/javascripts/",
	copyTests:"false",
	internStrings:"true",
	cssOptimize:"comments",
	optimize:"shrinksafe.keepLines",
	layerOptimize:"shrinksafe.keepLines",
	stripConsole:"normal",
	query:"default",
	action:"clean,release",

	layers: [
		{
			name:"dojo.js",
			dependencies:[
				"plugd.base"
			]
		},
		{
			name:"../bandwith/requirements.js",
			dependencies:[
				"bandwith.requirements"
			]
		},
		{
			name:"../plugd/base.js",
			dependencies:[
				"plugd.base"
			]
		},
		{
			name: "../dijit/dijit.js",
			dependencies: [
				"dijit.dijit"
			]
		},
		{
			name: "../dijit/dijit-all.js",
			layerDependencies: [
				"../dijit/dijit.js"
			],
			dependencies: [
				"dijit.dijit-all"
			]
		},
		{
			name: "../dojox/off/offline.js",
			layerDependencies: [
			],
			dependencies: [
				"dojox.off.offline"
			]
		},
		{
			name: "../dojox/grid/DataGrid.js",
			dependencies: [
				"dojox.grid.DataGrid"
			]
		},
		{
			name: "../dojox/gfx.js",
			dependencies: [
				"dojox.gfx"
			]
		},
		{
			name: "../dojox/charting/widget/Chart2D.js",
			dependencies: [
				"dojox.charting.widget.Chart2D",
				"dojox.charting.widget.Sparkline",
				"dojox.charting.widget.Legend"
			]
		},
		{
			name: "../dojox/dtl.js",
			dependencies: [
				"dojox.dtl",
				"dojox.dtl.Context",
				"dojox.dtl.tag.logic",
				"dojox.dtl.tag.loop",
				"dojox.dtl.tag.date",
				"dojox.dtl.tag.loader",
				"dojox.dtl.tag.misc",
				"dojox.dtl.ext-dojo.NodeList"
			]
		}
	],

	prefixes: [
		[ "dijit", "../dijit" ],
		[ "dojox", "../dojox" ],
		[ "plugd", "../plugd" ],
		[ "bandwith", "../bandwith" ]
	]
};
