require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "responds to" do
    it "responds to html by default" do
      post :create, :params => { :carts => { :name => "default" } }
      expect(response.content_type).to eq "text/html"
    end

    it "responds to custom formats when provided in the params" do
      post :create, :params => { :carts => { :name => "default" }, :format => :json }
      expect(response.content_type).to eq "application/json"
    end
  end
end
