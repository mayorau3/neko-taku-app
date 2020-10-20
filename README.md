# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| kanji_family_name  | string  | null: false |
| kanji_first_name   | string  | null: false |
| zip_code           | string  | null: false |
| region_id          | integer | null: false |
| city               | string  | null: false |
| address1           | string  | null: false |
| address2           | string  |             |
| phone              | string  | null: false |

### Association
- has_one :house
- has_many :cats
- has_many :reservations

## houses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| pr            | text       | null: false                    |
| explanation   | text       |                                |
| cat_history   | integer    | null: false                    |
| character     | integer    | null: false                    |
| stay_price    | integer    | null: false                    |
| one_day_price | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :reservations


## cats テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| age         | integer    | null: false                    |
| sex         | integer    | null: false                    |
| character   | integer    | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :reservations

## reservations テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| start_date    | date       | null: false                    |
| stay_days     | integer    | null: false                    |
| one_day_hours | integer    | null: false                    |
| message       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| house         | references | null: false, foreign_key: true |
| cat           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :house
- belongs_to :cat