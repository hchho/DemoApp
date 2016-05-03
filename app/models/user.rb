class User < ActiveRecord::Base
	has_many :demos

	has_secure_password
end
