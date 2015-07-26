angular.module('OrderBuddyJs').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'index',
      url: '/',
      controller: 'OrdersCtrl'
      templateUrl: '/assets/index.html'
