class StoreController < ApplicationController
  def index
    @movies = Movie.order_by(name: :asc)
  end
end
