sidebarDrv = ->
  replace: true
  scope: false
  templateUrl: "shared/sidebar.html"
  controller: ["$scope", ($scope) ->
    $scope.sideMenu = [
      ['/#/orders', 'orders', I18n.t("js.orders.title")],
      ['/#/catalogs', 'catalogs', I18n.t("js.categories.title")],
      ['/#/products', 'products', I18n.t("js.products.title")],
      ['/#/import', 'import', I18n.t("js.import.title")],
      ['/#/top_slider', 'top_slider', I18n.t("js.top_slider.title")],
    ]
  ]

angular.module "app.shared"
  .directive "sidebar", [sidebarDrv]
