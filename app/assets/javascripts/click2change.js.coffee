@click2change = angular.module('click2change', [
    'ngResource',
    'ngRoute',
    'changeActionService',
    'organisationService'
    ]);

@click2change.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/organisations', {
      templateUrl: 'assets/organisations/index.html',
      controller: 'organisationsCtrl'
    }).
    # when('/change_actions', {
    #   templateUrl: 'assets/change_actions/index.html',
    #   controller: 'changeActionsCtrl'
    # }).
    # when('/change_actions/:id', {
    #   templateUrl: 'assets/change_actions/show.html',
    #   controller: 'emailCtrl'
    # }).
    when('/organisations/:id', {
      templateUrl: 'assets/organisations/show.html',
      controller: 'organisationCtrl'
    }).
    otherwise({
      templateUrl: 'assets/home.html',
      controller: 'homeCtrl'
    })
])