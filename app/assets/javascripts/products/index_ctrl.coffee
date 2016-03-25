controller = ($scope, $routeParams) ->

  $routeParams.page = 1 unless $routeParams.page

  CRUD.index "products", $routeParams, (response) ->
    $scope.products = response.products
    $scope.page = response.page
    $scope.per = response.per
    $scope.count = response.count
    $scope.$apply() unless $scope.$$phase

angular.module "app.products"
  .controller "productsIndexCtrl", [
    "$scope"
    "$routeParams"
    controller
  ]
