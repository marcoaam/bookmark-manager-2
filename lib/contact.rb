class Contact

	include DataMapper::Resource

	has n, :groups, :through => Resource

	property :id,      Serial
	property :name,    String, length: 2..50, required: true
	property :email,   String, format: :email_address
	property :country, String, length: 2..50, required: true

end