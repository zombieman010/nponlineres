class UsersController < ApplicationController
  before_action :reg_user, only: [:show, :update, :edit]

  attr_accessor :name, :email

  def index
    if logged_in?
      if admin?
        @users = User.all
      end
    else
      redirect_to root_path
    end
  end

  def show
    @user = current_user
  end

  def new
    if logged_in?
      if admin?
        @user = User.new
      else
        redirect_to current_user
        flash[:danger] = current_user.name + " ,you must be admin to create an account!"
      end
    else
      redirect_to root_path
      flash[:danger] = "Must be admin to create an account!"
    end
  end

  def create
    if admin?
      @user = User.new(users_params)
      if @user.save
        redirect_to root_path
        flash[:success] = "User created: " + @user.name
      else
        render 'new'
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(edit_params)
    flash[:success] = "Profile updated!"
  end

  def destroy
    if admin?
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
      flash[:success] = @user.name + " has been deleted!"
    end
  end

  def admin?
    current_user.admin == true
  end

  private



  def reg_user
    current_user.admin == false
  end

  def users_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def edit_params
    params.require(:user).permit(:name)
  end

end
