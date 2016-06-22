class Demo < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	has_many :reviewers, through: :ratings, source: :reviewer, source_type: 'User'
	has_many :ratings, as: :reviewed
	validates :content, presence: true
	validates :materials, presence: true
	validates :name, presence: true, length: { maximum: 40 }
	validates :subject_id, presence: true

	def update_average_rating
		@value = 0
		self.ratings.each do |r|
			@value += r.value 
		end
		@total = self.ratings.size

		update_attributes(rating_average: @value.to_f / @total.to_f)
	end
end
