# アプリケーション名
## shopping

# アプリケーションの概要
## このアプリケーションは、前職で欲しいと考えていた添乗員の車内販売に利用できるECサイトです。

# URL
### https://infinite-reaches-43626.herokuapp.com/
# テスト用アカウント

# 利用方法
#### ログインする
##### お客様用アカウント
###### 商品一覧表示機能
###### 商品購入機能
##### 管理者用アカウント(Userモデルのuser_levelが1のアカウント)
###### 新規商品登録機能
###### 商品入荷機能
###### 購入者情報閲覧機能

# 目指した課題解決
## お客様が店の在庫を常に確認できるようにする
## 社員全員が注文状況を確認できる

# 洗い出した要件
## ログイン機能
## 管理者アカウントの作成
## 商品登録機能
## 商品購入機能
## 在庫管理機能
## 注文状況確認機能

# 実装予定の機能
## 詳細ページの作成
## コメント機能の実装


# テーブル設計

## usersテーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| phone_number | string  | null: false |
| country_id   | integer | null: false |

- has_many :buyers

## topテーブル
| Column      | Type    | Option      |
| ----------- | ------- | ----------- |
| items       | string  | null: false |
| price       | integer | null: false |
| explain     | text    | null: false |
| stock       | integer | null: false |
| category_id | integer | null: false |

- has_many :buyers, through: buyer_tops

## buyerテーブル
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| area_id          | integer    | null: false                   |
| total_fee        | integer    | null: false                   |
| payment          | integer    | null: false                   |
| delivery_fee     | integer    | null: false                   |
| delivery_days    | integer    | null: false                   |
| user             | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_many :tops, through: buyer_tops

### buyer_topsテーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| buyer         | references | null: false, foreign_key: true |
| top           | references | null: false, foreign_key: true |
| tops quantity | integer    | null: false                    |

### Association

- belongs_to :buyer
- belongs_to :top
