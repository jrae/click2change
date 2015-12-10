@click2change.controller "organisationCtrl", [ "$scope", "Organisation", 'ChangeAction', '$routeParams', ($scope, Organisation, ChangeAction, $routeParams) ->
  "use strict"

  $scope.organisation = Organisation.get(
      'organisation_id': $routeParams.id
    )

  $scope.change_actions = ChangeAction.query(
    'organisation_id': $routeParams.id
    )

 ]