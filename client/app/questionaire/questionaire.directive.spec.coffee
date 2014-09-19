'use strict'

describe 'Directive: questionaire', ->

  # load the directive's module
  beforeEach module 'angulard31App'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<questionaire></questionaire>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the questionaire directive'
