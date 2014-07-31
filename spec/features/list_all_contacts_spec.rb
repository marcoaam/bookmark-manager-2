feature 'User browses the list if contacts' do
	before(:each) {
		Contact.create(name: "Marco",
									email: "marco.army@gmail.com",
									country: "Venezuela",
									:groups => [Group.first_or_create(:text => 'Family')])
		Contact.create(name: "Lucila",
									email: "lucila333@gmail.com",
									country: "Venezuela",
									:groups => [Group.first_or_create(:text => 'Family')])
		Contact.create(name: "Jean",
									email: "Jean@gmail.com",
									country: "Italy",
									:groups => [Group.first_or_create(:text => 'Friends')])
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content('Marco')
	end

	scenario "when searching with a group name" do
		visit '/groups/Family'
		expect(page).to have_content('Marco')
		expect(page).to have_content('Lucila')
		expect(page).not_to have_content('Jean')
	end

end