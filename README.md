##　各テーブル

## users テーブル

| Column  | Type  | Option |
| ------- | ----- | ------ |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many


## tweets テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| content | text | null: false |
| genre_id | string | null: false |
| user | references | foreign_key: true |

### Association



## comments テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| text   | text | null: false |
| user   | references | foreign_key: true |

### Association