require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'responds to' do
    it 'responds to html by default' do
      post :create, :params => { :movie => { :name => 'default' } }
      expect(response.content_type).to eq 'text/html'
    end

    it 'responds to custom formats when provided in the params' do
      post :create, :params => { :movie => { :name => 'default' }, :format => :json }
      expect(response.content_type).to eq 'application/json'
    end
  end

  describe 'index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response.body).to eq ''
    end

    it 'renders the widgets/index template' do
      get :index
      expect(response).to render_template('movies/index')
      expect(response.body).to eq ''
    end
  end

end