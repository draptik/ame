class AccountsController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => [:destroy, :show]

  def show
  end

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
    @account.destroy
    # TODO Maybe change redirect destination
    redirect_to root_path, :flash => { :success => "Account deleted!" }
  end


  # PRIVATE =============================================================
  private

  def authorized_user
    @account = Account.find(params[:id])
    redirect_to root_path unless current_user?(@account.user)
  end

end
