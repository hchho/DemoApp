class User < ActiveRecord::Base
	has_many :demos

	has_secure_password

	def admin?
		self.role == 'admin'
	end
end
