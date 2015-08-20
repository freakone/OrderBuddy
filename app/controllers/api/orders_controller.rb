class Api::OrdersController < ApplicationController
before_action :authorize_api
require 'json'

def index
  
  hash = []

  Order.where(delivered: [false, nil]).find_each do |order|
    hash.push(order.get_json(current_user))
  end
  
  render json: hash
end

def destroy
  order = Order.find(params[:id])
  if order.user_id == current_user.id
    order.destroy!
    head 200
  else
    head 404
  end
end

def create
  render json: Order.create({restauration: params[:name], phone: params[:phone], user: current_user})
end

def history
  render json: Order.where(delivered: true)
end

def show
  render json: Order.find(params[:id]).get_json(current_user)
end

def ordered
  render json: Order.update(params[:id], ordered: params[:state]).get_json(current_user)
end

def delivered
  render json: Order.update(params[:id], delivered: params[:state]).get_json(current_user)
end

end