require 'rails_helper'
RSpec.describe User, type: :model do
  #   pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end
    it 'mailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end

    it '重複したアドレスは登録することが出来ない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
    end

    it '＠がないアドレスは登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it '5文字以内のパスワードでは登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
    end

    it '大文字ではパスワードを登録できない' do
      @user.password = 'AAAAAA'
      @user.password_confirmation = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
    end

    it '英字だけのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", 'パスワードは不正な値です'
    end

    it '数字だけのパスワードでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
    end

    it 'パスワードとパスワード(確認)が異なると登録ができない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'name_lastがないと登録できない' do
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字を入力してください"
    end
    it 'name_firstがないと登録できない' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名前を入力してください"
    end
    it 'name_lastは半角では登録できない' do
      @user.name_last = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'name_firstは半角では登録できない' do
      @user.name_first = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'name_lastは数字では登録できない' do
      @user.name_last = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'name_firstは数字では登録できない' do
      @user.name_first = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'name_kana_lastは苗字がないと登録できない' do
      @user.name_kana_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "苗字カナを入力してください"
    end

    it 'name_kana_firstは名前がないと登録できない' do
      @user.name_kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名前カナを入力してください"
    end

    it 'name_kana_lastはひらがなでは登録できない' do
      @user.name_kana_last = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字カナは不正な値です')
    end

    it 'name_kana_firstはひらがなでは登録できない' do
      @user.name_kana_first = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前カナは不正な値です')
    end

    it 'name_kana_lastは漢字では登録できない' do
      @user.name_kana_last = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字カナは不正な値です')
    end

    it 'name_kana_firstは漢字では登録できない' do
      @user.name_kana_first = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前カナは不正な値です')
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "生年月日を入力してください"
    end
  end
end
