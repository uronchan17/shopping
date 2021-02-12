require 'rails_helper'

RSpec.describe Top, type: :model do
  before do
    @top = FactoryBot.build(:top)
    @top.image = fixture_file_upload('app/assets/images/img/あさひ.jpg')
  end

  describe '商品登録' do
    context '商品登録できない時' do
      it 'imageが空では登録できない' do
        @top.image = nil
        @top.valid?
        expect(@top.errors.full_messages).to include("Image can't be blank")
      end
      it 'itemsが空では登録できない' do
        @top.items = ''
        @top.valid?
        expect(@top.errors.full_messages).to include("Items can't be blank")
      end
      it 'priceが空では登録できない' do
        @top.price = ''
        @top.valid?
        expect(@top.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字でなければ登録できない' do
        @top.price = 'あ'
        @top.valid?
        expect(@top.errors.full_messages).to include("Price is not a number")
      end
      it 'explainが空では登録できない' do
        @top.explain = ''
        @top.valid?
        expect(@top.errors.full_messages).to include("Explain can't be blank")
      end
      it 'stockが数字でなければ登録できない' do
        @top.stock = 'あ'
        @top.valid?
        expect(@top.errors.full_messages).to include("Stock is not a number")
      end
      it 'category_idが空では登録できない' do
        @top.category_id = ''
        @top.valid?
        expect(@top.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが数字でなければ登録できない' do
        @top.category_id = 'あ'
        @top.valid?
        expect(@top.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1では登録できない' do
        @top.category_id = 'あ'
        @top.valid?
        expect(@top.errors.full_messages).to include("Category is not a number")
      end
    end
    context '商品登録できる時' do
      it '全てのカラムが存在していれば登録できる' do
        expect(@top).to be_valid
      end
    end
  end
end
