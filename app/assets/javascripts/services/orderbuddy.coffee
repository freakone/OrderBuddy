angular.module('OrderBuddyJs').service 'OrderBuddySrv', ($http, Rails) ->
  base = "//#{Rails.host}/api/orders"

  index: ->
    $http.get(base)

  order: (id) ->
    $http.get("#{base}/#{id}")

  setOrdered: (id, state) ->
    $http.post("#{base}/#{id}/ordered", state: state)

  setDelivered: (id, state) ->
    $http.post("#{base}/#{id}/delivered", state: state)

  add: (id, new_item, new_price) ->
    $http.post("#{base}/#{id}/new_item", {new_item: new_item, new_price: new_price})
