class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
        # １. データを受け取り新規登録するためのインスタンス作成
    @newuser = User.new(user_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @user.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:error] = "user was error create"
      render :edit
    end
  end

   def create
    # １. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Signed in successfully."
      redirect_to  user_path(current_user)
    else
      render :top
    end
   end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
