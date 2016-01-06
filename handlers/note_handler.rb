class Note_Handler

	def self.get_all_notes(grow_id)
		g = Grow.find(grow_id)
		n = g.notes.to_json
	end
	
	def self.get_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.get(plant_id).to_json
	end

	def self.post_note(grow_id, data)
		puts "Note Posting"
		g = Grow.find(grow_id)
		data = @request_payload
		puts "here"
		puts data
		puts "and here"
		n = Note.new()
		#if  != nil then n.title = title end
		#if  != nil then n.text_field = body end
		puts n
		g.notes << n
	end
	
	def self.remove_note(grow_id, plant_id)
		g = Grow.find(grow_id)
		n = g.notes.find(plant_id)
		n.destroy
	end
	
end
