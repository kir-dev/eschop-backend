class ApplicationController < ActionController::API
  include ActionController::Helpers

  class NoTokenProvided < StandardError; end
  class CouldNotFindUser < StandardError; end

  before_action :require_login
  skip_before_action :require_login, only: :callback
  helper_method :current_user

  def require_login
    # jwt_token = params[:jwt_token]
    jwt_token = request.env['HTTP_AUTHORIZATION']&.split&.at(1)
    raise NoTokenProvided if jwt_token.blank?

    @user = Authentication::AuthenticateUser.call(jwt_token)
    raise CouldNotFindUser if @user.blank?

  rescue NoTokenProvided, CouldNotFindUser
    head(:unauthorized)
    # redirect_to Authentication.client.auth_code.authorize_url
  end

  def current_user
    @user
  end

  def callback
    jwt_token = Authentication::TokenDispenserService.call(params[:code])
    render plain: jwt_token
 end
end
