env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/contact_book_#{env}")
require_relative 'contact'
DataMapper.finalize
DataMapper.auto_upgrade!