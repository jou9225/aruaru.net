class ApplicationController < ActionController::Base
      before_action :configure_permitted_parameters, if: :devise_controller?

  def counts(user)
    @count_posts = user.posts.count
    @count_favorites = user.favorites.count
  end
  
  def counts(favorites)
    @count_favorites_post = post.favorites.count
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
