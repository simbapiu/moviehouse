require 'rails_helper'

RSpec.describe StoreController, :type => :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'responds to' do
    it 'responds to html by default' do
      post :index, :params => { :movie => { :name => 'default' } }
      expect(response.content_type).to eq 'text/html'
    end
  end
  describe 'index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response.body).to eq ''
    end

    it 'renders the store/index template' do
      get :index
      expect(response).to render_template('store/index')
      expect(response.body).to eq ''
    end
  end
end