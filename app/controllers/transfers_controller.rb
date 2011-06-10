class TransfersController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user

  def create
  end

  def destroy
  end

  def index
  end


  # PRIVATE ==========================================
  private

  def authorized_user
    @account = Account.find(params[:account_id])
    redirect_to root_path unless current_user?(@account.user)
  end

end
