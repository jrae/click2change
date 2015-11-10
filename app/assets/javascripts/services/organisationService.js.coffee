angular.module("organisationService", [ "ngResource" ]).factory "Organisation", [ "$resource", ($resource) ->
  $resource "/api/organisations/:organisation_id.json", {
      organisation_id: '@organisation_id'
    },
    query:
      method: "GET"
      isArray: true

    get:
      method: "GET"
      isArray: false
 ]