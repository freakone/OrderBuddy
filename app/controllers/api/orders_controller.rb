class Api::OrdersController < ApplicationController
before_action :authorize_api

def index
  render json: Order.all, :include => {:items => {only: :id}}
end

def users
  render json: User.all
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

def new_item
  render json: Item.create({order: Order.find(params[:id]), name: params[:new_item], price: params[:new_price], user: current_user})
end

end