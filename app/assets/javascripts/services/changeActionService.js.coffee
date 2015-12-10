angular.module("changeActionService", [ "ngResource" ]).factory "ChangeAction", [ "$resource", ($resource) ->
  $resource "/api/change_actions/:change_action_id.json", {
      change_action_id: '@change_action_id'
    },
    query:
      method: "GET"
      isArray: true
    get:
      method: "GET"
      isArray: false
 ]