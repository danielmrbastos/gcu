# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ator do
		sequence(:nome) { |n| "Ator #{n}" }
		association :tipo_ator
		association :projeto
  end
end
