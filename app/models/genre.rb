class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'ランニング'},
    { id: 3, name: 'ウェイトトレーニング'},
    { id: 4, name: '自重トレーニング'},
    { id: 5, name: 'ヨガ'},
    { id: 6, name: 'ダンス'},
    { id: 7, name: '栄養'},
    { id: 8, name: '相談'},
    { id: 9, name: '相談（至急)'}
  ]

  include ActiveHash::Associations
  has_many :tweets
end