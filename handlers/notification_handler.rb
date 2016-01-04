class Notification_Handler

	def self.get_all_notification
		g = Grow.get(params[:grow])
		notif = g.notifications.to_json
	end
	
	def self.get_notification
		g = Grow.get(params[:grow])
		notif = g.notifications.get(params[:id]).to_json
	end

	def self.post_notification
		g = Grow.get(params[:grow])
		notif = Notification.new(params[:new])
		g.notification << notif
	end
	
	def self.remove_notification
		g = Grow.get(params[:grow])
		notif = g.notification.get(params[:id])
		notif.destroy
	end
	
end
