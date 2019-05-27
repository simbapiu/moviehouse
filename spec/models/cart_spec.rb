require 'rails_helper'

RSpec.describe Cart, type: :model do

  context "Validate that be mongoid document" do
    it { is_expected.to be_mongoid_document }
  end

  context "Validate that movie has many line items" do
    it { is_expected.to have_many(:line_items).with_dependent(:destroy) }
  end


end
