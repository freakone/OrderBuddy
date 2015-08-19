class Api::UsersController < ApplicationController
before_action :authorize_api

def index
  render json: User.select([:name, :image, :id]).where('updated_at > ?', Time.now - 12.hours)
end

end