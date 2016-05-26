class User < ActiveRecord::Base
	has_many :demos
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password  
  validates :password, length: { minimum: 6 }, allow_blank: true

	attr_accessor :remember_token
  before_save :downcase_email
  has_many :favourites
  has_many :favourite_demos, through: :favourites, source: :favourited, source_type: 'Demo'


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
  
  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

end
