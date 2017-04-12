# frozen_string_literal: true

FactoryGirl.define do
  factory :attendee do
    id { Faker::Number.number(6) }
    serial { Faker::Number.number(6) }
    name { Faker::Name.name }
    code { Faker::Code.asin }
    email { Faker::Code.asin }
    phone { Faker::Code.asin }
    card_serial { Faker::Code.asin }
    event_id {}
    created_at { Faker::Date.between(10.days.ago, 2.days.ago) }
    updated_at { Faker::Date.between(2.days.ago, Time.zone.today) }
    association :event, factory: :event
  end
end
