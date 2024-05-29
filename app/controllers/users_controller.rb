class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to books_path(@user.id)
  end
  
  def index
    @user = current_user
    @users = User.page(params[:id])
    @book = Book.new
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
