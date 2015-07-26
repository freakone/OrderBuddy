angular.module('OrderBuddyJs').service 'OrderBuddySrv', ($http, Rails) ->
  base = "//#{Rails.host}/api/orders"

  index: ->
    $http.get(base)

  order: (id) ->
    $http.get("#{base}/#{id}")
 