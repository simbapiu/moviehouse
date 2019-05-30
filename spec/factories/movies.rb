FactoryBot.define do
  factory :movie do

    name      { "Alokawai" }
    image_url { "HA.png" }
    code      { "XXX001 " }
    year      { "1990" }
    genre     { "My genre" }
    price     { 45.5 }

  end

  factory :edit_movie do
    name      { "Alokawai2" }
    image_url { "HA.png" }
    code      { "XXX002 " }
    year      { "1992" }
    genre     { "My genre" }
    price     { 15.5 }
  end
end