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
        expect(@purchase_history_sent.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号は、ハイフンがないと登録できない' do
        @purchase_history_sent.code = '1111111'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include '郵便番号ハイフンを含めてください'
      end

      it '都道府県が----では登録できない' do
        @purchase_history_sent.place_id = '1'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "都道府県を入力してください"
      end

      it '市区町村が空では登録できない' do
        @purchase_history_sent.city = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "市区町村を入力してください"
      end

      it '番地が空では登録できない' do
        @purchase_history_sent.street_address = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "番地を入力してください"
      end

      it '電話番号が空では登録できない' do
        @purchase_history_sent.phone_number = ''
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "電話番号を入力してください",
                                                                       '電話番号ハイフンを含めないでください'
      end

      it '電話番号は9桁以下の半角数値では登録できない' do
        @purchase_history_sent.phone_number = '000111222'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include '電話番号ハイフンを含めないでください'
      end

      it '電話番号は12桁以上の半角数値では登録できない' do
        @purchase_history_sent.phone_number = '000111222333'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include '電話番号ハイフンを含めないでください'
      end

      it '電話番号はハイフンがあると登録できない' do
        @purchase_history_sent.phone_number = '000-1111-2222'
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include '電話番号ハイフンを含めないでください'
      end

      it 'userが紐づいていなければ登録ができない' do
        @purchase_history_sent.user_id = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Userを入力してください"
      end

      it 'itemが紐づいていなければ登録ができない' do
        @purchase_history_sent.item_id = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include "Itemを入力してください"
      end

      it 'tokenが空では登録できないこと' do
        @purchase_history_sent.token = nil
        @purchase_history_sent.valid?
        expect(@purchase_history_sent.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
