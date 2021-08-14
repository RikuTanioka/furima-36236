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
-has_many :purchase

## items テーブル
|Column      |Type  |Options    |
|------------|------|-----------|
|picture     |image |null: false|
|item_name   |string|null: false|
|item_info   |string|null: false|
|item_cat    |string|null: false|
|item_cond   |string|null: false|
|ship_charges|string|null: false|
|ship_area   |string|null: false|
|ship_days   |string|null: false|
|price       |string|null: false|

### Association

-belongs_to :users
-has_one :purchase

## purchase テーブル

|Column     |Type   |Options    |
|-----------|-------|-----------|
|tip_cr     |integer|null: false|
|effect_cr  |integer|null: false|
|security_cr|integer|null: false|

### Association

-belongs_to :users
-belongs_to :items
-has_one :address

## address テーブル

|Column|Type   |Options    |
|------|-------|-----------|
|post  |integer|null: false|
|pref  |string |null: false|
|munic |string |null: false|
|addr  |string |null: false|
|bidg  |string |null: false|
|tel   |integer|null: false|

### Association

-belongs_to :purchase