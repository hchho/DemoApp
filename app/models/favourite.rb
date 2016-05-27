class Favourite < ActiveRecord::Base
	belongs_to :favourited, polymorphic: true
	belongs_to :user
	validates :user_id, presence: true
	validates :favourited_id, presence: true
end
