class GachasController < ApplicationController
  def index
  end

  def ikkai
    @post = Post.rand.first
  end

  def jukkai
    @posts = Post.rand.first(10)
  end


end
