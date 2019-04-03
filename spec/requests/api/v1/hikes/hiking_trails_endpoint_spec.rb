require "rails_helper"

describe "GET /hiking_trails" do

   before(:each) do
     @hike_1 = Hike.create(name: "Hike1", vote_count: 2)
     hike_2 = Hike.create(name: "Hike2", vote_count: 5)
     hike_3 = Hike.create(name: "Hike3", vote_count: 7)

     get '/hiking_trails'

     @hikes_response = JSON.parse(response.body, symbolize_names: true)
   end

  it "Returns a JSON object containing an array of hike objects with name and vote count attributes" do

    expect(response.status).to eq(201)
    expect(@hikes_response).to have_key :data
    expect(@hikes_response[:data]).to be_an Array
    expect(@hikes_response[:data].length).to eq 3
    expect(@hikes_response[:data].first).to have_key :attributes
    expect(@hikes_response[:data].first[:attributes]).to have_key :name
    expect(@hikes_response[:data].first[:attributes]).to have_key :vote_count
    expect(@hikes_response[:data].last[:attributes][:name]).to eq "Hike3"
    expect(@hikes_response[:data].last[:attributes][:vote_count]).to eq 7
  end

  it "Returns the correct data types" do

    expect(@hikes_response[:data].last[:attributes][:name]).to be_a String
    expect(@hikes_response[:data].last[:attributes][:vote_count]).to be_an Integer
  end

  it "Returns an updated response when existing hike data is added to or modified" do

    @hike_1.update(name: "New Hike1", vote_count: 100)
    hike_4 = Hike.create(name: "Hike4", vote_count: 10)
    hike_5 = Hike.create(name: "Hike5", vote_count: 15)

    get '/hiking_trails'

    new_response = JSON.parse(response.body, symbolize_names: true)

    expect(new_response[:data].first[:attributes][:name]).to eq "New Hike1"
    expect(new_response[:data].first[:attributes][:vote_count]).to eq 100
    expect(new_response[:data].last[:attributes][:name]).to eq "Hike5"
    expect(new_response[:data].last[:attributes][:vote_count]).to eq 15
  end

end
