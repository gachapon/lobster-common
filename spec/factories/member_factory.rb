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

    trait :mod do
      clearance :mod
    end

    trait :admin do
      clearance :admin
    end

    initialize_with { new(id, name, is_online, last_login, clearance, registration) }

    factory :mod, traits: [:mod]
    factory :admin, traits: [:admin]
  end
end
