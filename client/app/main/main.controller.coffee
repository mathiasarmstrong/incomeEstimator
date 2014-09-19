'use strict'

angular.module 'angulard31App'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.awesomeThings = []
  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings


