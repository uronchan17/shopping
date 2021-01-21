# テーブル設計

## usersテーブル

| Column       | Type    | Option      |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| phone_number | string  | null: false |
| country_id   | integer | null: false |

- has_many :buyers

## catalogテーブル
| Column      | Type    | Option      |
| ----------- | ------- | ----------- |
| items       | string  | null: false |
| price       | integer | null: false |
| explain     | text    | null: false |
| stock       | integer | null: false |
| category_id | integer | null: false |

## buyerテーブル
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| area_id          | integer    | null: false                   |
| shipping_address | integer    | null: false                   |
| payment          | integer    | null: false                   |
| delivery_fee     | integer    | null: false                   |
| delivery_days    | integer    | null: false                   |
| user             | references | null: false foreign_key: true |

### Association

- belongs_to :user



