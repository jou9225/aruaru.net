class ToppagesController < ApplicationController
  def index
    @posts1 = Post.order(id: :desc).first(3)
    @posts2 = Post.top_popular.rand.limit(3)
    
    @categories = Category.all
  end
end
