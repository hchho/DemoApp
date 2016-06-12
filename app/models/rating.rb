class Rating < ActiveRecord::Base
	belongs_to :demo
	belongs_to :user
	validates :rating, presence: true, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}
end
