class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'ランニング'},
    { id: 3, name: 'ウェイトトレーニング'},
    { id: 4, name: '自重トレーニング'},
    { id: 5, name: 'ヨガ'}
  ]

  include ActiveHash::Associations
  has_many :tweets
end