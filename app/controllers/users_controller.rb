class UsersController < ApplicationController
  def me
    render json: current_user.as_json(only: %i[name email]), status: :ok
  end
end
