class Demo < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject
	has_many :ratings
	validates :content, presence: true
	validates :materials, presence: true
	validates :name, presence: true, length: { maximum: 40 }
	validates :subject_id, presence: true
end
