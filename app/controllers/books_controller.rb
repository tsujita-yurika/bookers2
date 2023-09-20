class BooksController < ApplicationController

  def index
    @user = current_user
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end