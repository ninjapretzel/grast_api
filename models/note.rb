class Note
  include Mongoid::Document
  belongs_to :grow

	field :title, type: String, default: "blank"
	field :created_date, type: DateTime, default: DateTime.now
	field :text_field, type: String, default: "blank"
end


