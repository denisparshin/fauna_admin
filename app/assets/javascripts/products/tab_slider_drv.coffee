directive = ->
  restrict: "A"
  scope:
    productId: "="
  templateUrl: "products/_tab_slider.html"
  controller: ["$scope", ($scope) ->
  ]

angular.module "app.products"
  .directive "productTabSlider", [directive]

