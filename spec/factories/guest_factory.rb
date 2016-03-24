FactoryGirl.define do
  factory :guest, class: Lobster::Users::Guest do
    transient do
      sequence(:name) { |n| "Guest #{n}" }
      id { Lobster::Uuid.generate }
      last_login { 2.days.ago }
      is_online true
    end

    initialize_with { new(id, name, is_online, last_login) }
  end
end
