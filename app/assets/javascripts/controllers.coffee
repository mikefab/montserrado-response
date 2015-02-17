angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'TeamService'
  'PeopleService'
  ($scope, $http, TeamService, PeopleService) ->

    $scope.get_teams = () ->
      TeamService.getList().then (teams) ->
        $scope.teams = teams
        console.log teams
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
                console.log team.epi_codes
                console.log zone.replace(/\s+$/, '')
                if _.contains((_.map team.tasks, _.iteratee("name")), task)  && _.contains(team.epi_codes, zone.replace(/\s+$/, ''))
                  $scope.active_teams.push team unless  _.contains($scope.active_teams, team)

              $scope.$apply()
              



    get_tasks = (teams) ->
      tasks = {}
      _.each teams, (team) ->
        _.each team.tasks, (task) ->
          tasks[task.name] = false

      return tasks


    $scope.get_teams()

]

