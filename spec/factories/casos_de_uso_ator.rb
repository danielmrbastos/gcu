# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :caso_de_uso_ator do
		association :caso_de_uso
		association :ator
  end
end
