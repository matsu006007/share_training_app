# Share Training app

## アプリケーション概要

ShareTrainingAppは日々のトレーニングを更に豊にするアプリケーションです

## URL

http://54.92.57.45/

## テスト用アカウント

ユーザー名: テスト01  
email: test@test.com  
pass: 111aaa

## このアプリケーションで目指した課題解決

###### 1 モチベーションの維持

###### 2 トレーニングのマンネリ化防止

###### 3 トレーニングの悩み解消



## 洗い出した要件

### ・トレーニング記録投稿機能
<dl>
  <dt>目的</dt>
  日々のトレーニングを投稿してアウトプットできるようにします。
  <dt>詳細</dt>
  投稿一覧に全ユーザーの投稿が表示されます。 
  コメントやいいね！をもらえます。
  <dt>ストーリー(ユースケース)</dt>
  投稿ページからその日行ったトレーニングの内容をタイトル、ジャンル、本文、画像（必要であれば添付）を入力して記録します。  
  投稿すると一覧ページに遷移し、ユーザー名、投稿時間、イイね数、上記で入力したタイトル、ジャンル（相談or要相談を選んだ場合のみ）が一覧で表示されます。  
  気になったタイトルをクリックするとその投稿の詳細ページへ遷移し、内容を見ることができ、コメントやいいね！を他ユーザーからもらうことができます。
</dl>

### コメント機能
<dl>
  <dt>目的</dt>
  投稿の詳細ページから、その投稿に対してコメントすることができます。
  <dt>詳細</dt>
  詳細ページから自由にコメントできるようにします
  <dt>ストーリー(ユースケース)</dt>
  各詳細ページの本文の下にあるコメント入力フォームからコメントを送信します。  
  javascriptを使って、送信ボタンを押すと、非同期でコメント欄に送ったコメントが反映します。  
  送信したコメントは送信者のみ削除することができます。
</dl>

### いいね!機能
<dl>
  <dt>目的</dt>
  投稿の詳細ページから、その投稿に対してイイね！をすることができます。
  <dt>詳細</dt>
  各詳細ページのイイね！ボタンを押していいねをつけることができるようにします。  
  <dt>ストーリー(ユースケース)</dt>
  詳細ページのいいねボタンをクリックするといいねボタン横の数字が増えていきます。  
  ボタンは1人に対して1度だけ押すことができます。
</dl>



## 実装予定の機能

##### 1 フォロー機能
ユーザー同士で繋がることができます。マイページからフォローしているユーザーのページに行くことができます。

##### 2 カレンダー機能
カレンダーにトレーニングの予定を入れることができます。また、スタンプとメモを入力できるようにし、トレーニングを行ったか確認できるようにします。


## 作成の背景

私は今までトレーニングジムやで自宅で筋トレやランニングなどのトレーニングを行ってきましたが、継続させることの難しさを感じていました。  
特に開始から1〜3ヶ月ほど経過すると、少しずつ行う頻度が減っていき、最終的に全くやらなくなるというサイクルを何度も経験してきました。  
その中で、なぜ運動を続けることができないのかを考えた時に、「マンネリ化して飽きてしまう」、「トレーニングに関する悩みが解消できない」、「目標がない」という理由なのではないかと思いました。  
そこで、普段のトレーニングを記録し、その記録をシェアして自分と同じようにトレーニングをしている方同士でモチベーションを高め合ったり、わからないことを気軽に質問でき、普段のトレーニングを更に良いものにできるアプリケーションを開発したいと思いShareTrainingAppを作成しました。

## ペルソナ

性別:  男女どちらも

年齢:  20代前半〜40代前半の社会人


# テーブル一覧

## 各テーブル

## users テーブル

| Column  | Type  | Option |
| ------- | ----- | ------ |
| nickname | string | null: false |
| image    | string | null: false |
| target  | string | null: false  |
| comment | text   | null: false  |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_many :likes


## tweets テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| title  | string | null: false |
| content | text | null: false |
| genre_id | string | null: false |
| user | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes



## messages テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| text   | text | null: false |
| user   | references | foreign_key: true |
| tweet  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet 

## likes テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| user   | references | foreign_key: true |
| tweet  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


