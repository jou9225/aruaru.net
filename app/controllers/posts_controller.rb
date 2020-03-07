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
    
    if search_params[:text] && search_params[:category_id].present?
     @posts = Post.where(category_id: search_params[:category_id]).where(['title LIKE ? OR content LIKE ?', "%#{search_params[:text]}%", "%#{search_params[:text]}%"]).order(params[:sort]).page(params[:page]).per(25)
    elsif search_params[:category_id].present?
     @posts = Post.where(category_id: search_params[:category_id]).order(params[:sort]).page(params[:page]).per(25)
    elsif search_params[:text].present?
     @posts = Post.where(['title LIKE ? OR content LIKE ?', "%#{search_params[:text]}%", "%#{search_params[:text]}%"]).order(params[:sort]).page(params[:page]).per(25)
    else
     @posts = Post.all.order(params[:sort]).page(params[:page]).per(25)
    end
  end
  
  
  private
    
  def post_params
    params.require(:post).permit(:title, :content,[:category_id])
  end
  
  def search_params
    params.fetch(:search,{}).permit(:text,:sort,[:category_id])
  end
  
end
