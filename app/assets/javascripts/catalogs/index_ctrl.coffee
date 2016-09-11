catalogsIndexCtrl = ($scope, $rootScope, safeApply) ->
  $rootScope.waiting = true
  $scope._chunk = _.chunk
  CRUD.index "catalogs", {showall: true}, (response) ->
    $scope.catalogs = response.catalogs
    $rootScope.waiting = false
    safeApply($scope)

angular.module "app.catalogs"
  .controller "catalogsIndexCtrl", [
    "$scope"
    "$rootScope"
    "safeApply"
    catalogsIndexCtrl
  ]
