class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :require_login

  def require_login
    authenticate_token || render_unauthorized('Access denied')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  private

  def render_unauthorized(message)
    errors = { errors: { message: message } }
    render json: errors, status: :unauthorized
  end

  def authenticate_token
    user = User.find_by(token: cookies.signed[:auth_token])

    return unless user
    user.regenerate_token
    cookies.signed[:auth_token] = user.token
  end
end
