angular.module('OrderBuddyJs').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/',
      controller: 'OrdersCtrl'
      resolve:
        orders: (OrderBuddySrv) ->
          OrderBuddySrv.index()
      templateUrl: '/assets/index.html'

    .state 'order',
      url: '/order/:id',
      controller: 'OrderCtrl'
      resolve:
        order: ($stateParams, OrderBuddySrv) ->
          OrderBuddySrv.order($stateParams.id)
      templateUrl: '/assets/order.html'

      
