require 'rails_helper'

RSpec.describe Admin, type: :model do

  context "Validate that be mongoid document" do
    it { is_expected.to be_mongoid_document }
  end

  context "Validate presence of fields to login" do
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_presence_of(:password) }
  end

  context "Validate presence of fields to register" do
    it { is_expected.to have_fields(:email, :name, :last_name, :encrypted_password) }
  end

  context "Validate type of fields and default value" do
    it { is_expected.to have_field(:email).of_type(String).with_default_value_of("") }
    it { is_expected.to have_field(:name).of_type(String).with_default_value_of("") }
    it { is_expected.to have_field(:last_name).of_type(String).with_default_value_of("") }
    it { is_expected.to have_field(:encrypted_password).of_type(String).with_default_value_of("") }
  end


end
