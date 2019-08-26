FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    association :customer # belongs_to
    # customer (dessa forma funciona igual se estivesse sem o association)
  end
end
