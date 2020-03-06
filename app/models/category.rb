class Category < ApplicationRecord
  has_many :posts
  self.inheritance_column = :_type_disabled
end
