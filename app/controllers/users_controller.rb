class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @books = Book.all
  end

  def show
    @user = current_user
    @books = Book.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
