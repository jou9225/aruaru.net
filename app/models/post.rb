class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :title, presence: true, length: { maximum: 30 }
  validates :content,presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :liked_user, through: :favorites, source: :user
  
  scope :post_sort, -> (sort)do
    if sort == 'new'
      return order('id desc')
    elsif sort == 'old'
      return order('id asc')
    elsif sort == 'popular'
      return select('posts.*', 'count(favorites.id) AS favcount').left_joins(:favorites).group('posts.id').order('favcount desc')
    elsif sort == 'unpopular'
      return select('posts.*', 'count(favorites.id) AS favcount').left_joins(:favorites).group('posts.id').order('favcount asc')
    end
  end
  
   
 
  


end
