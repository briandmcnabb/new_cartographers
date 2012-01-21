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
	
	
	# Flash Messages
	$('aside.flash_message a#close').click(
		(event)->
			event.preventDefault()
			$('aside.flash_message').fadeToggle(800, 'easeInOutCubic')
	)