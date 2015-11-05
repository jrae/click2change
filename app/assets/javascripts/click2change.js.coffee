@click2change = angular.module('click2change', [
    'ngAnimate',
    'ngResource',
    'ngRoute',
    # 'ngSanitize',
    # 'ngTouch',
    'emailService'
    ]);

@click2change.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/emails', {
      templateUrl: 'assets/emails/index.html',
      controller: 'emailsCtrl'
    }).
    when('/emails/:id', {
      templateUrl: 'assets/emails/show.html',
      controller: 'emailCtrl'
    }).
    otherwise({
      templateUrl: 'assets/home.html',
      controller: 'homeCtrl'
    })
])