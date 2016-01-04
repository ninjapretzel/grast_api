class Plant_Handler

	def self.get_all_plants(grow_id)
		g = Grow.find(grow_id)
		g.plants.to_json
	end
	
	def self.get_plant(grow_id, plant_id)
		g = Grow.get(grow_id)
		g.plants.get(plant_id).to_json
	end

	def self.post_plant(grow_id, plant_strain, planted_date)
		g = Grow.find(grow_id)
		p = Plant.new()
		#set the strain property if we got it
		if plant_strain != nil then p.strain = plant_strain end
		#Check for a date planted, if not set it to the current time
		if planted_date != nil then p.date_planted = planted_date end
		g.plants << p
	end
	
	def self.remove_plant(grow_id, plant_id)
		g = Grow.get(grow_id)
		p = g.plants.get(plant_id)
		p.destroy
	end
			
	#Work in progress below
	def self.update_ph(grow_id, plant_id, ph)
		g = Grow.get(grow_id)
		p = g.plants.get(plant_id)
		p.soil_ph.push(ph)
	end
			
	def self.update_moisture(grow_id, plant_id, moisture)
		g = Grow.get(grow_id)
		p = g.plants.get(plant_id)
		p.moisture_level.push(moisture)
	end
end