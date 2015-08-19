class Api::OrdersController < ApplicationController
before_action :authorize_api

def index
  render json: Order.where(delivered: [false, nil])
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