class Grow
	include Mongoid::Document
	has_many :plants
	has_one :equipment
	has_many :notes
	has_many :notifications
	
	field :grow_temperature, type: Array
	field :grow_humidity, type: Array
end
