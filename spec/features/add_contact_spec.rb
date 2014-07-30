require 'spec_helper'

feature 'User can add a contact'  do
	scenario 'when browsing the home page' do
		expect(Contact.count).to eq 0
		visit '/'
		add_contact("Marco", "marco@gmail.com", "Venezuela")
		expect(Contact.count).to eq 1
		contact = Contact.first
		expect(contact.name).to eq "Marco"
		expect(contact.email).to eq "marco@gmail.com"
		expect(contact.country).to eq "Venezuela"
	end

	def add_contact(name, email, country)
		within('#new-contact') do
			fill_in 'name', :with => name
			fill_in 'email', :with => email
			fill_in 'country', :with => country
			click_button 'Add Contact'
		end	
	end
end