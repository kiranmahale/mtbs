FactoryBot.define do
  factory :seat_template, class: "::SeatTemplate" do
    sequence(:seat_key) { |n| "#{Faker::Types.character}_#{n}" }
    number { [1,2,3,4] }
    seat_type { 'Bronze'}
    price { 150 }
  end
end