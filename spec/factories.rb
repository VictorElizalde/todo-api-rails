FactoryBot.define do
  factory :todo, class: Todo do
    title { Faker::Lorem.sentence }
    done { Faker::Boolean.boolean(true_ratio: 1) }
  end
end