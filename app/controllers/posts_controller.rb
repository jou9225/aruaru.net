class PostsController < ApplicationController
  
  
  def new
    if user_signed_in?
      @post = current_user.posts.build
    else
      redirect_to new_user_session_path
    end
    
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'あるあるを投稿しました。'
      redirect_to @post
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'posts/new'
    end
    
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
  end
  
  private
    
  def post_params
    params.require(:post).permit(:title, :content,[:category_id])
  end
  
end
