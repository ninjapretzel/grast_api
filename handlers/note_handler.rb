class Note_Handler

	def self.get_all_notes(grow_id)
		g = Grow.find(grow_id)
		n = g.notes.to_json
	end
	
	def self.get_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.get(plant_id).to_json
	end

	def self.post_note(grow_id, title, created_date, body)
		g = Grow.find(grow_id)
		n = Note.new()
		if title != nil then n.title = title end
		if created_date != nil then n.created_date = created_date end
		if body != nil then n.text = body end
		g.notes << n
	end
	
	def self.remove_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.find(plant_id)
		n.destroy
	end
	
end
