require 'sinatra'
require 'mongo'
require 'mongoid'
require 'json'

Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

Mongoid.load!("./mongoid.yml", :development)

class Grast < Sinatra::Base
	get '/' do
		Test::hole()
	end

	#get all plants in the grow
	get '/:grow/plants' do
		Plant_Handler::get_all_plants()
	end
	#get a specific plant
	get '/:grow/plants/:id' do
		Plant_Handler::get_plant()
	end
	#post a new plant
	post '/:grow/plants/add' do
		Plant_Handler::post_plant()
	end
	#remove a plant
	delete '/:grow/plants/:id' do
		Plant_Handler::remove_plant()
	end
	#update ph
	put '/:grow/plants/:id/ph' do
		Plant_Handler::update_ph()
	end
	#update soil moisture
	put '/:grow/plants/:id/soil' do
		
	end

	#Insert/Query notes
	#get - All notes
	get '/:grow/notes' do
		Note_Handler::get_all_notes()
	end
	#get - single note
	get '/:grow/notes/:id' do
		Note_Handler::get_note()
	end
	#post - note
	post '/:grow/notes/add' do
		Note_Handler::post_note()
	end
	#delete a note
	delete '/:grow/notes/:id' do
		Note_Handler::remove_note()
	end

	#Insert/Query equipment
	#get - all equipment
	get '/:grow/equipment' do
		Equipment_Handler::get_all_equipment()
	end
	#get - a piece of equipment
	get '/:grow/equiment/:id' do
		Equipment_Handler::get_equipment()
	end
	#post - equipment
	post '/:grow/equipment/add' do
		Equipment_Handler::post_equipment()
	end
	#delete a piece of equipment
	delete '/:grow/equipment/:id' do
		Equipment_Handler::remove_equipment()
	end

	#insert/Query notifications
	#not entirely sure how the notification system will work
	# do we even want to keep these in a DB or just like the 
	# last 50 in local storage or somethin
	#get - all notification
	get '/:grow/notification' do
		Notification_Handler::get_all_notification()
	end
	#get - a single notification
	get '/:grow/notification/:id' do
		Notification_Handler::get_notification()
	end
	#post - notification
	post '/:grow/notification/add' do
		Notification_Handler::post_notification()
	end
	
	delete '/:grow/notification/:id' do
		Notifcation_Handler::remove_notification()
	end
	

	run!

end
