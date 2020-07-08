class Authentication
  def self.client
    OAuth2::Client.new('12169940729283463587',
                       'GPs6JWIEKvZ3Gj6lJnH5UM8tDwuDdjUkzDg9ZoDkZdcgDYIMCQHWcFFg2zjVZ56O8bMWGQ7gtZDwyL01',
                       site:          'https://auth.sch.bme.hu',
                       authorize_url: '/site/login?scope=displayName+sn+mail+givenName',
                       token_url:     'oauth2/token')
  end
end