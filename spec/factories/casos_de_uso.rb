# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :caso_de_uso do
		sequence(:nome) { |n| "Caso de uso #{n}" }
		association :projeto
  end
end
