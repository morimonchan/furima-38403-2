require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    # @user = FactoryBot.build(:user)
   end
  
    describe '商品購入機能' do
      context '商品購入できるとき' do
       it '必須項目が存在すれば登録できる' do
        # expect(@item).to be_valid
       end
      
       it '建物名が空でも登録できる' do
       end
  
      end
  
      context '商品購入ができないとき' do
       it '郵便番号が空では登録できない' do
       end
  
       it '郵便番号は、「7桁」の半角文字では登録できない' do
       end
    
       it '都道府県が空では登録できない' do
       end
  
       it '市区町村が空では登録できない' do
       end
  
       it '番地が空では登録できない' do
       end
  
       it '電話番号が空では登録できない' do
       end
      
       it '電話番号は、9桁以下の半角数値では登録できない' do
       end
  
       it '電話番号は、12桁以上の半角数値では登録できない' do
       end
  
      end
    end
end
