class Note_Handler

	def self.get_all_notes
		g = Grow.get(params[:grow])
		n = g.notes.to_json
	end
	
	def self.get_note
		g = Grow.get(params[:grow])
		n = g.notes.get(params[:id]).to_json
	end

	def self.post_note
		g = Grow.get(params[:grow])
		n = Note.new(params[:note])
		g.notes << n
	end
	
	def self.remove_note
		g = Grow.get(params[:grow])
		n = g.notes.get(params[:id])
		n.destroy
	end
	
end
