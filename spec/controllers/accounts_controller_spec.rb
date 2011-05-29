require 'spec_helper'

describe AccountsController do 
  render_views

  describe "access control" do 

    it "should deny access to 'create'" do 
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do 
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end


  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :name => "" }
      end

      it "should not create a account" do
        lambda do
          post :create, :account => @attr
        end.should_not change(Account, :count)
      end

      it "should render the home page" do
        post :create, :account => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "Lorem ipsum", :bank_number => "123456", :account_number => 123456 }
      end

      it "should create an account" do
        lambda do
          post :create, :account => @attr
        end.should change(Account, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :account => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :account => @attr
        flash[:success].should =~ /account created/i
      end
    end
  end # POST 'create'


end