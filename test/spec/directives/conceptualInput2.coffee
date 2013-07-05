'use strict'

describe 'Directive: conceptualInput2', () ->
  beforeEach module 'conceptualInputApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<conceptual-input2></conceptual-input2>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the conceptualInput2 directive'
