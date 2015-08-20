angular.module('OrderBuddyJs').service 'OrderBuddySrv', ($http, Rails) ->
  base = "//#{Rails.host}/api/orders"
  base_items = "//#{Rails.host}/api/items"
  base_users = "//#{Rails.host}/api/users"
  base_api = "//#{Rails.host}/api"

  index: ->
    $http.get(base)

  users: ->
    $http.get(base_users)

  history: ->
    $http.get("#{base_api}/history")

  order: (id) ->
    $http.get("#{base}/#{id}")

  setOrdered: (id, state) ->
    $http.post("#{base}/#{id}/ordered", {state: state})

  setDelivered: (id, state) ->
    $http.post("#{base}/#{id}/delivered", {state: state})

  addItem: (id, new_item, new_price) ->
    $http.post("#{base_items}", {id: id, new_item: new_item, new_price: new_price})

  deleteItem: (id) ->
    $http.delete("#{base_items}/#{id}/")

  deleteOrder: (id) ->
    $http.delete("#{base}/#{id}/")
    
  addOrder: (name, phone) ->
     $http.post(base, {name: name, phone: phone})