# Screen Transition Diagram / 画面遷移図
![ねこ宅画面遷移図](https://user-images.githubusercontent.com/69891481/99019909-c977d180-25a0-11eb-85dd-e8523a5da959.png)


# ER / ER図
 ![ER](https://user-images.githubusercontent.com/69891481/99016184-e4931300-2599-11eb-9380-9852658e0000.png)


# Table Design / テーブル設計

## users table

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

## houses table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| pr             | text       | null: false                    |
| explanation    | text       | null: false                    |
| cat_history_id | integer    | null: false                    |
| chara_stay     | integer    |                                |
| chara_5min     | integer    |                                |
| chara_house    | integer    |                                |
| chara_floor    | integer    |                                |
| chara_weekend  | integer    |                                |
| chara_weekday  | integer    |                                |
| chara_have_cat | integer    |                                |
| chara_tower    | integer    |                                |
| chara_camera   | integer    |                                |
| stay_price     | integer    |                                |
| one_day_price  | integer    |                                |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :reservations


## cats table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| age_id       | integer    | null: false                    |
| sex          | integer    | null: false                    |
| chara_clever | integer    |                                |
| chara_sleep  | integer    |                                |
| chara_active | integer    |                                |
| chara_quiet  | integer    |                                |
| chara_greedy | integer    |                                |
| chara_lonely | integer    |                                |
| chara_own    | integer    |                                |
| explanation  | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## reservations table

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| start_date    | date       | null: false                    |
| stay_days     | integer    |                                |
| one_day_hours | integer    |                                |
| message       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| house         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :house

