'use strict'

parseDB = (data) ->
	lines = data.split "\n"
	database = []
	node = null

	for line in lines
		if line[0] is "\t"
			# This is a heading line.
			# After '\t' is the section number,
			# followed by the section title.

			# Get the section sequence, such as "2.1.3" ==> [2, 1, 3]
			section = line.slice 1, (line.indexOf(' ') - 1)
			sequence = section.split('.').map (s) -> parseInt(s)

			#console.log sequence

			# Traverse the tree and add a new node (or nodes)
			node = database

			for number in sequence
				if node[number]?	# If node exists,
					node = node[number]	# traverse down the tree
				else
					node[number] = []	# else create new node
					node = node[number]	# and go down that new node
					# store new node's title as first element of new array
					nodeName = line.slice line.indexOf(' ') + 1
					node[0] = [ nodeName ]	# a new array with 1 element

		else # this is an non-heading line (ie, data)
			node[0][node[0].length] = line;	# add item to end of array

	database # return

angular.module('conceptualInputApp')
	.controller 'MainCtrl', ($scope, $http) ->
		$scope.database = []

		$http
			method: 'GET'
			url: '/databases/synonym_forest_YKY_database.txt'
		.success (data, status, headers, config) ->
			$scope.database = parseDB data