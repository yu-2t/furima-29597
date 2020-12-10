# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               | 
| last_name_kana     | string  | null: false               | 
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               | 


### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| name           | string      | null: false                    |
| price          | integer     | null: false                    |
| text           | text        | null: false                    |
| category_id    | integer     | null: false                    | 
| condition_id   | integer     | null: false                    | 
| fee_id         | integer     | null: false                    |
| prefectures_id | integer     | null: false                    | 
| schedule_id    | integer     | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one :buy_record

## buy_records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| cord           | string      | null: false                    |
| prefectures_id | integer     | null: false                    |
| address1       | string      | null: false                    |
| address2       | string      | null: false                    |
| building       | string      |                                |
| tel            | string      | null: false                    |
| buy_record     | references  | null: false, foreign_key: true |

### Association
- belongs_to :buy_record

