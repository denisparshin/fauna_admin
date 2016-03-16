angular.module "app.core"
  .config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'pages/index.html',
        controller: false 
      .otherwise
        redirectTo: '/'
  ]
