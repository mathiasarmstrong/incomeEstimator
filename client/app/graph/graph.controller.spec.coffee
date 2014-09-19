'use strict'

describe 'Controller: GraphCtrl', ->

  # load the controller's module
  beforeEach module 'angulard31App'
  GraphCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GraphCtrl = $controller 'GraphCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
