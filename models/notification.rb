class Notification
  include Mongoid::Document
  belongs_to :grow

	field :created_date, type: DateTime, default: DateTime.now
	field :text_field, type: String
end


