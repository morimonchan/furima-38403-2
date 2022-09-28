FactoryBot.define do
  factory :item do
    name           { 'test' }
    explain        { 'testtest' }
    category_id    { 2 }
    condition_id   { 2 }
    cost_burden_id { 2 }
    place_id       { 2 }
    sent_day_id    { 2 }
    price          { '310' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
