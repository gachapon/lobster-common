FactoryGirl.define do
  factory :user, aliases: [:member], class: Lobster::Users::User do
    sequence(:name) { |n| "Test User #{n}" }
    id { Lobster::Uuid.new }
    last_login { 2.days.ago }
    clearance :member
    registration { 3.months.ago }
    is_online true

    trait :guest do
      clearance :guest
      registration nil
    end

    trait :never_logged_in do
      last_login nil
      is_online false
    end

    trait :mod do
      clearance :mod
      registration { 10.months.ago }
    end

    trait :admin do
      clearance :admin
      registration { 24.months.ago }
    end

    trait :bot do
      clearance :super
      registration nil
    end

    trait :online do
      is_online true
    end

    trait :offline do
      is_online false
    end

    initialize_with do
      if registration
        Lobster::Users::User.member(id, name, is_online, clearance, registration, last_login)
      else
        Lobster::Users::User.guest(id, name, is_online, last_login)
      end
    end

    factory :guest, traits: [:guest]
    factory :moderator, traits: [:mod]
    factory :administrator, traits: [:admin]
  end
end
