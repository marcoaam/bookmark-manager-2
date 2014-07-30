env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/contact_book_#{env}")
require_relative 'contact'
require_relative 'group'
DataMapper.finalize
DataMapper.auto_upgrade!