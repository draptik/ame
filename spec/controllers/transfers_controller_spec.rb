require 'spec_helper'

describe TransfersController do 
  render_views

  
  describe "access control" do 

    # it "should deny access to 'create'" do 
    #   post :create
    #   response.should redirect_to(signin_path)
    # end

    # it "should deny access to 'destroy'" do 
    #   delete :destroy, :id => 1
    #   response.should redirect_to(signin_path)
    # end

    it "should deny access to 'index'" do
      @user = Factory(:user)
      @account = Factory(:account, :user => @user)
      get :index, :account_id => @account
      response.should redirect_to(signin_path)
    end

    describe "GET 'index'" do 
      it "should show the index for a signed in user" do 
        @user = Factory(:user)
        @account = Factory(:account, :user => @user)
        @transfers = Factory(:transfer, :account => @account)
        test_sign_in(@user)
        get :index, :account_id => @account
        response.should have_selector('table', :class => "transfers")
      end
    end
  end


  
end
