FactoryBot.define do
  factory :purchase_history_sent do
    code {'123-4567'}
    place_id {2}
    city {'札幌市'}
    street_address {'札幌市1-1'}
    building{'札幌ハイツ'}
    phone_number{'09009000900'}
  end
end
