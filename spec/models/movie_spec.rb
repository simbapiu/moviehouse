require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:all)do
    @movies = Movie.new(code: "My code", name: "My name", price:45, year: "My year", genre: "My genre", 
      image_url: "image.png")
  end
  
  it "should have a matching code" do
    expect(@movies.code).to eq("My code")
  end

  it "should have a matching price" do
    expect(@movies.price).to eq(45)
  end

  it "should have a matching name" do
    expect(@movies.name).to eq("My name")
  end

  it "should have a matching year" do
    expect(@movies.year).to eq("My year")
  end

  it "should have a matching genre" do
    expect(@movies.genre).to eq("My genre")
  end

  it "should have a matching image_url" do
    expect(@movies.image_url).to eq("image.png")
  end
end
