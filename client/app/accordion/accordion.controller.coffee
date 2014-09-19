'use strict'

angular.module 'angulard31App'
.controller 'AccordionCtrl', ($scope, graphinfo) ->
  $scope.hours=20
  $scope.oneAtATime = true
  $scope.groups = [
    {title: 'Parking',
    content:[
      {question:"Have Garage parking available",
      answer:false,
      value:0},
      {question:"Street Parking available",
      answer:false,
      value:10},
      {question:"Will be paying for parking",
      answer:false,
      value:40}
    ]},
    {title: 'Insurance',
    content:[
      {question:"Have insurance on another vehicle",
      answer:false,
      value:0.8},
      {question:"Have had vehicle insurance for the past 2 years",
      answer:false,
      value:0.8},
      {question:"Have not been in accident in the past 2 years",
      answer:false,
      value:0.9},
      {question:'I am younger than 25',
      answer:false,
      value:1.25}
    ]},
    {title: 'Car',
    content:[
      {question:'I get less than 25 mpg',
      answer:false,
      value:20},
      {question:'I get at least 25 mpg',
      answer:false,
      value:25},
      {question:'I get at least 40 mpg',
      answer:false,
      value:40}
    ]
    }
    ]
  $scope.$watch('hours',
    (first, second)->
      console.log(first)
      console.log(second))


  graphInfoUpdate= ->
    vars={}
    for group in $scope.groups
      do
        for question in group.content
          do
            if question.answer
              vars[group.title] = question.value
    vars.hours = $scope.hours
    console.log('hello!!')
    graphinfo.vars.info = vars
    graphinfo.update()
    return
  # $scope.$watch('hours',graphInfoUpdate())

  return
