class Votes < ActiveRecord::Base
	belongs_to :voteable, polymorphic: true
	belongs_to :user

	validates_inclusion_of :value, in [-1, 1]

end