@click2change.controller "changeActionCtrl", [ "$scope", "ChangeAction", '$routeParams', '$sce', ($scope, ChangeAction, $routeParams, $sce) ->
  "use strict"

  $scope.change_action = ChangeAction.get(
      'change_action_id': $routeParams.id
    )

  $scope.renderHtml = (html_code)->
    return $sce.trustAsHtml(html_code);
 ]