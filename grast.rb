require 'sinatra'
require 'sinatra/cross_origin'
require 'mongo'
require 'mongoid'
require 'json'

Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

db = Mongoid.load!("./mongoid.yml", :development)

class Grast < Sinatra::Base
	register Sinatra::CrossOrigin
	enable :cross_origin
	set :bind, '0.0.0.0'
	#Lets get the body of the request
	before do
  	request.body.rewind
  	@request_payload = request.body.read
	end	
	
	get '/' do
		Test::hole()
	end
	
	#GROW
	#get grow humidity
	get '/:grow/humidity' do
		Grow_Handler::get_humidity(params[:grow])
	end
	#get grow temperature
	get '/:grow/temperature' do
		Grow_Handler::get_temperature(params[:grow])
	end
	#update grow humidity
	post '/:grow/humidity' do
		Grow_Handler::update_humidity(params[:grow], @request_payload)
	end
	#update grow temperature
	post '/:grow/temperature' do
		Grow_Handler::update_temperature(params[:grow], @request_payload)
	end
	
	
	#PLANTS
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
		Plant_Handler::post_plant(params[:grow], @request_payload)
	end
	#remove a plant
	delete '/:grow/plants/:id' do
		Plant_Handler::remove_plant(params[:grow], params[:id])
	end
	#update ph
	put '/:grow/plants/:id/:ph' do
		Plant_Handler::update_ph(params[:grow], params[:id], @request_payload)
	end
	#update soil moisture
	put '/:grow/plants/:id/:soil' do
		Plant_Handler::update_moisture(params[:grow], params[:id], @request_payload)
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
		content_type :json
		Note_Handler::post_note(params[:grow], params[:data], @request_payload)
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
	#get - all notification
	get '/:grow/notifications' do
		Notification_Handler::get_all_notifications(params[:grow])
	end
	#get - a single notification
#	get '/:grow/notification/:id' do
#		Notification_Handler::get_notification(params[:grow], params[:id])
#	end
	#post - notification
	post '/:grow/notifications/add' do
		Notification_Handler::post_notification(params[:grow])
	end
	
	delete '/:grow/notifications/:id' do
		Notifcation_Handler::remove_notification(params[:grow], params[:id])
	end
	

	run!

end
