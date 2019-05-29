require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "Verify that movie attributes it's correct" do
    before(:all)do
      @movies = Movie.new(code: "My code", name: "My name", price:45.5, year: "My year", genre: "My genre",
        image_url: "aloha.png")
    end

    it { is_expected.to have_field(:code).of_type(String) }
    it "should have a matching code" do
      expect(@movies.code).to eq("My code")
    end

    it { is_expected.to have_field(:price).of_type(Float) }
    it "should have a matching price" do
      expect(@movies.price).to eq(45.5)
    end

    it { is_expected.to have_field(:name).of_type(String) }
    it "should have a matching name" do
      expect(@movies.name).to eq("My name")
    end

    it { is_expected.to have_field(:year).of_type(String) }
    it "should have a matching year" do
      expect(@movies.year).to eq("My year")
    end

    it { is_expected.to have_field(:genre).of_type(String) }
    it "should have a matching genre" do
      expect(@movies.genre).to eq("My genre")
    end

    it { is_expected.to have_field(:image_url).of_type(String) }
    it "should have a matching image_url" do
      expect(@movies.image_url).to eq("aloha.png")
    end
  end

  context "Validate that be mongoid document" do
    it { is_expected.to be_mongoid_document }
  end

  context "Validate that movie has many line items" do
    it { is_expected.to have_many :line_items }
  end

  context "Validate the presence of the movie fields" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:code)}
    it { is_expected.to validate_presence_of(:year)}
    it { is_expected.to validate_presence_of(:genre)}
    it { is_expected.to validate_presence_of(:image_url)}
  end

  it { is_expected.to validate_uniqueness_of(:name) }

  context "Validate the image format" do
    it { is_expected.to validate_format_of(:image_url)}
  end

  context "Validate the price is greater than 0" do
    it { is_expected.to validate_numericality_of(:price).greater_than(0)}
  end

end
