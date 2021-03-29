FactoryBot.define do
  factory :booking, class: "::Booking" do
    booking_amount { 222 }
    seat_number { ["A_1"] }
    association :screening_detail, factory: :screening_detail
    association :user, factory: :user
  end
end