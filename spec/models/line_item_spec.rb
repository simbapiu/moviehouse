require 'rails_helper'

RSpec.describe LineItem, type: :model do

  context "Validate that be mongoid document" do
    it { is_expected.to be_mongoid_document }
  end

  context "Validate that movie has uniqueness on line items" do
    it { is_expected.to validate_uniqueness_of(:movie) }
  end

  it { is_expected.to belong_to(:movie) }
  it { is_expected.to belong_to(:movie).of_type(Movie) }

  it { is_expected.to belong_to(:cart) }
  it { is_expected.to belong_to(:cart).of_type(Cart) }
end
