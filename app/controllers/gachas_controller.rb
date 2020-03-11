class GachasController < ApplicationController
  def index
  end

  def ikkai
    @post = Post.offset( rand(Post.count) ).first
  end

  def jukkai
    @posts = Post.offset( rand(Post.count) ).first(10)
  end
end
