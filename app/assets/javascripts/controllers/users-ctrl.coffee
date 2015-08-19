angular.module('OrderBuddyJs').controller 'UsersCtrl', ($scope, OrderBuddySrv, users, Rails) ->
  $scope.users = users.data