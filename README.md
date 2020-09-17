# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| first_name      | string | null: false  |
| last_name       | string | null: false  |
| first_name_cana | string | null: false  |
| last_name_cana  | string | null: false  |
| birthday        | date   | null: false  |
| phone_number    | string | null: false  |
| gender_id       | integer| null: false  |


### Association

- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

- has_many :user_menus
- has_many :menus, through: :user_menus
- has_one  :address 
- has_many :reservations

## gender テーブル

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| active_hash     |        |              |


## addresses テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| post_code           | string       | null: false                   |
| prefecture_id       | integer      | null: false                   |
| city                | string       | null: false                   |
| house_number        | string       | null: false                   |
| building            | string       |                               |
| user_id             | integer      | null: false, foreign_key: true|

### Association

- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
- belong_to user

## prefectureテーブル

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| active_hash     |        |              |

## menusテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| menu_name           | string       | null: false                   |
| price               | integer      | null: false                   |

### Association

- has_many :user_menus
- has_many :users, through: :user_menus
- has_many :reservations

## user_menusテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| user_id             | integer      | null: false, foreign_key: true|
| menu_id             | integer      | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :menu

## stylists テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| stylist_name        | string       | null: false, foreign_key: true|


### Association

- has_many :reservations

##  reservationsテーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| stylist_id          | integer      | null: false, foreign_key: true|
| seat_id             | integer      | null: false                   |
| time                | time         | null: false                   |
| date                | date         | null: false                   |
| menu_id             | integer      | null: false, foreign_key: true|
| user_id             | integer      | null: false  foreign_key: true|

### Association

- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :seat
- belongs_to :stylist
- belongs_to :user
- belongs_to :menu

## seatテーブル

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| active_hash     |        |              |
