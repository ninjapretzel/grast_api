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
		n = Note.new()
		(params[:title]) ? n.title = (params[:title]) : n.title = Time.now
		(params[:created]) ? n.created_date = (params[:created]) : n.created_date = Time.now
		(params[:text]) ? n.text_field = (params[:text]) : n.text_field = "Empty Note"
		g.notes << n
	end
	
	def self.remove_note
		g = Grow.get(params[:grow])
		n = g.notes.get(params[:id])
		n.destroy
	end
	
end
