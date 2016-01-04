class Plant_Handler

	def self.get_all_plants
		g = Grow.get(params[:grow])
		g.plants.to_json	
	end
	
	def self.get_plant
		g = Grow.get(params[:grow])
		g.plants.get(params[:id]).to_json
	end

	def self.post_plant
		p = Plant.new()
		#set the strain property if we got it
		(params[:strain]) ? p.strain = (params[:strain]) : p.strain = "generic"
		#Check for a date planted, if not set it to the current time
		(params[:date_planted]) ? p.date_planted = (params[:date_planted]) : p.date_planted = Time.now
		g = Grow.get(params[:grow])
		g.plants << p
	end
	
	def self.remove_plant
		g = Grow.get(params[:grow])
		p = g.plants.get(params[:id])
		p.destroy
	end
			
	#Work in progress below
	def self.update_ph
		g = Grow.get(params[:grow])
		p = g.plants.get(params[:id])
		p.soil_ph.push(params[:ph])
	end
			
	def self.update_moisture
		g = Grow.get(params[:grow])
		p = g.plants.get(params[:id])
		p.moisture_level.push(params[:moisture])
	end
end