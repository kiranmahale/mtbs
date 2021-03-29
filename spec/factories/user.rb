FactoryBot.define do
  factory :user, class: "::User" do
    email { Faker::Internet.email }
    admin { false }
    password { "Test1234" }
    # association :city, factory: :city
    # association :state, factory: :state
    # association :pincode, factory: :pincode
  end
end