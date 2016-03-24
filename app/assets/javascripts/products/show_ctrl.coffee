controller = ($scope, $routeParams) ->
  if _.contains(["info", "comments", "slider"], $routeParams.activeTab)
    $scope.activeTab = $routeParams.activeTab
  else
    $scope.activeTab = "info"

  CRUD.show "products", $routeParams.id, (response) ->
    $scope.product = response.product
    $scope.$apply() unless $scope.$$phase

  $scope.updateProduct = (data) ->
    product = _.object(_.map(["name", "title", "description", "metatag_attributes"], (k) -> [k, data[k]]))
    CRUD.update "products", $scope.product.id, {product: product}, (response) ->
      App.Alert.show "success", I18n.t("js.products.successfully_updated")

angular.module "app.products"
  .controller "productsShowCtrl", [
    "$scope"
    "$routeParams"
    controller
  ]
