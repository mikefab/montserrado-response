angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'TeamService'
  'PeopleService'
  ($scope, $http, TeamService, PeopleService) ->
    # $scope.click = (e) ->
    #   $scope.zone = e['row']['EPI_CODE']['value']
    #   TeamService.getList(epi_code: e['row']['EPI_CODE']['value']).then (teams) ->
    #     $scope.teams  = teams
    #     $scope.active = teams[0].name
    #     $scope.get_people(teams[0].name)

    # $scope.get_people = (team) ->
    #   PeopleService.getList(team: team).then (people) ->
    #     $scope.active = team
    #     $scope.people = people

    $scope.get_teams = () ->
      TeamService.getList().then (teams) ->
        $scope.teams = teams
        $scope.tasks = get_tasks teams

 
    $scope.show_teams = (zone) ->
      if !!zone
        $scope.zone = zone
        $scope.active_teams = []
        _.each _.keys($scope.tasks), (task) ->
          if $scope.tasks[task] == true
            _.each $scope.teams, (team) ->
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

