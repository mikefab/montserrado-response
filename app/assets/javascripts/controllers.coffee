angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'TeamService'
  'PeopleService'
  ($scope, $http, TeamService, PeopleService) ->

    $scope.click = (e) ->
      $scope.zone = e['row']['EPI_CODE']['value']
      TeamService.getList(epi_code: e['row']['EPI_CODE']['value']).then (teams) ->
        $scope.teams  = teams
        $scope.active = teams[0].name
        $scope.get_people(teams[0].name)

    $scope.get_people = (team) ->
      PeopleService.getList(team: team).then (people) ->
        $scope.active = team
        $scope.people = people



    $scope.$on "mapInitialized", (event, map) ->
      ctaLayer = new google.maps.KmlLayer('http://gmaps-samples.googlecode.com/svn/trunk/ggeoxml/cta.kml')
      center   = new google.maps.LatLng(6.303824488304475, -10.75)
      map.setCenter center


]

