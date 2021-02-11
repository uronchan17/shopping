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
