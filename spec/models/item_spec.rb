require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全て存在していればOK' do
      expect(@item).to be_valid
    end

    it 'Nameが空では登録出来ないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it 'Descriptionが空では登録出来ないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it 'Imageが空では登録出来ないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it 'Categoryが空では登録出来ないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category must be other than 0'
    end

    it 'Conditionが空では登録出来ないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition must be other than 0'
    end

    it 'Delv feeが空では登録出来ないこと' do
      @item.delv_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delv fee must be other than 0'
    end

    it 'Prefectureが空では登録出来ないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture must be other than 0'
    end

    it 'Delv timeが空では登録出来ないこと' do
      @item.delv_time_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include 'Delv time must be other than 0'
    end

    it 'Priceが空では登録出来ないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it 'Priceが半角数字でなければ登録出来ないこと' do
      @item.price = '１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price Half-width number'
    end

    it 'Priceの値が300~9999999でなければ登録出来ないこと' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price  Out of setting range'
    end
  end
end
