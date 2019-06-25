class SessionsController < ApplicationController
  # include ::ActionController::Cookies
  skip_before_action :require_login, only: :create
  def create
    user = User.valid_login?(params[:email], params[:password])
    if user
      user.regenerate_token
      session["user_id"] = user.id
      render json: { token: user.token }
    else
      render_unauthorized('Incorrect email or password')
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end