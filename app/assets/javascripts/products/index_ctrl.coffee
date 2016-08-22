controller = ($scope, $routeParams, $location, safeApply) ->

  $scope.search = if $routeParams.search then $routeParams.search else {}

  loaded = false

  $params = App.Params.get()
  $params.page = 1 if !$params.page
  $scope.search = $params.search if $params.search

  getData = (bind) ->
    params = $params
    params.search = $scope.search if $scope.search && !_.isEmpty($scope.search)
    CRUD.index "products", params, (response) ->
      $scope.products = response.products
      $scope.page = response.page
      $scope.per = response.per
      $scope.count = response.count
      safeApply($scope)
      if !$scope.catalogs
        CRUD.index "catalogs", {showall: true}, (response) ->
          $scope.catalogs = response.catalogs
          $scope.categories = _.flatten _.map(response.catalogs, (c) ->
            _.map c.categories, (c1) ->
              $.extend { catalog_id: c.id }, c1
          )
          safeApply($scope)

  $scope.submitSearch = ->
    params = {}
    params.page = $params.page if $params.page
    _.each _.keys($scope.search), (k) -> params["search[#{k}]"] = $scope.search[k] if $scope.search[k]
    $location.search(params)
    safeApply($scope)

  $scope.getCategories = ->
    _.compact(_.map $scope.categories, (c) -> if !$scope.search.catalog_id || $scope.search.catalog_id == c.catalog_id then c else null)


  getData()

angular.module "app.products"
  .controller "productsIndexCtrl", [
    "$scope"
    "$routeParams"
    "$location"
    "safeApply"
    controller
  ]
