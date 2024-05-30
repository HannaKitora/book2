class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.page(params[:page])
      render :show
    end
  end

  def index
    @books = Book.page(params[:page])
    @book = Book.new
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @user = current_user
    flash[:notice] = "You have updated book successfully."
    redirect_to books_path(@book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
    
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end