# frozen_string_literal: true
FactoryGirl.define do
  factory :check_point do
    id { Faker::Number.number(6) }
    name { Faker::Name.name }
    type 1
    machine_id {}
    event_id {}
    created_at { Faker::Date.between(10.days.ago, 2.days.ago) }
    updated_at { Faker::Date.between(2.days.ago, Time.zone.today) }
    association :event, factory: :event
    association :machine, factory: :machine
  end
end
