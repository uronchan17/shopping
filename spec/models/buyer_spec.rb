require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buy = FactoryBot.build(:buyer)
  end

  describe '商品登録' do
    context '購入者登録できない時' do
      it 'total_feeが空では登録できない' do
        @buy.total_fee = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Total fee can't be blank")
      end
      it 'total_feeが数字でなければ登録できない' do
        @buy.total_fee = 'あ'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Total fee is not a number")
      end
      it 'payment_idが空では登録できない' do
        @buy.payment_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Payment can't be blank")
      end
      it 'payment_idが数字でなければ登録できない' do
        @buy.payment_id = 'あ'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Payment is not a number")
      end
      it 'userが紐付いていないと保存できないこと' do
      @buy.user = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("User must exist")
      end
    end
    context '購入者登録できる時' do
      it 'area_id,total_fee,payment_id,user_idが存在すれば登録できる' do
        expect(@buy).to be_valid
      end
    end
  end
end
