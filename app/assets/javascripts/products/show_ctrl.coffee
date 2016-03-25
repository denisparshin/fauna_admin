controller = ($scope, $routeParams) ->
  $scope.productId = $routeParams.id
  $scope.tabs = ["info", "sub_products", "slider", "comments"]
  $scope.activeTab = if _.contains($scope.tabs, $routeParams.activeTab) then $routeParams.activeTab else $scope.tabs[0]

angular.module "app.products"
  .controller "productsShowCtrl", [
    "$scope"
    "$routeParams"
    controller
  ]
