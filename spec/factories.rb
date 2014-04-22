FactoryGirl.define do
  factory :user do
    name     "Jerel Registre"
    email    "jregistre@test.com"
    password "password"
    password_confirmation "password"
  end
end