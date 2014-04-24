# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_setup do
    kickstarter false
    site_active false
    blog_active false
  end
end
