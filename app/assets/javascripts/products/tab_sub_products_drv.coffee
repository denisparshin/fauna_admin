directive = ->
  restrict: "A"
  scope:
    productId: "="
  templateUrl: "products/_tab_sub_products.html"
  controller: ["$scope", ($scope) ->
  ]

angular.module "app.products"
  .directive "productTabSubProducts", [directive]
