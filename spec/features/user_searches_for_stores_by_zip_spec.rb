require 'rails_helper'

RSpec.describe do
  context "As a user" do 
    scenario "I can search for stores within 25 miles by zip" do 
      VCR.use_cassette("store-search-25miles-by-zip") do 

        visit root_path

        fill_in "search", with: 80202
        click_on "search"
        expect(current_path).to eq("/search")

        expect(page).to have_content("16 Total Stores")
        expect(page).to have_selector(".store", count: 10)
        within first(".store") do
          expect(page).to have_content("BEST BUY - BELMAR")
          expect(page).to have_content("LAKEWOOD")
          expect(page).to have_content("3.66")
          expect(page).to have_content("303-742-8039")
          expect(page).to have_content("Big Box")
        end
      end
    end
  end
end 