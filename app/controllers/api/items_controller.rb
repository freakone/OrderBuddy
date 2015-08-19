class Api::ItemsController < ApplicationController
before_action :authorize_api

def create
  render json: Item.create({order: Order.find(params[:id]), name: params[:new_item], price: params[:new_price], user: current_user})
end

def destroy
  item = Item.find(params[:id])
  if item.user_id == current_user.id
    item.destroy!
    head 200
  else
    head 404
  end
end

end