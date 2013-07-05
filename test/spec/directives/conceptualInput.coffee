'use strict'

describe 'Directive: conceptualInput', () ->
  beforeEach module 'conceptualInputApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<conceptual-input></conceptual-input>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the conceptualInput directive'
