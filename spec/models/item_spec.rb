require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明が空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'カテゴリーの情報が----では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end
      it '商品の状態の情報が----では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it '配送料の負担の情報が----では登録できない' do
        @item.cost_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it '発送元の地域の情報が----では登録できない' do
        @item.place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送元の地域を入力してください"
      end
      it '発送までの日数の情報が----では登録できない' do
        @item.sent_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end
      it '価格の情報が空では登録できない' do
        @item.place = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "配送元の地域を入力してください"
      end
      it '価格は全角数字では登録できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格はひらがなでは登録できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格はカタカナでは登録できない' do
        @item.price = 'アアアアア'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格は漢字では登録できない' do
        @item.price = '亜亜亜亜亜亜'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格はアルファベットでは登録できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格は299円では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it '価格は10,000,000円では登録できない' do
        @item.price = '100,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
