class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  with_options presence: true do
    validates :nickname
  end
  mount_uploader :image, ImageUploader

   has_many :tweets
   has_many :messages
   has_many :likes, dependent: :destroy
   has_many :liked_tweets, through: :likes, source: :tweet

   def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
   end
end
