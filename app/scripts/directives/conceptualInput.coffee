'use strict';

angular.module('conceptualInputApp')
	.directive('conceptualInput', () ->
		priority: 0
		template: '<textarea rows="{{rows}}" type="text" class="conceptual-input" placeholder="Type something..."></textarea>'
		restrict: 'E'
		scope:
			rows: '@'
			db: '='
		link: (scope, element, attrs) ->

			$('.conceptual-input', element).areacomplete
				wordCount:1
				mode: "outter"
				on:
					query: (text, cb) ->
						words = []
						matches = db[text]

						for i in [0...matches.length]
							words.push(matches[i])

						cb words
	)