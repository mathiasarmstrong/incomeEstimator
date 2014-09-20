'use strict'

angular.module 'angulard31App'
.controller 'AccordionCtrl', ($scope, graphinfo) ->
  $scope.time={}
  $scope.oneAtATime = true
  $scope.groups = graphinfo.questions
  $scope.showgraph=false
  $scope.time.hours = 20


  $scope.graphInfoUpdate=->
    vars={}
    for group in $scope.groups
      for question in group.content
        if question.answer
          vars[group.title] = question.value
    vars.hours = $scope.time.hours
    $scope.data = graphinfo.equation(vars)
    $scope.showgraph=true
    return

  $scope.options = graphinfo.options
  return
