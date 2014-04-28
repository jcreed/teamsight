class User < ActiveRecord::Base
  
  acts_as_authentic do |config|
    config.login_field :email
    config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

	# def initialize(email, password, firstname, lastname)
	# 	# require 'debugger'; debugger
	# 	@email = email
	# 	@password = password
	# 	@firstname = firstname
	# 	@lastname = lastname
	# end

end