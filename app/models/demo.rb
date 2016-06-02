class Demo < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	validates :content, presence: true
	validates :materials, presence: true
	validates :name, presence: true, length: { maximum: 40 }
end
