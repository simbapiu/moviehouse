require 'rails_helper'
require File.dirname(__FILE__) + '/../spec_helper'

describe MoviesController, "creating a new movie" do
  integrate_views
  fixtures :movies
  it "Should redirect to index with a notice on successful save" do
    Movie.expects(:save).returns(true)
    post 'create'
    assigns[:movie].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(movie_path)
  end

  it "Should re-render new template on failed save" do
    Movie.expects(:save).returns(false)
    post 'create'
    assigns[:movie].should be_new_record
    flash[:notice].should be_nil
    response.should render_template('new')
  end

end
