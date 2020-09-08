require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
      @item.save
      @user = FactoryBot.create(:user)
      @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    it '全て存在していればOK' do
      expect(@order).to be_valid
    end

    it 'tokenが無ければ登録出来ない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "Token can't be blank"
    end

    it 'postal_codeが無ければ登録できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal code can't be blank"
    end

    it 'postal_codeにハイフンが含まれていないと登録出来ない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end

    it 'prefecture_idが無ければ登録出来ない' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include 'Prefecture must be other than 0'
    end

    it 'cityが無ければ登録出来ない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "City can't be blank"
    end

    it 'addressが無ければ登録出来ない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include "Address can't be blank"
    end

    it 'telが無ければ登録出来ない' do
      @order.tel = nil
      @order.valid?
      expect(@order.errors.full_messages).to include 'Tel is invalid'
    end

    it 'telはハイフンなしで10~11桁出ないと保存できない' do
      @order.tel = '090-1234-5678'
      @order.valid?
      expect(@order.errors.full_messages).to include 'Tel is invalid'
    end
  end
end
