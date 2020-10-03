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

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| first_name      | string | null: false                          |
| last_name       | string | null: false                          |
| first_name_cana | string | null: false                          |
| last_name_cana  | string | null: false                          |
| birthday        | date   | null: false                          |
| phone_number    | string | null: false                          |
| gender_id       | integer| null: false                          |
| stylist_id      | integer| null: false, foreign_key: true       |
| email           | string | null: false                          |
| blood_type_id   | integer| null: false                          |
| job_id          | integer| null: false                          |
| customer_text   | text   | null: false                          |
| member_id       | integer| null: false                          |


### Association

- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

- has_many :user_menus
- has_many :menus, through: :user_menus
- has_one  :address 
- has_many :reservations
- belongs_to :stylist, optional: true
- has_one :information
- has_one :messages

## informations テーブル

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| information_date| date   |                                      |
| information_text| text   |                                      |
| user_id         | integer| null: false, foreign_key: true       |

### Association

- belongs_to :user

## messages テーブル

|  Column         | Type   | Options                              |
| ----------------| ------ | ------------------------------------ |
| consent         | boolean|                                      |
| information_text| text   | null: false                          |

### Association

- belongs_to :user

## gender テーブル

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| active_hash     |        |              |


## addresses テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| post_code           | string       | null: false                   |
| prefecture_id       | integer      | null: false                   |
| address_all         | string       | null: false                   |
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

|  Column                | Type         | Options                       |
| ---------------------- | ------------ | ----------------------------- |
| stylist_first_name     | string       | null: false                   |
| stylist_lsat_name      | string       | null: false                   |
| stylist_first_name_cana| string       | null: false                   |
| stylist_last_name_can  | string       | null: false                   |
| rank_id                | integer      | null: false                   |
| gender_id              | integer      | null: false                   |
| catchphrase            | string       | null: false                   |
| self-introduction      | string       | null: false                   |

### Association

- has_many :reservations
- has_many :users
- has-one :stylist_detail

## stylist_details テーブル

|  Column                | Type         | Options                       |
| ---------------------- | ------------ | ----------------------------- |
| rank_text              | string       | null: false                   |
| stylist_history_id     | integer      | null: false                   |
| nomination             | integer      | null: false                   |
| nomination_price       | integer      | null: false                   |
| style_type_id          | integer      | null: false                   |
| style_technique        | text         | null: false                   |
| hobby                  | text         | null: false                   |
| stylist_id             | integer      | null: false, foreign_key: true|
### Association
- belongs_to :stylist

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
