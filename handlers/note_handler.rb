class Note_Handler

	def self.get_all_notes(grow_id)
		g = Grow.find(grow_id)
		n = g.notes.to_json
	end
	
	def self.get_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.find(plant_id).to_json
	end

	def self.post_note(grow_id, data, note)
		g = Grow.find(grow_id)
		n = Note.new()
		n.title = JSON.parse(note).to_h['note']['title']
		n.text_field = JSON.parse(note).to_h['note']['text']
		g.notes << n
		"{\"response\" : \"OK\", \"note_id\" : \"#{n._id}\" }"
	end
	
	def self.remove_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.find(plant_id)
		n.destroy
	end
	
end
