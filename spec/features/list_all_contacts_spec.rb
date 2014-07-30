feature 'User browses the list if contacts' do
	before(:each) {
		Contact.create(name: "Marco",
									email: "marco.army@gmail.com",
									country: "Venezuela")
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content('Marco')
	end
	
end