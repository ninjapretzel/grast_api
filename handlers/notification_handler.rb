class Notification_Handler

	def self.get_all_notifications(grow_id)
		g = Grow.find(grow_id)
		notif = g.notifications.to_json
	end
	
#	def self.get_notification(grow_id, notification_id)
#		g = Grow.get(grow_id)
#		notif = g.notifications.get(notification_id).to_json
#	end

	def self.post_notification(grow_id)
		g = Grow.find(grow_id)
		notif = Notification.new()
		g.notifications << notif
	end
	
	def self.remove_notification(grow_id, notification_id)
		g = Grow.find(grow_id)
		notif = g.notifications.find(notification_id)
		notif.destroy
	end
	
end
