angular.module("emailService", [ "ngResource" ]).factory "Email", [ "$resource", ($resource) ->
  $resource "/api/emails/:email_id.json", {
      email_id: '@email_id'
    },
    query:
      method: "GET"
      isArray: true
    get:
      method: "GET"
      isArray: false
 ]