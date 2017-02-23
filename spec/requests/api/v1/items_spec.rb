require 'rails_helper'

RSpec.describe "Items", type: :request do 
  before do 
    @first = Item.create(name:"cool", description: "thing", image_url:"www.facebook.com")
    @second = Item.create(name:"more", description: "stuff", image_url:"www.google.com")
    @third = Item.create(name:"dumb", description: "object", image_url:"www.yahoo.com")
  end

  it "Returns 200 JSON response containing all items" do 
    get api_v1_items_path

    expect(response).to be_success
    expect(response.status).to eq(200)
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

  it "Returns a 200 JSON response containing a specified item" do 
    get api_v1_item_path(@first)

    expect(response).to be_success
    expect(response.status).to eq(200)
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:name]).to eq(@first.name)
    expect(parsed_response).to have_key(:id)
    expect(parsed_response).to have_key(:name)
    expect(parsed_response).to have_key(:description)
    expect(parsed_response).to have_key(:image_url)
    expect(parsed_response).to_not have_key(:created_at)
    expect(parsed_response).to_not have_key(:updated_at)
  end

  it "Returns a 204 JSON response if the record is successfully deleted" do 
    expect(Item.all.count).to eq(3)

    delete api_v1_item_path(@first)

    expect(response).to be_success
    expect(response.status).to eq(204)

    expect(Item.all.count).to eq(2)
  end

  it "Returns a 201 JSON response if a record is successfully created" do 
    new_item_params = {name: "New", description: "Item", image_url: "www.cnn.com"}

    post api_v1_items_path, item: new_item_params

    expect(response).to be_success
    expect(response.status).to eq(201)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(parsed_response[:name]).to eq(new_item_params[:name])
    expect(parsed_response).to have_key(:id)
    expect(parsed_response).to have_key(:name)
    expect(parsed_response).to have_key(:description)
    expect(parsed_response).to have_key(:image_url)
    expect(parsed_response).to_not have_key(:created_at)
    expect(parsed_response).to_not have_key(:updated_at)
  end
end