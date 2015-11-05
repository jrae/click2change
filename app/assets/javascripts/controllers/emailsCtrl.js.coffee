@click2change.controller "emailsCtrl", [ "$scope", "Email", ($scope, Email) ->
  "use strict"

  $scope.emails = Email.query()

 ]