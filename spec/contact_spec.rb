describe Contact do
	
	it 'should create a contact and delete it from the database' do
		expect(Contact.count).to eq 0
		Contact.create(name: "Marco",
									email: "marco.army@gmail.com",
									country: "Venezuela")
		expect(Contact.count).to eq 1
		contact = Contact.first
		
		expect(contact.name).to eq "Marco"
		expect(contact.email).to eq "marco.army@gmail.com"
		expect(contact.country).to eq "Venezuela"
		contact.destroy
		expect(Contact.count).to eq 0
	end
end