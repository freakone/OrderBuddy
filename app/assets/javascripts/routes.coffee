angular.module('OrderBuddyJs').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/',
      views:
        "":
          templateUrl: '/assets/index.html'
          controller: 'OrdersCtrl'
          resolve:
            orders: (OrderBuddySrv) ->
              OrderBuddySrv.index()
        "users":
          controller: 'UsersCtrl'
          resolve:
            users: (OrderBuddySrv) ->
              OrderBuddySrv.users()
          templateUrl: '/assets/users.html'

    .state 'order',
      url: '/order/:id',
      controller: 'OrderCtrl'
      resolve:
        order: ($stateParams, OrderBuddySrv) ->
          OrderBuddySrv.order($stateParams.id)
      templateUrl: '/assets/order.html'

    .state 'history',
      url: '/history',
      controller: 'OrdersCtrl'
      resolve:
        orders: (OrderBuddySrv) ->
          OrderBuddySrv.history()
      templateUrl: '/assets/history.html'

    .state 'new',
      url: '/new',
      controller: 'NewCtrl'
      templateUrl: '/assets/new.html'

      
