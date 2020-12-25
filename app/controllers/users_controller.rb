class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザ登録が完了しました"
      redirect_to(user_path(@user.id))
    else
      render(:new)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] ="ユーザ情報を編集しました"
      redirect_to(user_path)
    else
      render(:edit)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to(users_path)
  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to(reviews_path)
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render(:login_form)
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] =
    redirect_to("/login")
  end
end
