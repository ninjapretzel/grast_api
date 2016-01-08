class Plant_Handler

	def self.get_all_plants(grow_id)
		g = Grow.find(grow_id)
		g.plants.to_json
	end
	
	def self.get_plant(grow_id, plant_id)
		g = Grow.get(grow_id)
		g.plants.get(plant_id).to_json
	end

	def self.post_plant(grow_id, plant_strain, planted_date, plant)
		g = Grow.find(grow_id)
		p = Plant.new()
		if JSON.parse(plant).to_h['plant']['strain'] != nil then p.strain = JSON.parse(plant).to_h['plant']['strain'] end
			
			if JSON.parse(plant).to_h['plant']['planted_date'] != nil then p.date_planted = JSON.parse(plant).to_h['plant']['planted_date'] end
		g.plants << p
		"{\"response\" : \"OK\", \"plant_id\" : \"#{p._id}\" }"
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