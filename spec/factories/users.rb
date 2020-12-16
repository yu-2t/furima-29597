FactoryBot.define do
  factory :user do
    email              {Faker::Internet.free_email}
    password           {"123qwe"}
    nickname           {"tarou"}
    last_name          {"山田"}
    first_name         {"太郎"}
    last_name_kana     {"ヤマダ"}
    first_name_kana    {"タロウ"}
    birthday           {"2010-8-10"}
  end
end
