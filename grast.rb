require 'sinatra'
require 'mongo'
require 'mongoid'
require 'json'

Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

db = Mongoid.load!("./mongoid.yml", :development)

class Grast < Sinatra::Base
	get '/' do
		puts "Check"
		Test::hole()
	end

	#get all plants in the grow
	get '/:grow/plants' do
		Plant_Handler::get_all_plants(params[:grow])
	end
	#get a specific plant
	get '/:grow/plants/:id' do
		Plant_Handler::get_plant(params[:grow], params[:id])
	end
	#post a new plant
	post '/:grow/plants/add' do
		Plant_Handler::post_plant(params[:grow], params[:strain], params[:planted])
	end
	#remove a plant
	delete '/:grow/plants/:id' do
		Plant_Handler::remove_plant(params[:grow], params[:id])
	end
	#update ph
	put '/:grow/plants/:id/ph' do
		Plant_Handler::update_ph(params[:grow], params[:id], params[:ph])
	end
	#update soil moisture
	put '/:grow/plants/:id/soil' do
		Plant_Handler::update_moisture(params[:grow], params[:id], params[:moisture])
	end

	#Insert/Query notes
	#get - All notes
	get '/:grow/notes' do
		Note_Handler::get_all_notes(params[:grow])
	end
	#get - single note
	get '/:grow/notes/:id' do
		Note_Handler::get_note(params[:grow], params[:id])
	end
	#post - note
	post '/:grow/notes/add' do
		Note_Handler::post_note(params[:grow], params[:title], params[:created_date], params[:body])
	end
	#delete a note
	delete '/:grow/notes/:id' do
		Note_Handler::remove_note(params[:grow], params[:id])
	end

	#Insert/Query equipment
	#get - all equipment
	get '/:grow/equipment' do
		Equipment_Handler::get_all_equipment(params[:grow])
	end
	#get - a piece of equipment
	get '/:grow/equiment/:id' do
		Equipment_Handler::get_equipment(params[:grow], params[:id])
	end
	#post - equipment
	post '/:grow/equipment/add' do
		Equipment_Handler::post_equipment(params[:grow])
	end
	#delete a piece of equipment
	delete '/:grow/equipment/:id' do
		Equipment_Handler::remove_equipment(params[:grow], params[:id])
	end

	#insert/Query notifications
	#not entirely sure how the notification system will work
	# do we even want to keep these in a DB or just like the 
	# last 50 in local storage or somethin
	#get - all notification
	get '/:grow/notification' do
		Notification_Handler::get_all_notification(params[:grow])
	end
	#get - a single notification
	get '/:grow/notification/:id' do
		Notification_Handler::get_notification(params[:grow], params[:id])
	end
	#post - notification
	post '/:grow/notification/add' do
		Notification_Handler::post_notification(params[:grow])
	end
	
	delete '/:grow/notification/:id' do
		Notifcation_Handler::remove_notification(params[:grow], params[:id])
	end
	

	run!

end
