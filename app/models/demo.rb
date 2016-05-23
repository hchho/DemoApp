class Demo < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	validates :content, presence: true
	validates :materials, presence: true
end
