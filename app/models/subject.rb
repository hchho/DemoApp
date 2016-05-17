class Subject < ActiveRecord::Base
	has_many :demos
	validates :topic, presence: true, uniqueness: { case_sensitive: false }
end
