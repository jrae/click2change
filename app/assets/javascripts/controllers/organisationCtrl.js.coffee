@click2change.controller "organisationCtrl", [ "$scope", "Organisation", 'Email', '$routeParams', ($scope, Organisation, Email, $routeParams) ->
  "use strict"

  $scope.organisation = Organisation.get(
      'organisation_id': $routeParams.id
    )

  $scope.emails = Email.query(
    'organisation_id': $routeParams.id
    )

 ]