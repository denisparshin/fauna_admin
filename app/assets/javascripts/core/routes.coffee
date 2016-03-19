angular.module "app.core"
  .config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when '/products',
        templateUrl: 'products/index.html',
        controller: 'productsIndexCtrl' 
      .when '/products/:id',
        templateUrl: 'products/show.html',
        controller: 'productsShowCtrl' 
      .when '/',
        templateUrl: 'pages/index.html',
        controller: false 
      .otherwise
        redirectTo: '/'
  ]
