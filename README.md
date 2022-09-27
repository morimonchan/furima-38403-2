# README

# テーブル設計

＊users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| nickname           | string | null: false            |
| email              | string | null: false default: "",unique: true|
| encrypted_password | string | null: false default: ""|
| name_last          | string | null: false            |
| name_first         | string | null: false            |
| name_kana_last    | string | null: false            |
| name_kana_first    | string | null: false            |
| birthday           | date   | null: false            |

- has_many :items
- has_many :purchase_histories

＊items テーブル
| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| name               | string | null: false            |
| explain            | text   | null: false            |
| category_id        | integer| null: false            |
| condition_id       | integer| null: false            |
| cost_burden_id     | integer| null: false            |
| place_id           | integer| null: false            |
| sent_day_id        | integer| null: false            |
| price              | integer| null: false            |
| user               | references| null: false foreign_key: true           |

- belongs_to :user
- has_one    :purchase_history


*purchase_histories テーブル
| Column             | Type    | Options                                     |
| ------------------ | ------- | -----------                                 |
| user               | references | null: false  foreign_key: true           |
| item               | references | null: false  foreign_key: true           |

- belongs_to :user
- belongs_to :item
- has_one    :sent


＊sents テーブル
| Column             | Type    | Options                 |
| ------------------ | ------- | -----------             |
| code               | string  | null: false             |
| place_id           | integer | null: false             |
| city               | string  | null: false             |
| street_address     | string  | null: false             |
| building           | string  |                         |
| phone_number       | string  | null: false             |
| purchase_history   | references| null: false   foreign_key: true          |

- belongs_to :purchase_history