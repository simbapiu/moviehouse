FactoryBot.define do
  factory :movie do
    image_url { "My image" }
    code      { "XXX001" }
    name      { "My name" }
    genre     { "My genre" }
    year      { "1990" }
    price     { 45.5 }

  end
end