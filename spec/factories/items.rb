FactoryBot.define do
  factory :item do
    name            {"商品名"}
    price           {500}
    text            {"サンプル"}
    category_id     {2}
    condition_id    {2}
    fee_id          {2}
    prefectures_id  {2}
    schedule_id     {2}
    user_id         {1}

    association :user
  end
end
