# テーブル設計

## users テーブル

|Column            |Type  |Options                 |
|------------------|------|------------------------|
|nickname          |string|null: false             |
|email             |string|null: false, unique:true|
|encrypted_password|string|null: false             |
|name              |string|null: false             |
|name_pron         |string|null: false             |
|birthday          |date  |null: false             |

### Association

-has_many :items
-has_many :purchases

## items テーブル
|Column         |Type   |Options    |
|---------------|-------|-----------|
|item_name      |string |null: false|
|item_info      |text   |null: false|
|item_cat_id    |integer|null: false|
|item_cond_id   |integer|null: false|
|ship_charges_id|integer|null: false|
|ship_area_id   |integer|null: false|
|ship_days_id   |integer|null: false|
|prices         |integer|null: false|

### Association

-belongs_to :users
-has_one :purchase

## purchase テーブル

|Column|Type  |Options    |
|------|------|-----------|
|user  |string|null: false|
|item  |string|null: false|

### Association

-belongs_to :user
-belongs_to :item
-has_one :address

## address テーブル

|Column|Type  |Options    |
|------|------|-----------|
|post  |string|null: false|
|pref  |string|null: false|
|munic |string|null: false|
|addr  |string|null: false|
|bidg  |string|
|tel   |string|null: false|

### Association

-belongs_to :purchase