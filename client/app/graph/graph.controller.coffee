'use strict'

angular.module 'angulard31App'
.controller 'GraphCtrl', ($scope, graphinfo) ->
  $scope.showgraph=false
  $scope.updategraph = ->
    $scope.showgraph=true
    $scope.options = graphinfo.options
    $scope.data = graphinfo.data
    return
  return

