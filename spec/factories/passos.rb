# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passo do
		sequence(:nome) { |n| "Passo #{n}" }
		association :fluxo
  end
end
