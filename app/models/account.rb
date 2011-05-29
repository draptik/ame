class Account < ActiveRecord::Base

  attr_accessible :account_number, :bank_number, :name

  belongs_to :user

  validates :user_id, 			:presence => true
  validates :account_number, 	:presence => true, :length => { :within => 6..20 }
  validates :bank_number, 		:presence => true, :length => { :within => 6..20 }
  validates :name, 				:presence => true, :length => { :within => 2..80 }

  # Default sort order...
  default_scope :order => 'accounts.created_at DESC'

end
