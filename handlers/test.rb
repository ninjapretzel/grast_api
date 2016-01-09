class Test

	def self.hole
		"hello world"
		g = Grow.find("567893cec6f3605725000001")
		notif = Notification.new()
		g.notifications << notif
		puts notif
	end

end
