require 'rails_helper'

RSpec.feature 'EditMovies', type: :feature do
  describe 'Movie' do
    subject { page }

    describe 'edit' do
      movie = FactoryBot.create(:movie)

      before { visit edit_movie_path(movie.id) }
      it {expect(page).to have_content('Editing')}
      it {expect(page).to have_current_path edit_movie_path(movie.id)}
    end
  end

  scenario 'Editing a movie' do
    @movie = Movie.create(:name => 'My name', :code => 'My code', :image_url => 'HA.png',
                            :year => 'My year', :genre => 'My genre', :price => 1)

    visit edit_movie_path(@movie)
    fill_in 'Image url', with: 'HA.png'
    fill_in 'Name', with: 'Alokawai'
    fill_in 'Code', with: 'XXX001'
    fill_in 'Year', with: '1990'
    fill_in 'Genre', with: 'My genre'
    fill_in 'Price', with: 45.5
    click_button 'Update Movie'
  end
end
