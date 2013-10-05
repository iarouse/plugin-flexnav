### Plugin info ###
;((jquery, window) ->
	'use strict'

	$.fn.flexnav = (options) ->

		return this.each( ->

			# settings
			settings = $.extend({
				breakpoint: 767 					# Integer: The responsive breakpoint (px) of flexnav
				animationSpeed: 250 				# Integer: The speed of slide animation, in milliseconds.
				backLabel: 'Back' 					# String: The text of go back item
				useActiveItemAsBackLabel: true 		# Boolean: true or false. If true, the 'Back' text will be replaced with active item name.
			}, options)

			# cache
			$nav       = $(@)
			$container = $nav.parent()
			$li        = $nav.find('li')
			$window    = $(window)
			timer      = undefined
			$button    = $('.fn-button')
			nav_open   = false

			_init = ->
				$li.each ->
					$this = $(@)
					if $this.has('ul').length
						$this.addClass('with-ul')
						$this.find('ul').addClass('sub-ul')

				$nav.find('.with-ul').append('<span class="navicon"></span>')

			_init()

			$nav.find('.sub-ul').prepend( '<li class="fn-back"><a href="#">' + settings.backLabel + '</a></li>' )
			$navicon = $('.flexnav .navicon')
			$back = $('.fn-back')

			if settings.useActiveItemAsBackLabel
				$back.each( ->
					$this = $(@)
					parentLabel = $this.parents('li.with-ul').first().children('a').text()

					$this.find('a').html(parentLabel)
				)

			# open nav
			$button.on('click', ->
				if nav_open
					$nav.stop(true, true).slideUp(settings.animationSpeed, ->
						_reset()
					)
					nav_open   = false
				else
					$nav.stop(true, true).slideDown(settings.animationSpeed)
					nav_open = true
			)

			# open sub-ul
			$navicon.on('click', (e) ->
				e.stopPropagation()

				$this = $(this)
				$item = $this.parent('li')
				$parent = $item.parents('.fn-subviewopen')

				$nav.addClass('fn-subview')
				$item.addClass('fn-subviewopen')
				$parent.removeClass('fn-subviewopen').addClass('fn-subview')
			)

			# go back
			$back.on('click', (e) ->
				e.preventDefault()

				$this = $(@)
				$ul = $this.parent('')
				$item = $ul.parent()

				$item.removeClass('fn-subviewopen')

				$subview = $this.parents('.fn-subview').first()
				if $subview.is('li')
					$subview.addClass('fn-subviewopen')
				$subview.removeClass('fn-subview')
			)

			_reset = ->
				$nav.removeClass( 'fn-subview' )
				$li.removeClass( 'fn-subview fn-subviewopen' )

			resize = ->
				winWidth = $window.width()

				if winWidth <= settings.breakpoint
					if $('.fn-lg').length
						_reset()
						$nav.hide()
						nav_open = false #
					
					$nav.removeClass('fn-lg').addClass('fn-sm')
					$container.removeClass('fn-container-lg').addClass('fn-container-sm')

				else
					_reset()
					$nav.removeClass('fn-sm').addClass('fn-lg').show()
					$container.removeClass('fn-container-sm').addClass('fn-container-lg')

			resize() # call resize once to set

			$window.resize ->
				clearTimeout(timer)
				timer = setTimeout(resize, 200)				
		)

)(jQuery, window)