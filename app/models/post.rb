class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :title, presence: true, length: { maximum: 30 }
  validates :content,presence: true, length: { maximum: 255 }
end
