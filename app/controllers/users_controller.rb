class UsersController < ApplicationController
  attr_accessor :name, :email

  def show
    if current_user
      @user = User.find(params[:id])
      if is_admin?
        @admin_user = @user
      end
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    if @admin_user
    @user = User.new(users_params)
    if @user.save
      if @admin_user
        log_in @user
      end
      redirect_to root_path
      flash[:success] = "User created: " + @user.name
    else
      render 'new'
    end
    else
      redirect_to root_path
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  #Private method to determine if admin
  def is_admin?
   
  end
end
