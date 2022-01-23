# テーブル設計

## users テーブル

| Column             | Type   | Options                                            |
| ------------------ | ------ | -------------------------------------------------- |
| email              | string | null: false, uniqueness: true                      |
| encrypted_password | string | null: false                                        |
| nickname           | string | null: false                                        |
| last-name          | string | null: false, format: { with: /\A[ぁ-んァ-ン一-龥]/ } |
| first-name         | string | null: false, format: { with: /\A[ぁ-んァ-ン一-龥]/ } |
| last-name-kana     | string | null: false, format: { with: /\A[ァ-ヶー－]+\z/ }   |
| first-name-kana    | string | null: false, format: { with: /\A[ァ-ヶー－]+\z/ }   |
| birth-date         | date   | null: false                                        |

### Association

- has_many :users
- has_many :items

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false                    |
| user_id                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item

## order テーブル

| Column       | Type       | Options                                            |
| ------------ | ---------- | -------------------------------------------------- |
| postal-code  | string     | null: false, format: { with: /\A\d{3}[-]\d{4}\z/ } |
| prefecture   | string     | null: false                                        |
| city         | string     | null: false                                        |
| addresses    | string     | null: false                                        |
| building     | string     |                                                    |
| phone-number | integer    | null: false, length: {minimum: 10 }                |
| user_id      | references | null: false, foreign_key: true                     |
| item_id      | references | null: false, foreign_key: true                     |

### Association

- belongs_to :user
- belongs_to :item