controller = ($scope, $routeParams) ->
  CRUD.show "products", $routeParams.id, (response) ->
    $scope.product = response.product
    $scope.$apply() unless $scope.$$phase

angular.module "app.products"
  .controller "productsShowCtrl", [
    "$scope"
    "$routeParams"
    controller
  ]
