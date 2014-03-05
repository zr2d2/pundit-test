# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    subject 'email'
    body 'Lorem Ipsum'

    association :user
    association :lead
  end
end
