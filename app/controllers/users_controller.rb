class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def edit
    @user = current_user
  end
    
  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user)
  end
  
  def index
    @user = current_user
    @users = User.page(params[:id])
    @book = Book.new
  end
  
  def destroy
    reset_session
    flash[:notice] = "Signed out successfully."
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_show_path
    end
  end
end
