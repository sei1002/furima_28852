require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全て記入されていればOK' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに＠が含まれてなければ登録できないこと' do
      @user.email = 'aaaagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角数字のみなら登録出来ないこと' do
      @user.password = '111111'
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include('Password  Include both letters and numbers')
    end

    it 'passwordが半角英字のみなら登録出来ないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password  Include both letters and numbers')
    end

    it 'passwordが6文字以下なら登録出来ないこと' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'first_nameが空なら登録出来ない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角でないと登録出来ない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_nameが空なら登録出来ない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角でないと登録出来ない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'birthdayが空なら登録出来ない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
