# frozen_string_literal: true

class AuthenticationController < ApplicationController
  require 'oauth2'

  def login
    if params[:user_id] && user = User.find(params[:user_id])
      render plain: user.name
    else
      redirect_to client.auth_code.authorize_url
    end
  end

  def callback
    token     = client.auth_code.get_token(params[:code], redirect_uri: 'http://localhost:8080/oauth2/callback')
    response  = Faraday.get("https://auth.sch.bme.hu/api/profile?access_token=#{token.token}")
    user_data = JSON.parse(response.body)
    user      = User.find_by auth_sch_id: user_data['internal_id']
    user      ||= User.create!(user_parameters(user_data))

    render plain: user.id.to_s
  end

  private

  def user_parameters(user_data)
    {"name":        user_data['displayName'],
     "email":       user_data['mail'],
     "auth_sch_id": user_data['internai_id']}
  end

  def client
    OAuth2::Client.new('12169940729283463587',
                       'GPs6JWIEKvZ3Gj6lJnH5UM8tDwuDdjUkzDg9ZoDkZdcgDYIMCQHWcFFg2zjVZ56O8bMWGQ7gtZDwyL01',
                       site:          'https://auth.sch.bme.hu',
                       authorize_url: '/site/login?scope=displayName+sn+mail+givenName',
                       token_url:     'oauth2/token')
  end
end
