jQuery ($)->
	$('a#inquiry, a#mailing_list_subscription').click(
		(event)->
			event.preventDefault()
			$('form.inquiry, form.mailing_list_subscription').toggle()
	) 