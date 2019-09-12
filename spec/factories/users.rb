FactoryBot.define do
  factory :user,  aliases: [:owner] do
    first_name "Aaron"
    last_name "Sumnew"
    sequence(:email){ |n| "tester#{n}@example.com"}
    password "dottle-nouveau-pavilion-tights-furze"

    trait :Joe do
      first_name "Joe"
      last_name "Tester"
      email "joetester@example.com"
    end
    
    trait :Jane do
      first_name "Jane"
      last_name "Tester"
      email "janetester@example.com"
    end

  end

end
