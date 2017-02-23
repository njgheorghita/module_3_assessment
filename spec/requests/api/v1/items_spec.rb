require 'rails_helper'

RSpec.describe "Items", type: :request do 
  before do 
    @first = Item.create(name:"cool", description: "thing", image_url:"www.facebook.com")
    @second = Item.create(name:"more", description: "stuff", image_url:"www.google.com")
    @third = Item.create(name:"dumb", description: "object", image_url:"www.yahoo.com")
  end

  it "Returns 200 JSON response containing all items" do 
    get "/api/v1/items"

    expect(response).to be_success
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response.count).to eq(3)
    item = parsed_response.first
    
    expect(item[:name]).to eq(@first.name)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  it "a 200 JSON response containing a specified item" do 
    get "/api/v1/items/1"

    expect(response).to be_success
    expect(response.body.count).to eq(1)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    item = parsed_response.first

    expect(item.name).to eq(@first.name)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end
end