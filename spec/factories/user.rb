FactoryGirl.define do

  factory :user, :class => 'User' do
  	sequence(:email){|n| "user#{n}@factory.com" }
    password 'cryptobable'
    role 'tech'
    username 'superpowersauce'

  end

end