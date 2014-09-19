'use strict'

angular.module 'angulard31App'
.factory 'graphinfo', ->

  vars=
    defaultInsuranceRate: 27
    defaultGasPrice: 4.50
    defaultMilesPerHourDriving:8
    defaultLeaseCost:100
    avgIncomePerHour: 27
  vars.info=
    Parking: 40
    Insurance:1
    Car:20
    hours:20

  #Random Data Generator

  costEarnings = ->
    cost = []
    earnings = []

    #Data is represented as an array of {x,y} pairs.
    i = 0

    while i < 52
      cost.push
        x: i
        y: (vars.defaultInsuranceRate*vars.info.Insurance + vars.info.Parking + vars.defaultLeaseCost + ((vars.info.hours*vars.defaultMilesPerHourDriving)/vars.info.Car)*vars.defaultGasPrice)*i

      earnings.push
        x: i
        y: (vars.avgIncomePerHour*20)*i

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
  # Service logic
  # weekly info
  # averageInsurance = 28
  # averageGas =

  # Public API here


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
      dispatch:
        stateChange: (e) ->
          console.log "stateChange"
          return

        changeState: (e) ->
          console.log "changeState"
          return

        tooltipShow: (e) ->
          console.log "tooltipShow"
          return

        tooltipHide: (e) ->
          console.log "tooltipHide"
          return

      xAxis:
        axisLabel: "Time(weeks)"

      yAxis:
        axisLabel: "Income(dollars)"
        tickFormat: (d) ->
          d3.format("$100") d

        axisLabelDistance: 30

      callback: (chart) ->
        console.log "!!! lineChart callback !!!"
        return

    title:
      enable: false
      text: "none"

    subtitle:
      enable: false
      text: "Subtitle for simple line chart."
      css:
        "text-align": "center"
        margin: "10px 13px 0px 7px"

    caption:
      enable: false
      html: "<b>Figure 1.</b>"
      css:
        "text-align": "justify"
        margin: "10px 13px 0px 7px"

  data = costEarnings()

  options:options
  data:data
  update:->
    data:costEarnings()
    return


