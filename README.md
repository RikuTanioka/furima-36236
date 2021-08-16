# テーブル設計

## users テーブル

|Column            |Type  |Options                 |
|------------------|------|------------------------|
|nickname          |string|null: false             |
|email             |string|null: false, unique:true|
|encrypted_password|string|null: false             |
|name_sur          |string|null: false             |
|name_first        |string|null: false             |
|name_sur_pron     |string|null: false             |
|name_first_pron   |string|null: false             |
|birthday          |date  |null: false             |

### Association

-has_many :items
-has_many :purchases

## items テーブル
|Column         |Type   |Options    |
|---------------|-------|-----------|
|name           |string |null: false|
|info           |text   |null: false|
|category_id    |integer|null: false|
|cond_id        |integer|null: false|
|ship_charge_id |integer|null: false|
|ship_area_id   |integer|null: false|
|ship_day_id    |integer|null: false|
|price          |integer|null: false|

### Association

-belongs_to :user
-has_one :purchase

## purchases テーブル

|Column|Type      |Options                      |
|------|----------|-----------------------------|
|user  |references|null: false, foreign_key:true|
|item  |references|null: false, foreign_key:true|

### Association

-belongs_to :user
-belongs_to :item
-has_one :address

## addresses テーブル

|Column  |Type      |Options                      |
|--------|----------|-----------------------------|
|post    |string    |null: false                  |
|pref_id |intenger  |null: false                  |
|munic   |string    |null: false                  |
|addr    |string    |null: false                  |
|bidg    |string    |
|tel     |string    |null: false                  |
|purchase|references|null: false, foreign_key:true|

### Association

-belongs_to :purchase