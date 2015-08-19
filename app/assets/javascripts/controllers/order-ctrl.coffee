angular.module('OrderBuddyJs').controller 'OrderCtrl', ($scope, OrderBuddySrv, order, Rails) ->
  $scope.order = order.data

  $scope.setOrdered = (order, state) ->
    OrderBuddySrv.setOrdered(order.id, state).success (order) ->
      $scope.order = order

  $scope.setDelivered = (order, state) ->
    OrderBuddySrv.setDelivered(order.id, state).success (order) ->
      $scope.order = order

  $scope.add = (item, price) ->
    OrderBuddySrv.addItem($scope.order.id, item, price).success (response) ->
      $scope.order.items.push(response)
      $scope.order.can_add_item = false

  $scope.delete = (item, idx) ->
    OrderBuddySrv.deleteItem(item.id).success (response) ->
      $scope.order.items.splice(idx, 1);
      $scope.order.can_add_item = true