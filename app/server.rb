require 'sinatra'
require 'data_mapper'
require './lib/database_setup'

class ContactBook < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views, Proc.new { File.join(root, 'views') }

	get '/' do
		@contacts = Contact.all
		erb :index
	end

	post '/contacts/new' do
		name = params[:name]
		email = params[:email]
		country = params[:country]
		Contact.create(name: name, email: email, country: country)
		redirect to('/')
	end

end