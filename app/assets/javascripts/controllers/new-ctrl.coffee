angular.module('OrderBuddyJs').controller 'NewCtrl', ($scope, $location, OrderBuddySrv, Rails) ->

 $scope.add = (name, phone) ->
    OrderBuddySrv.addOrder(name, phone).success (response) ->
      $location.path("orders")