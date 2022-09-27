FactoryBot.define do
  factory :user do
    nickname           {'test'}
    email              {'test@test'}
    password           {'aaa000'}
    password_confirmation {password}
    name_last          {'あああ'}
    name_first         {'いいい'}
    name_kana_last     {'アアア'}
    name_kana_first    {'イイイ'}
    birthday           {'1930-01-01'}
  end
end