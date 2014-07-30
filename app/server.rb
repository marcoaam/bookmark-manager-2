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
		name, email, country = params[:name], params[:email], params[:country]
		groups = params[:groups].split(' ').map do |group|
  		Group.first_or_create(:text => group)
		end
		Contact.create(name: name, email: email, country: country, groups: groups)
		redirect to('/')
	end

end