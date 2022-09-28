require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

 before do
  @item = FactoryBot.build(:item)
 end


  describe '商品出品機能' do  
   it '商品画像が空では登録できない'do
  #  @item.image = ''
  #  @item.valid?
  #  expect(@item.errors.full_messages).to include""
   end
   it '商品名が空では登録できない'do
   @item.name = ''
   @item.valid?
   expect(@item.errors.full_messages).to include"Name can't be blank"
   end
   it '商品の説明が空では登録できない'do
   @item.explain = ''
   @item.valid?
   expect(@item.errors.full_messages).to include"Explain can't be blank"
   end
   it 'カテゴリーの情報が----では登録できない'do
   @item.category_id = '1'
   @item.valid?
   expect(@item.errors.full_messages).to include"Category can't be blank"
   end
   it '商品の状態の情報が----では登録できない'do
   @item.condition_id = '1'
   @item.valid?
   expect(@item.errors.full_messages).to include"Condition can't be blank"
   end
   it '配送料の負担の情報が----では登録できない'do
   @item.cost_burden_id = '1'
   @item.valid?
   expect(@item.errors.full_messages).to include"Cost burden can't be blank"
   end
   it '発送元の地域の情報が----では登録できない'do
   @item.place_id = '1'
   @item.valid?
   expect(@item.errors.full_messages).to include"Place can't be blank"
   end
   it '発送までの日数の情報が----では登録できない'do
   @item.sent_day_id = '1'
   @item.valid?
   expect(@item.errors.full_messages).to include"Sent day can't be blank"
   end
   it '価格の情報が空では登録できない'do
   @item.place = nil
   @item.valid?
   expect(@item.errors.full_messages).to include"Place can't be blank"
   end
   it '価格は全角数字では登録できない'do
   @item.price = '１１１１１１'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end
   it '価格はひらがなでは登録できない'do
   @item.price = 'あああああ'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end
   it '価格はカタカナでは登録できない'do
   @item.price = 'アアアアア'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end
   it '価格は漢字では登録できない'do
   @item.price = '亜亜亜亜亜亜'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end
   it '価格はアルファベットでは登録できない'do
   @item.price = 'aaaaaa'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end  
   it '価格は299円では登録できない'do
   @item.price = '299'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end  
   it '価格は10,000,000円では登録できない'do
   @item.price = '100,000,000'
   @item.valid?
   expect(@item.errors.full_messages).to include"Price is not included in the list"
   end  

  end

end
