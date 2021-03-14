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
end
