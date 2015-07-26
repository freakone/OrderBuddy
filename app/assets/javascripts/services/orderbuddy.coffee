angular.module('OrderBuddyJs').service 'OrderBuddySrv', ($http, Rails) ->
  base = "//#{Rails.host}/api/orders"

  index: ->
    $http.get(base)
  show: (id) ->
    $http.get("#{base}/#{id}")
