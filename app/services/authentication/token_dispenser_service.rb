# frozen_string_literal: true

class Authentication::TokenDispenserService
  attr_accessor :access_code, :user, :user_data, :jwt_token

  class AutSCHError < StandardError; end
  class CantFindOrCreateUser < StandardError; end
  class CantGenerateToken < StandardError; end

  def initialize(access_code)
    @access_code = access_code
  end

  def self.call(access_code)
    new(access_code).perform
  end

  def perform
    begin
      get_user_data_form_authsch
    rescue StandardError
      raise AutSCHError
    end

    begin
      find_or_create_user
    rescue StandardError
      raise AutSCHError
    end

    begin
      generate_jwt_token
    rescue StandardError
      raise AutSCHError
    end

    jwt_token
  end

  private

  def get_user_data_form_authsch
    authsch_token = Authentication.client.auth_code.get_token(access_code)
    response      = Faraday.get("https://auth.sch.bme.hu/api/profile?access_token=#{authsch_token.token}")
    @user_data    = JSON.parse(response.body)
  end

  def find_or_create_user
    @user = User.find_by auth_sch_id: user_data['internal_id']
    @user ||= User.create!(user_parameters(user_data))
  end

  def generate_jwt_token
    payload    = {user_id: user.id}
    @jwt_token = JWT.encode payload, ENV['SECRET'], 'HS256'
  end

  def user_parameters(user_data)
  {"name":        user_data['displayName'],
   "email":       user_data['mail'],
   "auth_sch_id": user_data['internai_id']}
  end
end

