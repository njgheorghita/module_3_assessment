require 'rails_helper'

RSpec.describe "Items", type: :request do 
  it "Returns 200 JSON response containing all items" do 
    get "/api/v1/items"

    expect(response).to be_success
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    # expect(response.count).to eq(16)
    item = parsed_response.first
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end
end