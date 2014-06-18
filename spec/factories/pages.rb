# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :page do
    content 'default content'
    title 'a title'
  end
  
  factory :unique_page, class: Page do
    sequence(:title) { |t| "Title ##{t}" }
    sequence(:content) { |t| "Content #{t}" }
  end
    
end
