@click2change.controller "emailCtrl", [ "$scope", "Email", '$routeParams', ($scope, Email, $routeParams) ->
  "use strict"
    # Add the following lines
  $scope.email = Email.get(
      'email_id': $routeParams.id
    )

 ]