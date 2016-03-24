FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "johndoe@gmail.com"
    password "randompass"
    # admin false
  end

  # This will use the User class (Admin would have been guessed)
end
