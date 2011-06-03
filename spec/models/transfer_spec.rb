require 'spec_helper'

describe Transfer do

  before(:each) do 
    @account = Factory(:account)
    @attr = { 
      :booking_account =>		123456,
      :booking_date	=>			Time.mktime(2011, 1, 1),
      :value_date =>			Time.mktime(2011, 1, 1),
      :booking_text	=>			"booking text",
      :reason_for_payment =>	"reason for payment",
      :recipient =>				"recipient",
      :recipient_account =>		456789,
      :recipient_bank_number =>	"4567890",
      :value =>					98,
      :currency	=>				"EUR",
      :info	=>					"info"
    }
  end

  it "should create a new instance given valid attributes" do 
    @account.transfers.create!(@attr)
  end

  describe "account associations" do 
    before(:each) do 
      @transfer = @account.transfers.create(@attr)
    end

    it "should have an account attribute" do 
      @transfer.should respond_to(:account)
    end

    it "should have the right associated account" do 
      @transfer.account_id.should == @account.id
      @transfer.account.should == @account
    end
  end
  

  describe "validations" do 

    it "should require an account id" do 
      Transfer.new(@attr).should_not be_valid
    end

    it "should require a booking account" do 
      @account.transfers.build(:booking_account => " ").should_not be_valid
    end

    it "should require a booking date" do 
      @account.transfers.build(:booking_date => " ").should_not be_valid
    end

    it "should require a booking text" do 
      @account.transfers.build(:booking_text => " ").should_not be_valid
    end

    it "should require a recipient" do 
      @account.transfers.build(:recipient => " ").should_not be_valid
    end

    it "should require a recipient account" do 
      @account.transfers.build(:recipient_account => " ").should_not be_valid
    end

    it "should require a recipient bank number" do 
      @account.transfers.build(:recipient_bank_number => " ").should_not be_valid
    end

    it "should require a value" do 
      @account.transfers.build(:value => " ").should_not be_valid
    end

    it "should require a currency" do 
      @account.transfers.build(:currency => " ").should_not be_valid
    end
  end

end
