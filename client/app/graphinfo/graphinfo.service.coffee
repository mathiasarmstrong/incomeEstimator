'use strict'

angular.module 'angulard31App'
.factory 'graphinfo', ->

  #Equation simple for now, can be made more complex as we go

  costEarnings =(info)->
    cost = []
    earnings = []
    info ?= {}
    info.Parking ?= 40
    info.Insurance ?= 1
    info.Car ?= 20
    info.hours ?= 20
    vars=
      defaultInsuranceRate: 27
      defaultGasPrice: 4.50
      defaultMilesPerHourDriving:8
      defaultLeaseCost:100
      avgIncomePerHour: 27

    #Data is represented as an array of {x,y} pairs.
    i = 0

    while i < 52
      cost.push
        x: i
        y: (vars.defaultInsuranceRate*info.Insurance + info.Parking + vars.defaultLeaseCost + ((info.hours*vars.defaultMilesPerHourDriving)/info.Car)*vars.defaultGasPrice)*i

      earnings.push
        x: i
        y: (vars.avgIncomePerHour*info.hours)*i

      i++

    #Line chart data should be sent as an array of series objects.
    [
      {
        values: earnings
        key: "Potential Earnings"
        color: "#2ca02c"
        area: true
      }
      {
        values: cost #values - represents the array of {x,y} data points
        key: "Cost of vehicle" #key  - the name of the series.
        color: "#ff7f0e" #color - optional: choose your own line color.
        area: true
      }
    ]

  # Setting options and questions, may be changed out for a database call
  options =
    chart:
      type: "lineChart"
      height: 450
      margin:
        top: 20
        right: 20
        bottom: 40
        left: 55

      x: (d) ->
        d.x

      y: (d) ->
        d.y

      useInteractiveGuideline: true

      xAxis:
        axisLabel: "Time(weeks)"

      yAxis:
        axisLabel: "Earnings($)"
        tickFormat: (d) ->
          d3.format("$100") d

        axisLabelDistance: 30



  questions=[
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
  # Public API here

  equation: costEarnings
  options: options
  questions:questions
