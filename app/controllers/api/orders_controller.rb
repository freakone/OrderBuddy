class Api::OrdersController < ApplicationController
before_action :authorize_api

def index
  render json: Order.all
end

def users
  render json: User.all
end

end