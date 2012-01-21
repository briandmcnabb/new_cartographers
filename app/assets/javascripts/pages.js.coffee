jQuery ($)->
	
	# Toggle Form 
	$('a#inquiry, a#mailing_list_subscription').click(
		(event)->
			event.preventDefault()
			options = {}
			$('section#inquiry, section#mailing_list_signup').fadeToggle(800, 'easeInOutCubic')
	) 
	
	
	# Lettering.js
	$('div#cartographers, section#introduction p').lettering() if Modernizr.fontface