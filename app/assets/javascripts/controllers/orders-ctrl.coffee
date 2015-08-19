angular.module('OrderBuddyJs').controller 'OrdersCtrl', ($scope, OrderBuddySrv, orders, Rails) ->
  $scope.orders = orders.data