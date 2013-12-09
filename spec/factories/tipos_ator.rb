# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tipo_ator do
    sequence(:sigla) { |n| "sigla #{n}" }
    sequence(:descricao) { |n| "descricao #{n}" }
  end
end
