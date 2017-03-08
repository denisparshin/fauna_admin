paymentMethodsIndexCtrl = ($scope, $rootScope, safeApply) ->
  $params = App.Params.get()
  $rootScope.waiting = true
  $scope._chunk = _.chunk
  CRUD.index "payment_methods", {showall: true}, (response) ->
    $scope.payment_methods = response.payment_methods
    $rootScope.waiting = false
    safeApply($scope)


angular.module "app.payment_methods"
  .controller "paymentMethodsIndexCtrl", [
    "$scope"
    "$rootScope"
    "safeApply"
    paymentMethodsIndexCtrl
  ]