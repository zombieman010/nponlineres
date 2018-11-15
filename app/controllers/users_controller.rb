class UsersController < ApplicationController
  before_action :reg_user, only: [:show, :update, :edit]

  attr_accessor :name, :email

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
    redirect_to @user
    flash[:success] = "Profile updated!"
  end

  private

  def admin?
    current_user.admin == true
  end

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
