class Grow
	include Mongoid::Document
	has_many :plants
	has_one :equipment
	has_many :notes
	has_many :notifications
end
