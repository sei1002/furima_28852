## Usersテーブル

| Colum   -- | Type       | Options     |  
| ---------- | ---------- | ----------- |  
| first_name | string     | null:false  |  
| last_name  | string     | null:false  |  
| furigana   | string     | null:false  |  
| birthday   | date       | null:false  |  
| nickname   | string     | null:false  |  
| email      | string     | null:false  |  
| password   | string     | null:false  |  
| tel        | string     | null:false  |   

### Association
- has_many:items
- has_one:purchase

##Itemsテーブル

| Colum       | Type       | Options            |
| ----------- | ---------- | ------------------ |
| name        | string     | null:false         |
| category    | integer    | null:false         |
| price       | integer    | null:false         |
| description | string     | null:false         |
| condition   | integer     | null:false        |
| delv_fee    | integer    | null:false         |
| delv_time   | integer    | null:false         |
| prefectures | integer    | null:false         |
| image       | string     | null:false         |
| user_id     | references | foreign_key: true  |

### Association
- has_one:purchase
- belongs_to :user
- prefecturesはActive_hash使用
- categoryはActive_hash使用
- conditionはActive_hash使用
- delv_feeはActive_hash使用
- delv_timeはActive_hash使用
## Purchaseテーブル

| Colum       | Type       | Options            |
| ----------- | ---------- | ------------------ |
| user_id     | references | foreign_key: true  |
| item_id     | references | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses

| Colum       | Type     | Options     |
| ----------- | -------- | ----------- |
| Prefectures | integer  | null:false  |
| city        | string   | null:false  |
| address     | string   | null:false  |
| build_name  | string   |             |
| room_number | string   |             |
| Postal_code | string   | null:false  |

### Association
- belongs_to :purchase
- prefecturesはActive_hash使用