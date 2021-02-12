require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                    'Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                    'Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが英数字混合でも5文字以下では登録できない' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                    'Password is too short (minimum is 6 characters)')
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password_confirmationがpasswordと一致していなければ登録できない' do
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'phone_numberが空では登録できない' do
      @user.phone_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは9桁では登録できない' do
      @user.phone_number = '080080080'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは12桁では登録できない' do
      @user.phone_number = '080080080080'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは数字でなければ登録できない' do
      @user.phone_number = 'ああああaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは英数混合では登録できない' do
      @user.phone_number = '1a1a1a1a1a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
    end
    it 'country_idが1では登録できない' do
      @user.country_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include('Country must be other than 1')
    end
  end
  context '新規登録できるとき' do
    it 'user_level以外のカラムが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end