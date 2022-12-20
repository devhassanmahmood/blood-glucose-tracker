FactoryBot.define do
  factory :glucose_reading do
    level { 120 }
    created_at { DateTime.now }
    updated_at { DateTime.now }
    association :user, factory: :user
  end
end