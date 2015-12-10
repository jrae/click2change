@click2change.controller "changeActionCtrl", [ "$scope", "ChangeAction", '$routeParams', ($scope, ChangeAction, $routeParams) ->
  "use strict"

  $scope.change_action = ChangeAction.get(
      'change_action_id': $routeParams.id
    )

 ]