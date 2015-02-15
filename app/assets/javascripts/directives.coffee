angular.module('myApp.directives', [])
  .directive 'map', () ->
    restrict: 'E'
    templateUrl: "assets/map.html"
    link: ($scope, $el, $attrs) ->
      $el[0].addEventListener "mousemove", ((evt) ->
        $scope.show_teams(evt.target.getAttribute("svgtext"))
      )