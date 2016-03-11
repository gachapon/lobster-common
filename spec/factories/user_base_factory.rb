FactoryGirl.define do
  factory :user_base, class: Lobster::Users::UserBase do
    sequence(:name) { |n| "Test User #{n}" }
    initialize_with { new(name) }
  end
end
