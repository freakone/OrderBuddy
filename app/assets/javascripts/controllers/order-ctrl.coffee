angular.module('OrderBuddyJs').controller 'OrderCtrl', ($scope, OrderBuddySrv, order, Rails) ->
  $scope.order = order.data
  $scope.new_item = null
  $scope.new_price = null

  $scope.setOrdered = (order, state) ->
    OrderBuddySrv.setOrdered(order.id, state).success (order) ->
      $scope.order = order

  $scope.setDelivered = (order, state) ->
    OrderBuddySrv.setDelivered(order.id, state).success (order) ->
      $scope.order = order

  $scope.add = ->
    OrderBuddySrv.add($scope.order.id, $scope.new_item, $scope.new_price).success (response) ->
      $scope.new_item = null
      $scope.new_price = null
      $scope.order.items.push(response)