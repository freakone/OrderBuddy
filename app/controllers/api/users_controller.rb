class Api::UsersController < ApplicationController
before_action :authorize_api

def index
  render json: User.pluck(:name)
end

end