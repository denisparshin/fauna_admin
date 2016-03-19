paginationDirective = ->
  restrict: "E"
  replace: true
  scope:
    perPage: "="
    itemsCount: "="
    page: "="
  templateUrl: "shared/pagination.html"
  controller: ["$scope", "$location", ($scope, $location) ->
    calculatePages = ->
      buf = []
      o = 0
      start = $scope.page - 3
      while o < 7
        if start >= 1
          buf.push start
          o++ 
        start++
        break if start >= $scope.pagesAmount
      buf

    updatePager = ->
      $scope.params = _.map(_.without(_.keys($location.search()), "page"), (e) -> "#{e}=#{$location.search()[e]}").join("&")
      $scope.path = $location.path()
      $scope.pagesAmount = Math.ceil $scope.itemsCount / $scope.perPage
      $scope.viewPages = calculatePages()


    $scope.page = 1 unless $scope.page
    $scope.$watch "itemsCount", -> updatePager()
    $scope.$watch "page", -> updatePager()


  ]
angular.module "app.shared"
  .directive "pagination", [paginationDirective]
