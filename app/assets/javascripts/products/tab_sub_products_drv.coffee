directive = ->
  restrict: "A"
  scope:
    productId: "="
  templateUrl: "products/_tab_sub_products.html"
  controller: ["$scope", ($scope) ->
    CRUD.index "sub_products", {showall: true, search: {product_ids: [$scope.productId]}}, (response) ->
      $scope.sub_products = response.sub_products
      $scope.$apply() unless $scope.$$phase
  ]

angular.module "app.products"
  .directive "productTabSubProducts", [directive]
