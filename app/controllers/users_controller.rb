class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]
  before_action :forbid_login_user, only: [:new, :create, :login_form, :login]
  before_action :ensure_correct_user, only: [:edit, :update]

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
    @user = User.new(create_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザ登録が完了しました"
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      flash[:notice] ="ユーザ情報を編集しました"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to users_path
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to reviews_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_url
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to reviews_path
    end
  end

  private
  def create_params
    params
      .require(:user)
      .permit(
        :name,
        :email,
        :password
      )
  end

  def update_params
    params
      .require(:user)
      .permit(
        :name,
        :email
      )
  end
end
