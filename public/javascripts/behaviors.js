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

dojo.behavior.add({
	'#create_twitter_account': {
		found: function(node) {
			var textbox = new dijit.form.TextBox({
				id: 'create_twitter_account'
			}, node);
			
			dojo.connect(textbox, 'onKeyDown', function(event){
				if (event.keyCode == dojo.keys.ENTER) {					
					var data = dojo.toJson({timeline: {screen_name: textbox.attr('value')}});

					dojo.xhrPost({
						handleAs: 'json',
						postData: data,
						headers: {
							'Content-Type': 'application/json',
							'Accept': 'application/json'
						},
						url: '/account/timelines.json',
						load: function(data){
							var html = ([
								'<p>',
								'Successfully added screen name: ',
								data.timeline.screen_name,
								'</p>'
							]).join('');
							var flash = dojo.byId('twitter_account_state');
							
							dojo.html.set(flash, html);
							dojo.attr(flash, 'class', 'message notice');
						},
						error: function(error){
							var errors = dojo.fromJson(error.responseText);
							var html = errors.map(function(error){return '<p>' + error + '</p>';}).join();
							var flash = dojo.byId('twitter_account_state');
							
							dojo.html.set(flash, html);
							dojo.attr(flash, 'class', 'message error');
						},
						handle: function() {
							dijit.byId('timelines').refresh();
						}
					});
				}
			});
		}
	},
	'#create_twitter_search_term': {
		found: function(node) {
			var textbox = new dijit.form.TextBox({
				id: 'create_twitter_search_term'
			}, node);
			
			dojo.connect(textbox, 'onKeyDown', function(event){
				if (event.keyCode == dojo.keys.ENTER) {					
					var data = dojo.toJson(); //TODO

					dojo.xhrPost({
						handleAs: 'json',
						postData: data,
						headers: {
							'Content-Type': 'application/json',
							'Accept': 'application/json'
						},
						url: '/account/search_terms.json',
						load: function(data){
							var html = ([
								'<p>',
								'Successfully added search term: ',
								data.search_term,
								'</p>'
							]).join('');
							var flash = dojo.byId('twitter_search_term_state');
							
							dojo.html.set(flash, html);
							dojo.attr(flash, 'class', 'message notice');
						},
						error: function(error){
							var errors = dojo.fromJson(error.responseText);
							var html = errors.map(function(error){return '<p>' + error + '</p>';}).join();
							var flash = dojo.byId('twitter_search_term_state');
							
							dojo.html.set(flash, html);
							dojo.attr(flash, 'class', 'message error');
						},
						handle: function() {
							dijit.byId('search_terms').refresh();
						}
					});
				}
			});
		}
	}
});
