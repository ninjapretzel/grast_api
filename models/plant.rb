class Plant
	include Mongoid::Document
	belongs_to :grow
	has_many :journal
	
	#Attributes
	field :date_planted, type: DateTime, default: DateTime.now
	field :strain, type: String
	#moisture and ph should probably be an array of floats
	field :soil_temperature, type: Array
	field :moisture_level, type: Array
	field :soil_ph, type: Array
end