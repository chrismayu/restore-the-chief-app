FactoryGirl.define do
  factory :message do
     name 'Test User'
    email 'chrismayu@gmail.com'
    subject 'changeme'
    body 'body of a note'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
