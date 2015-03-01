angular.module('myApp.services', [])

  # .factory "TeamService", (Restangular) ->
  #   Restangular.service "teams"


  .factory "TeamService", [
    "Restangular"
    (Restangular) ->
      Restangular.service "teams"
  ]

  .factory "PeopleService", [
    "Restangular"
    (Restangular) ->
      Restangular.service "people"
  ]

  .factory "CommunityService", [
    "Restangular"
    (Restangular) ->
      Restangular.service "communities"
  ]

  .factory "ZoneService", [
    "Restangular"
    (Restangular) ->
      Restangular.service "zones"
  ]




  # .factory('TeamService', [
  #   'Restangular', 'Team',
  #   (Restangular, Team)->

  #     model = 'teams'

  #     Restangular.extendModel(model, (obj)->
  #       angular.extend(obj, Team)
  #     )

  #     list: ()     -> Restangular.all(model).getList()
  # ])