# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    content 'default content'
    title 'a title'
  end
end
