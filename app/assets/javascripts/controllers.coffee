angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'TeamService'
  'PeopleService'
  ($scope, $http, TeamService, PeopleService) ->

    $scope.zones = {}

    $http.get('/api/zones').success((data, status, headers, config) ->
      _.each data.zones, (e) ->
        $scope.zones[(_.keys e)[0]] = (_.values e)[0]
    ).then () ->
      $scope.get_teams()

    $scope.get_teams = () ->
      TeamService.getList().then (teams) ->
        if teams.length > 0
          $scope.people_position = teams[0]['people_positions'] 
        $scope.teams = teams
        $scope.tasks = get_tasks teams


    $scope.reset_zone = () ->
      $scope.zone = null

    $scope.show_teams = (zone) ->
      if !!zone
        if zone != $scope.zone
          $scope.zone = zone
          $scope.active_teams = []
          _.each _.keys($scope.tasks), (task) ->
            if $scope.tasks[task] == true
              _.each $scope.teams, (team) ->
                if _.contains((_.map team.tasks, _.iteratee("name")), task)  && _.contains(team.epi_codes, zone)
                  $scope.active_teams.push team unless  _.contains($scope.active_teams, team)

              $scope.$apply()
              

    get_tasks = (teams) ->
      tasks = {}
      _.each teams, (team) ->
        _.each team.tasks, (task) ->
          tasks[task.name] = true

      return tasks


    

]

