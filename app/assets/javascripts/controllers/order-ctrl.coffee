angular.module('OrderBuddyJs').controller 'OrderCtrl', ($scope, OrderBuddySrv, order, Rails) ->
  $scope.order = order.data