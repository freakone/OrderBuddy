class Api::OrdersController < ApplicationController
before_action :authorize_api

def index
  render json: Order.all, :include => {:items => {only: :id}}
end

def users
  render json: User.all
end

def show
  render json: Order.find(params[:id])
end

def ordered
  o = Order.find(params[:id])
  o.ordered = params[:state]
  o.save!

  render json: o
end

def delivered
  o = Order.find(params[:id])
  o.delivered = params[:state]
  o.save!

  render json: o
end

def new_item
  o = Order.find(params[:id])
  i = Item.new()
  i.order = o
  i.name = params[:new_item]
  i.price = params[:new_price]
  i.user = current_user
  i.save!

  render json: i
end

end