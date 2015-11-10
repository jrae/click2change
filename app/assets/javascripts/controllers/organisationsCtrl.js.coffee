@click2change.controller "organisationsCtrl", [ "$scope", "Organisation", ($scope, Organisation) ->
  "use strict"

  $scope.organisations = Organisation.query()

 ]