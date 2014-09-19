'use strict'

angular.module 'angulard31App'
.directive 'questionaire', ->
  template: '<div>{{data}}</div>'
  restrict: 'EA'
  link: (scope, element, attrs) ->
    # element.text 'this is the questionaire directive'
    scope.questions = "this?"
