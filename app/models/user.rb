class User < ActiveRecord::Base
	has_many :demos

	attr_accessor :remember_token

	has_secure_password

	def admin?
		self.role == 'admin'
	end

	# Returns the hash digest of the given string.
	def self.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

	# Returns a random token.
    def self.new_token
    	SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persisten sessions
  	def remember
  		self.remember_token = User.new_token
  		update_attribute(:remember_digest, User.digest(remember_token))
  	end

  	# Forgets a user.
  	def forget
  		update_attribute(:remember_digest, nil)
  	end
end
