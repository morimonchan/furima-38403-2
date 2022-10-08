require 'rails_helper'

RSpec.describe PurchaseHistorySent, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_sent = FactoryBot.build(:purchase_history_sent, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@purchase_history_sent).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_history_sent.building = ''
        expect(@purchase_history_sent).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空では登録できない' do
        @purchase_history_sent.code = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Code can't be blank"
      end

      it '郵便番号は、ハイフンがないと登録できない' do
        @purchase_history_sent.code = '1111111'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include 'Code is invalid. Include hyphen(-)'
      end

      it '都道府県が----では登録できない' do
        @purchase_history_sent.place_id = '1'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Place can't be blank"
      end

      it '市区町村が空では登録できない' do
        @purchase_history_sent.city = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @purchase_history_sent.street_address = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Street address can't be blank"
      end

      it '電話番号が空では登録できない' do
        @purchase_history_sent.phone_number = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Phone number can't be blank",
                                                                       'Phone number is invalid. Include hyphen(-)'
      end

      it '電話番号は9桁以下の半角数値では登録できない' do
        @purchase_history_sent.phone_number = '000111222'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include 'Phone number is invalid. Include hyphen(-)'
      end

      it '電話番号は12桁以上の半角数値では登録できない' do
        @purchase_history_sent.phone_number = '000111222333'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include 'Phone number is invalid. Include hyphen(-)'
      end

      it '電話番号はハイフンがあると登録できない' do
        @purchase_history_sent.phone_number = '000-1111-2222'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include 'Phone number is invalid. Include hyphen(-)'
      end

      it '電話番号はハイフンがあると登録できない' do
        @purchase_history_sent.phone_number = '000-1111-2222'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include 'Phone number is invalid. Include hyphen(-)'
      end

      it 'userが紐づいていなければ登録ができない' do
        @purchase_history_sent.user_id = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐づいていなければ登録ができない' do
        @purchase_history_sent.item_id = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Item can't be blank"
      end

      it 'tokenが空では登録できないこと' do
        @purchase_history_sent.token = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


