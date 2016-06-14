angular.module "app.core"
  .config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when '/sign_up',
        templateUrl: 'auth/sign_up.html',
        controller: 'registrationCtrl'
      .when '/sign_in',
        templateUrl: 'auth/sign_in.html',
        controller: 'sessionsCtrl'
      .when '/import',
        templateUrl: 'import/show.html',
        controller: 'importCtrl'
      .when '/products',
        templateUrl: 'products/index.html',
        controller: 'productsIndexCtrl'
      .when '/products/:id',
        templateUrl: 'products/show.html',
        controller: 'productsShowCtrl'
      .when '/products/:id/:activeTab',
        templateUrl: 'products/show.html',
        controller: 'productsShowCtrl'
      .when '/orders',
        templateUrl: 'orders/index.html',
        controller: 'ordersIndexCtrl',
      .when '/top_slider',
        templateUrl: 'top_slider/index.html',
        controller: 'topSliderIndexCtrl',
      .when '/',
        templateUrl: 'orders/index.html',
        controller: 'ordersIndexCtrl'
      .otherwise
        redirectTo: '/'
  ]
