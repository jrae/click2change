@click2change = angular.module('click2change', [
    'ngResource',
    'ngRoute',
    'emailService',
    'organisationService'
    ]);

@click2change.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/organisations', {
      templateUrl: 'assets/organisations/index.html',
      controller: 'organisationsCtrl'
    }).
    when('/emails', {
      templateUrl: 'assets/emails/index.html',
      controller: 'emailsCtrl'
    }).
    when('/emails/:id', {
      templateUrl: 'assets/emails/show.html',
      controller: 'emailCtrl'
    }).
    when('/organisations/:id', {
      templateUrl: 'assets/organisations/show.html',
      controller: 'organisationCtrl'
    }).
    otherwise({
      templateUrl: 'assets/home.html',
      controller: 'homeCtrl'
    })
])