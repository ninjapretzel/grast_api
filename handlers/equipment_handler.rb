class Equipment_Handler

	def self.get_all_equipment
		g = Grow.get(params[:grow])
		e = g.equipment.to_json
	end
	
	def self.get_equipment
		g = Grow.get(params[:grow])
		e = g.equipment.get(params[:id]).to_json
	end

	def self.post_equipment
		g = Grow.get(params[:grow])
		e = Equipment.new(params[:piece])
		g.equipment << e
	end
	
	def self.remove_equipment
		g = Grow.get(params[:grow])
		e = g.equipment.get(params[:id])
		e.destroy
	end
	
end
