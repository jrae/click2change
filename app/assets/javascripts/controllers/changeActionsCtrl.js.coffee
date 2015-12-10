@click2change.controller "changeActionsCtrl", [ "$scope", "ChangeAction", ($scope, ChangeAction) ->
  "use strict"

  $scope.change_actions = ChangeAction.query()

 ]