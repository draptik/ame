# == Schema Information
# Schema version: 20110529180905
#
# Table name: accounts
#
#  id             :integer         not null, primary key
#  account_number :integer
#  bank_number    :string(255)
#  name           :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Account < ActiveRecord::Base

  attr_accessible :account_number, :bank_number, :name

  belongs_to :user

  validates :user_id, 			:presence => true
  validates :bank_number, 		:presence => true, :length => { :within => 6..20 }
  validates :name, 				:presence => true, :length => { :within => 2..80 }
  validates :account_number, 	:presence => true, :length => { :within => 6..20 }

  # Default sort order...
  default_scope :order => 'accounts.created_at DESC'

end
