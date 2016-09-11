catalogsShowCtrl = ($scope, $rootScope, $routeParams, safeApply) ->
  $rootScope.waiting = true
  resource = if $routeParams.categoryId then {n: "category", p: "categories", id: $routeParams.categoryId} else {n: "catalog", p: "catalogs", id: $routeParams.id}

  CRUD.show resource.p, resource.id, (response) ->
    $scope.catalog = response[resource.n]
    $rootScope.waiting = false
    safeApply($scope)

  $scope.updateCatalog = ->
    CRUD.update resource.p, resource.id, _.object([[resource.n, _.getByKeys($scope.catalog, ["name", "slug", "description"])]]), (response) ->
      App.Alert.show "info", I18n.t("js.catalogs.is_updated")
      $scope.catalogForm.$setPristine()
      safeApply($scope)

angular.module "app.catalogs"
  .controller "catalogsShowCtrl", [
    "$scope"
    "$rootScope"
    "$routeParams"
    "safeApply"
    catalogsShowCtrl
  ]
