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

    it "should require an integer account number" 

    it "should require a non-blank bank number" do 
      @user.accounts.build(:bank_number => " ").should_not be_valid
    end
    it "should require a non-blank name" do 
      @user.accounts.build(:name => " ").should_not be_valid
    end
  end

  describe "transfer associations" do 
    before(:each) do
      @account = @user.accounts.create(@attr)
      @transfer1 = Factory(:transfer, :account => @account, :booking_date => 1.day.ago)
      @transfer2 = Factory(:transfer, :account => @account, :booking_date => 1.hour.ago)
    end

    it "should have a transfers attribute" do 
      @account.should respond_to(:transfers)
    end

    it "should have the right transfers in the right order" do
      # puts "T1 account name #{@transfer1.account.name}"
      # puts "T2 account name #{@transfer1.account.name}"
      # puts "account name #{@account.name}"
      # puts "account transfers #{@account.transfers}"
      @account.transfers.should == [@transfer2,  @transfer1]
    end

    it "should destroy associated transfers" do 
      @account.destroy
      [@transfer1, @transfer2].each do |transfer|
        Transfer.find_by_id(transfer.id).should be_nil
      end
    end
  end
end
