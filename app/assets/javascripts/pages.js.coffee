jQuery ($)->
	
	# Toggle Form 
	$('a#inquiry, a#mailing_list_subscription').click(
		(event)->
			event.preventDefault()
			$('form.inquiry, form.mailing_list_subscription').toggle()
	) 
	
	
	# Lettering.js
	$('div#cartographers, section#introduction p').lettering()