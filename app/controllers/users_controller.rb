class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def show
  end

  def edit
  end
end
