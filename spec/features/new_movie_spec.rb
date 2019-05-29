require 'rails_helper'


RSpec.feature "New Movie", type: :feature do
  scenario "Add new movie" do
    movie = create(:movie, name: "Alokawai")

    visit movie_path(movie)

    expect(page).to have_content("Alokawai")
    expect(page).to have_content("XXX001")
    expect(page).to have_content("1990")
    expect(page).to have_content("My genre")
    expect(page).to have_content(45.5)
    expect(page).to have_link("Edit")

  end
end