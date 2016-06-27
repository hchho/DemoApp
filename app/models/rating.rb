class Rating < ActiveRecord::Base
	belongs_to :reviewed, polymorphic: true
	belongs_to :reviewer, polymorphic: true
	validates :value, presence: true, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}
	validates :reviewed, presence: true
	validates :reviewer, presence: true
end
