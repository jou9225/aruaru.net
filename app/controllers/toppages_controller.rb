class ToppagesController < ApplicationController
  def index
    @posts1 = Post.order(id: :desc).first(3)
    @posts2 = Post.select('posts.*', 'count(favorites.id) AS favs').left_joins(:favorites).group('posts.id').order('favs desc').first(10)
  end
end
