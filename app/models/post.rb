class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :title, presence: true, length: { maximum: 30 }
  validates :content,presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :liked_user, through: :favorites, source: :user
end
