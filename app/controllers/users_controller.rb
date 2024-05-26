class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  def index
     @users = User.all
     @book = Book.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is _matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_show_path
    end
  end
end
