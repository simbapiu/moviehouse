require 'rails_helper'

RSpec.feature "New Movie" do
  scenario "Add new movie" do
    movie = create(:movie, name: "Home Alone")

    visit movie_path(movie)

    Click_on("Create Movie")

    expect(page).to have_content("My image")
    expect(page).to have_content("XXX001")
    expect(page).to have_content("Home Alone")
    expect(page).to have_content("1990")
    expect(page).to have_content("My genre")
    expect(page).to have_content(45.5)
  end
end