class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @user = current_user
    @books = Book.all
  end

  def edit
  end

  def create
    @book = Book.new(book_params) # 引数
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end