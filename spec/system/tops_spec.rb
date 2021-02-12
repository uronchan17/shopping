require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @top = FactoryBot.build(:top)
    image_path = Rails.root.join('app/assets/images/img/あさひ.jpg')
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページにアクセスする
      visit root_path
      expect(current_path).to eq(root_path)
      # 新商品の情報を入力する
      attach_file 'item-images', 'app/assets/images/img/あさひ.jpg'
      fill_in 'user_payment_items', with: @top.items
      fill_in 'user_payment_explain', with: @top.explain
      fill_in 'item-name', with: @top.price
      # 送信するとTopモデルのカウントが1増える
      select @top.category.name, from: 'item-category1'
      expect{
        find('input[name="commit1"]').click
      }.to change { Top.count }.by(1)
    end
  end
end