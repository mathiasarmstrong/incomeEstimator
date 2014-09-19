'use strict'



app = angular.module 'angulard31App', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ad3',
  'nvd3',
  'ui.bootstrap'
]
.config ($routeProvider, $locationProvider) ->
  $routeProvider
  .otherwise
    redirectTo: '/'

  $locationProvider.html5Mode true
