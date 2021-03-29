FactoryBot.define do
  factory :movie, class: "::Movie" do
    name { Faker::Movie.title }
    description { Faker::Movie.quote }
    certificate { "U/A" }
    duration { 160 }
    star_cast { Faker::Name.first_name }
    release_date { Date.today }
  end
end