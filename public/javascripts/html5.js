(function()
    {
        var e = [
            'abbr', 'article', 'aside', 'audio', 'bb', 'canvas', 'datagrid',
            'datalist', 'details', 'dialog', 'eventsource', 'figure',
            'footer', 'header', 'mark', 'menu', 'meter', 'nav', 'output',
            'progress', 'section', 'time' ,'video'
        ];
        var i = e.length;
        while (i--)
        {
            document.createElement(e[i]);
        }
    }
    )();
