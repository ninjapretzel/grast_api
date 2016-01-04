class Test

	def self.hole
		testGrow = Grow.new
		testPlant = Plant.new
		testPlant.strain = "brad Kush"
		testGrow.plants << testPlant
		testPlant2 = Plant.new
		testPlant2.strain = "BRAD SUCKS"
		testGrow.plants << testPlant2
		puts "test grow plants"
		puts testGrow.plants.to_json
	end

end
