class Authentication::AuthenticateUser
  attr_accessor :jwt_token

  def initialize(jwt_token)
    @jwt_token = jwt_token
  end

  def self.call(jwt_token)
    new(jwt_token).perform
  end

  def perform
    decoded_token = JWT.decode jwt_token, ENV['SECRET'], true, {algorithm: 'HS256'}
    user_id       = decoded_token.first['user_id']
    user          = User.find(user_id)
  end
end