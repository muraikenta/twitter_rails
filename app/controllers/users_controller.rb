class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update, :edit_password, :update_password]
  before_action :forbid_login_user, only: [:new, :create, :login_form, :login]
  before_action :ensure_correct_user, only: [:edit, :update, :edit_password, :update_password]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = @user.likes
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:title],
      email: params[:email],
      password: BCrypt::Password.create(params[:password]),
      image: '/images/default_user.jpg'
    )

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to "/users/#{@user.id}"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    file = params[:image]
    if file
      @user.image = "/user_images/#{SecureRandom.urlsafe_base64}.png"
      File.binwrite("public#{@user.image}", file.read)
    end

    if @user.save
      flash[:notice] = 'アカウント情報を編集しました'
      redirect_to "/users/#{@user.id}"
    else
      render 'edit'
    end
  end

  def edit_password
  end

  def update_password
    @user = User.find_by(id: params[:id])
    if BCrypt::Password.new(@user.password).is_password?(params[:current_password])
      @user.password = BCrypt::Password.create(params[:new_password])
      @user.save
      flash[:notice] = 'パスワードを変更しました'
      redirect_to "/users/#{@user.id}"
    else
      @error_message = 'パスワードが違います'
      render 'edit_password'
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && BCrypt::Password.new(@user.password).is_password?(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to "/users/#{@user.id}"
    else
      @email = params[:email]
      @password = params[:password]
      @error_message = 'メールアドレスかパスワードに間違いがあります'
      render 'login_form'
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to '/login'
  end

  private

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = '権限がありません'
      redirect_to '/posts/index'
    end
  end
end
