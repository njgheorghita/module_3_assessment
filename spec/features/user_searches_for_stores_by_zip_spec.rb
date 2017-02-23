require 'rails_helper'

RSpec.describe do
  context "As a user" do 
    scenario "I can search for stores by zip" do 
      it "returns stores within 25 miles" do 
        # When I visit "/"
        visit root_path
        # And I fill in a search box with "80202" and click "search"
        fill_in "search", with: 80202
        click_on "search"
        # Then my current path should be "/search" (ignoring params)
        expect(current_path).to eq("/search")
        # And I should see stores within 25 miles of 80202
        # And I should see a message that says "16 Total Stores"
        expect(page).to have_content("16 Total Stores")
        # And I should see exactly 10 results
        expect(page).to have_selector(".store", count: 10)
        # And I should see the long name, city, distance, phone number and store type for each of the 10 results
        within first.("store") do
          expect(page).to have_content("StoreName")
        end
      end
    end
  end
end 