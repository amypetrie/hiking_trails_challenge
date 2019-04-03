require 'rails_helper'

describe Hike, type: :model do

  before(:each) do
    @hike_1 = Hike.create(name: "name", vote_count: 1)
  end

  describe "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:vote_count)}
  end

  it "Exists" do
    expect(@hike_1).to be_a Hike
    expect(@hike_1.name).to be_a String
    expect(@hike_1.vote_count).to be_an Integer
  end

end
