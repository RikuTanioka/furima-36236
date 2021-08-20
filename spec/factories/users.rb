FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_sur              {"あ"}
    name_first            {"あ"}
    name_sur_pron         {"ア"}
    name_first_pron       {"ア"}
    birthday              {Faker::Date.birthday}
  end
end