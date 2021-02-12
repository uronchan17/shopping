require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #ルートパスへ移動しようとするとログインページに遷移する
      visit root_path
      expect(current_path).to eq(new_user_session_path)
      # 新規登録ボタンをクリックすると新規登録ページへ移動する
      find_link("新規登録", href: "/users/sign_up").click
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password
      fill_in 'phone_number', with: @user.phone_number
      select @user.country.name, from: 'prefecture'
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      #ルートパスへ移動しようとするとログインページに遷移する
      visit root_path
      expect(current_path).to eq(new_user_session_path)
      # 新規登録ボタンをクリックすると新規登録ページへ移動する
      find_link("新規登録", href: "/users/sign_up").click
      expect(current_path).to eq(new_user_registration_path)
      # ユーザー情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      fill_in 'phone_number', with: ''
      select @user.country.name, from: 'prefecture'
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
    end
  end
end