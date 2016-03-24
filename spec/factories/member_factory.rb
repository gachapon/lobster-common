FactoryGirl.define do
  factory :member, class: Lobster::Users::Member do
    transient do
      sequence(:name) { |n| "Member #{n}" }
      id { Lobster::Uuid.generate }
      last_login { 2.days.ago }
      is_online true
      clearance :member
      registration { 1.months.ago }
    end

    trait :moderator do
      clearance :mod
    end

    trait :administrator do
      clearance :admin
    end

    initialize_with { new(id, name, is_online, last_login, clearance, registration) }

    factory :mod, traits: [:moderator]
    factory :admin, traits: [:administrator]
  end
end
