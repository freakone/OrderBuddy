class Api::OrdersController < ApplicationController
before_action :authorize_api

def index
  render json: Order.all
end

def users
  render json: User.all
end

def show
  render json: Order.find(params[:id]), :include => {:items => { :include => { :user => {only: :name}}}}
end

end