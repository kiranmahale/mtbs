FactoryBot.define do
  factory :time_slot, class: "::TimeSlot" do
    start_time { DateTime.now }
    end_time { DateTime.now + 3.hours }
  end
end