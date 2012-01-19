jQuery ($)->
	
	# Toggle Form 
	$('a#inquiry, a#mailing_list_subscription').click(
		(event)->
			event.preventDefault()
			$('section#inquiry, section#mailing_list_signup').toggle()
	) 
	
	
	# Lettering.js
	$('div#cartographers, section#introduction p').lettering() if Modernizr.fontface && Modernizr.textshadow