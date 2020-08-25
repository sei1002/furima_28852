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
| tel        | integer    | null:false  |  
| credit     | references |             |  

### Association
- has_many:items
- has_one:credit_cards

##Itemsテーブル

| Colum       | Type       | Options            |
| ----------- | ---------- | ------------------ |
| name        | string     | null:false         |
| category    | string     |                    |
| price       | integer    | null:false         |
| description | string     | null:false         |
| condition   | string     | null:false         |
| delv_fee    | string     | null:false         |
| delv_time   | string     | null:false         |
| from_area   | string     | null:false         |
| image       | string     | null:false         |
| user_id     | references | foreign_key: true  |

### Association
- belongs_to :user

## Credit_cardsテーブル

| Colum       | Type       | Options            |
| ----------- | ---------- | ------------------ |
| card_number | integer    | null:false         |
| security    | integer    | null:false         |
| card_year   | integer    | null:false         |
| card_month  | integer    | null:false         |
| user_id     | references | foreign_key: true  |
| address_id  | references | foreign_key: true  |

### Association
- has_one :address
- belongs_to :user

## Addresses

| Colum       | Type     | Options     |
| ----------- | -------- | ----------- |
| Prefectures | string   | null:false  |
| city        | string   | null:false  |
| address     | string   | null:false  |
| room_number | string   |             |
| Postal_code | string   | null:false  |

### Association
- belongs_to :credit-card
