'use strict'

describe 'Service: graphinfo', ->

  # load the service's module
  beforeEach module 'angulard31App'

  # instantiate service
  graphinfo = undefined
  beforeEach inject (_graphinfo_) ->
    graphinfo = _graphinfo_

  it 'should do something', ->
    expect(!!graphinfo).toBe true