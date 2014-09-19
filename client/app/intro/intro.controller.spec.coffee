'use strict'

describe 'Controller: IntroCtrl', ->

  # load the controller's module
  beforeEach module 'angulard31App'
  IntroCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IntroCtrl = $controller 'IntroCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
