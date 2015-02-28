angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'CommunityService'
  'TeamService'
  'ZoneService'

  ($scope, $http, CommunityService, TeamService, ZoneService) ->

    $scope.zone_names = {}
    $scope.zone_ids   = {}
    $http.get('/api/zones').success((data, status, headers, config) ->
      _.each data, (e) ->
        $scope.zone_names[e['epi_code']] = e['cnam']
        $scope.zone_ids[e['id']]         = e['cnam']
    ).then () ->
      $scope.get_teams()

    $scope.get_communities = () ->
      h = {}
      CommunityService.getList().then (communities) ->
        _.each communities, (c) ->
          unless h[c['zone_code']]
            h[c['zone_code']] = []
            h[c['zone_code']].push c['name']
          else
            h[c['zone_code']].push c['name']
        $scope.communities = h
    $scope.get_teams = () ->
      $scope.people_position = {}
      TeamService.getList().then (teams) ->
        if teams.length > 0
          _.each teams, (t) ->
            _.each t['people_positions'], (v, k) ->
              $scope.people_position[k] = v

        $scope.teams = teams
        $scope.tasks = get_tasks teams
        $scope.get_communities()


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

