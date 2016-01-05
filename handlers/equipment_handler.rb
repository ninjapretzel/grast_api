class Equipment_Handler

	def self.get_all_equipment(grow_id)
		g = Grow.find(grow_id)
		e = g.equipment.to_json
	end
	
	def self.get_equipment(grow_id, equipment_id)
		g = Grow.find(grow_id)
		e = g.equipment.find(equipment_id).to_json
	end

	def self.post_equipment(grow_id)
		g = Grow.find(grow_id)
		e = Equipment.new()
		g.equipment << e
	end
	
	def self.remove_equipment(grow_id, equipment_id)
		g = Grow.get(grow_id)
		e = g.equipment.get(equipment_id)
		e.destroy
	end
	
end
