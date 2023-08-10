class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def create
    @user = User.new(params.require(:user).permit(:email, :password, :name, :email, :profile, :occupation, :position))
    @user.save
    redirect_to users_path
  end

  def index
    @user = User.new
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @prototype = @user.prototypes
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end


end
