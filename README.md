## :cat: App Name / アプリ名

### <a href="https://neko-taku-app.herokuapp.com/"><img src="https://user-images.githubusercontent.com/69891481/99021029-19579800-25a3-11eb-849e-b12b3d55c1c5.png" width="50px"></a>　ねこ宅 - Neko-Taku -
<br>
<br>

## :book: Overview / 概要

### Not pet hotel, the service for taking care of your cat as an individual, - Neko-taku -.
### ペットホテルならぬ、個人で猫を預かるサービス『ねこ宅』
<br>

I can't have a cat becouse I live alone. I can't go out because I have a cat. If someone takes care of my cat. If someone leaves a cat to me temporarily. This App helps us grant wishes each other. The connection between people will also spread through cats.<br>

A person who wants to leave their cat, a person who wants to take care of cats, this is the App for matching their wishes.<br>
Cat's owner registers the cat's information for this App. House's owner registers their house's information for this App.<br>
The lists of house are displayed in the top page and cat's owner can search house's information near their home or according to their desired conditions.
You browse the details of house's information, enter the required information if you wish, and make a reservation for leaving.

ひとり暮らしだから猫を飼えない。猫がいるから出かけられない。誰か預かってくれたら…。一時的に預かれたら…。預ける人も預かる人も、お互いの願いを叶えられる場。猫を通して、人との繋がりも広がる。

猫を預けたい人、猫を預かりたい人、双方の希望をマッチさせるアプリケーションです。<br>
猫を預けたい人は飼っている猫情報を登録します。猫を預かりたい人は家（お宅）の情報を登録します。<br>
お宅登録情報がトップページに一覧で表示され、猫の飼い主は自分の家の近くや希望する条件にあったお宅情報を検索することができます。
お宅情報の詳細を閲覧し、希望にあえば、必要情報を入力し、お預けの予約をすることができます。
<br>


## :globe_with_meridians: Production Environment / 本番環境

### App URL
https://neko-taku-app.herokuapp.com/

### Basic Authentication / Basic認証
- ID : neko-taku
- Pass : 2020

### Account for Test / テスト用アカウント
- House's owner<br>
  ・Email : ko@ko<br>
  ・Pass : ko1010
- Cat's owner<br>
  ・Email：neko@neko<br>
  ・Pass：neko11<br>
  
### GitHub Repository / GitHubリポジトリ
https://github.com/mayorau3/neko-taku-app
<br>


## :dart: Intention / 制作背景（意図）
<br>
<br>

## Requirement Definition / 要件定義
以下のシートをご覧ください。実装要件と今後追加したい機能を記載しています。
<br>

## :movie_camera: Demo / 動作確認

### Sign up / ユーザー新規登録機能
<div align="center">
<img src="https://user-images.githubusercontent.com/69891481/99071535-a88d9b80-25f5-11eb-8cf3-78029f381c14.gif">
</div>
<br>
<br>

### Search / 検索機能
<div align="center">
<img src="https://user-images.githubusercontent.com/69891481/99071395-649a9680-25f5-11eb-84c6-0d5cbe9fa119.gif">
</div>
<br>
<br>

### My House Registration / 宅登録機能
<div align="center">
<img src="https://user-images.githubusercontent.com/69891481/99071640-dbd02a80-25f5-11eb-9e8f-a2df17b616aa.gif">
</div>
<br>
<br>


### My Cat Registration / My猫登録機能
<div align="center">
<img src="https://user-images.githubusercontent.com/69891481/99074333-e8a34d00-25fa-11eb-9d5b-aac509a40e93.gif">
</div>
<br>
<br>

### Reservation / お預け予約機能
<div align="center">
<img src="https://user-images.githubusercontent.com/69891481/99075599-16899100-25fd-11eb-9a21-dac0ed2170e5.gif">
</div>
<br>
<br>

## Development Eenvironment / 使用技術（開発環境）
Ruby/Ruby on Rails/JavaScript/MySQL/GitHub/AWS-S3/Heroku/Visual Studio Code

## 工夫したポイント
- お預け予約をするにあたり、猫情報を都度入力する形式でも良かったのですが、今後、猫登録情報の一覧、検索ができ、双方マッチングができるアプリになるよう、猫情報テーブルを用意して、そこからデータを取得しています。

## 今後追加したい実装


## :scroll: Screen Transition Diagram / 画面遷移図
![ねこ宅画面遷移図](https://user-images.githubusercontent.com/69891481/99019909-c977d180-25a0-11eb-85dd-e8523a5da959.png)



## :scroll: ER / ER図
 ![ER](https://user-images.githubusercontent.com/69891481/99016184-e4931300-2599-11eb-9380-9852658e0000.png)



## :scroll: Table Design / テーブル設計

### users table

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

### houses table

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


### cats table

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

### reservations table

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

