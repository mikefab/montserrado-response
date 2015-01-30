angular.module('myApp.controllers', [])
.controller 'myCtrl', [
  '$scope'
  '$http'
  'TeamService'
  ($scope, $http, TeamService) ->

    $scope.click = (e) ->
      $scope.zone = e['row']['EPI_CODE']['value']
      TeamService.getList(epi_code: e['row']['EPI_CODE']['value']).then (teams) ->
        $scope.teams = teams


    $scope.$on "mapInitialized", (event, map) ->
      ctaLayer = new google.maps.KmlLayer('http://gmaps-samples.googlecode.com/svn/trunk/ggeoxml/cta.kml')
      center   = new google.maps.LatLng(6.303824488304475, -10.75)
      map.setCenter center


]



        # TeamService.list().then((teams) ->
        #   $scope.teams = teams
        #   console.dir teams
        # )