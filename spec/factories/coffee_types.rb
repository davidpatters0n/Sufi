# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coffee_type do
    name "Mocha"
    image "test"
    type_of_coffee "intense"
    temp 1
    caffeinated false
    basicInfo "Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum"
    price "£3.68"
  end
end


