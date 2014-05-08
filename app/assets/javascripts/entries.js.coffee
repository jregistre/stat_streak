jQuery ->
	Morris.Line
		element: 'weight_chart'
		data: $('#weight_chart').data('entries')
		xkey: 'created_at'
		ykeys: ['weight']
		labels: ['Weight']