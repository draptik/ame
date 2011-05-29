class AccountsController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @account = current_user.accounts.build(params[:account])
    if @account.save
      flash[:success] = "Account created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
    
  end
end
