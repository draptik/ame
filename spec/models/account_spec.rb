require 'spec_helper'

describe Account do

  before(:each) do 
    @user = Factory(:user)
    @attr = { :account_number => 123456, :bank_number => "567890", :name => "default account"  }
  end

  it "should create a new instance given valid attributes" do 
    @user.accounts.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @account = @user.accounts.create(@attr)
    end

    it "should have a user attribute" do 
      @account.should respond_to(:user)
    end

    it "should have the right associated user" do 
      @account.user_id.should == @user.id
      @account.user.should == @user
    end
  end

  describe "validations" do 

    it "should require a user id" do
      Account.new(@attr).should_not be_valid
    end

    it "should require a non-blank account number" do 
      @user.accounts.build(:account_number => " ").should_not be_valid
    end

    it "should require an integer account number" do 
      @user.accounts.build(:account_number => " ").should_not be_valid
    end
    it "should require a non-blank bank number" do 
      @user.accounts.build(:bank_number => " ").should_not be_valid
    end
    it "should require a non-blank name" do 
      @user.accounts.build(:name => " ").should_not be_valid
    end


  end
end
