class ApplicantsController < ApplicationController
before_action :authenticate_user!
  
  def new #用來處理註冊頁面
    @user = User.new 
  end

  def create #用來儲存註冊資訊。create中，使用的方式都是post 
    @user = User.create(user_params) 
    if @user.save 
      redirect_to :sessions_new 
    else 
      render "new"
    end 
  end

  private 
  def user_params 
    params.require(:user).permit(:name, :password, :password_confirmation) 
  end
end
