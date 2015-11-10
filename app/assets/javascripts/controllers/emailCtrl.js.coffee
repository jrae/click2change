@click2change.controller "emailCtrl", [ "$scope", "Email", '$routeParams', ($scope, Email, $routeParams) ->
  "use strict"

  $scope.email = Email.get(
      'email_id': $routeParams.id
    )

 ]