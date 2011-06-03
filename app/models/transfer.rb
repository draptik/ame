# == Schema Information
# Schema version: 20110603064043
#
# Table name: transfers
#
#  id                    :integer         not null, primary key
#  account_id            :integer
#  booking_account       :integer
#  booking_date          :date
#  value_date            :date
#  booking_text          :string(255)
#  reason_for_payment    :string(255)
#  recipient             :string(255)
#  recipient_account     :integer
#  recipient_bank_number :string(255)
#  value                 :decimal(, )
#  currency              :string(255)
#  info                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Transfer < ActiveRecord::Base

  belongs_to :account

  validates :account_id, :presence => true
  validates :booking_account, :presence => true
  
  default_scope :order => 'transfers.booking_date DESC'
end
