dojo.behavior.add({
	'.iso_date_time': {
		found: function(node) {
			var date = dojo.date.stamp.fromISOString(node.innerHTML);
			var formatted = dojo.date.locale.format(date);
			
			dojo.html.set(node, formatted);
		}
	}
});

dojo.behavior.add({
	'[data-href]': {
		found: function(node) {
			var href = dojo.attr(node, 'data-href');
			var id = dojo.attr(node, 'id') || dojo.unique(dojo.byId);
			
			var pane = new dijit.layout.ContentPane({
				id: id,
				href: href
			});
			
			dojo.place(pane.domNode, node, 'replace');
			
			pane.startup();
		}
	}
});

dojo.behavior.add({
	'.navi': {
		found: function(node) {
			var navitems = dojo.query('li[data-container]', node);
			
			var container_ids = navitems.map(function(node){
				return dojo.attr(node, 'data-container');
			});
			
			var containers = dojo.query(container_ids.map(function(id){
				return '#' + id;
			}).join(', '));
			
			var hideAll = function(){
				containers.hide();
				navitems.removeClass('active');
			};
			
			var showNav = function(navitem){
				dojo.addClass(navitem, 'active');
				dojo.show(dojo.attr(navitem, 'data-container'));
			};
			
			navitems.forEach(function(navitem){
				dojo.query('a', navitem).onclick(function(){
					hideAll();
					showNav(navitem);
				});
			});
			
			hideAll();
			showNav(navitems[0]);
		}
	}
});
