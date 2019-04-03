require "rails_helper"

describe "GET /hiking_trails" do

  it "Lists each trail and current vote count" do
    hike_1 = Hike.create(name: "Hike1", vote_count: 2)
    hike_2 = Hike.create(name: "Hike2", vote_count: 5)
    hike_3 = Hike.create(name: "Hike3", vote_count: 7)

    get '/hiking_trails'

    expect(response.status).to eq(201)

  end


end
