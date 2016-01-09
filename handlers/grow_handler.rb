class Grow_Handler
	
	def self.get_humidity(grow_id)
		g = Grow.find(grow_id)
		g.grow_humidity.to_json
	end
	
	def self.get_temperature(grow_id)
		g = Grow.find(grow_id)
		g.grow_temperature.to_json
	end
	
	def self.update_humidity(grow_id, humidity)
		g = Grow.find(grow_id)
		g.grow_humidity.push(JSON.parse(humidity).to_h['humidity']['reading'])
		"{\"response\" : \"OK\", \"grow_id\" : \"#{g._id}\" }"
	end
	
	def self.update_temperature(grow_id, temperature)
		g = Grow.find(grow_id)
		"{\"response\" : \"OK\", \"grow_id\" : \"#{g._id}\" }"
	end
	
end