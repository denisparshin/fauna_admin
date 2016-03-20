controller = ($scope, $routeParams) ->

  $routeParams.page = 1 unless $routeParams.page

  CRUD.index "products", $routeParams, (response) ->
    $scope.products = response.products
    $scope.page = response.page
    $scope.per = response.per
    $scope.count = response.count
    $scope.$apply() unless $scope.$$phase

  $scope.removeProduct = (id, index) ->
    CRUD.remove "products", id, (response) ->
      if response.id
        $scope.products.splice(index, 1)
        $scope.count--
        $scope.$apply() unless $scope.$$phase
        App.Alert.show "info", I18n.t("js.product.successfully_removed")
      else 
        App.Alert.show "danger", response.error || I18n.t("js.info.something_went_wrong") 

angular.module "app.products"
  .controller "productsIndexCtrl", [
    "$scope"
    "$routeParams"
    controller
  ]
