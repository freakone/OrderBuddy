angular.module('OrderBuddyJs').controller 'OrdersCtrl', ($scope, OrderBuddySrv, orders, Rails) ->
  $scope.orders = orders.data
  interceptor = false

  $scope.$on '$stateChangeStart', (event) ->
    if interceptor
      event.preventDefault()
      interceptor = false

  $scope.delete = (item, idx) ->
    interceptor = true
    OrderBuddySrv.deleteOrder(item.id).success (response) ->
      $scope.orders.splice(idx, 1)