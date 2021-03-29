FactoryBot.define do
  factory :screening_detail, class: "::ScreeningDetail" do
    association :movie, factory: :movie
    association :screen, factory: :screen
    association :time_slot, factory: :time_slot
  end
end