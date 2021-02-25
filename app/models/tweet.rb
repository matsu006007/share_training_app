class Tweet < ApplicationRecord

  with_options presence: true do
    validates :content
    validates :genre_id
    validates :user
  end

end
