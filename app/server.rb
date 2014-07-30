require 'sinatra'
require 'data_mapper'
require './lib/database_setup'

class ContactBook < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')
	set :views, Proc.new { File.join(root, 'views') }

	get '/' do
		erb :index
	end

end