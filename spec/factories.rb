Factory.define :user do |user|
  user.name                  "Patrick Drechsler"
  user.email                 "patrick@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :account do |account|
  account.name 				"default account"
  account.account_number 	123456
  account.bank_number 		"456789"
  account.association :user
end

Factory.define :transfer do |transfer|
  transfer.booking_account 			123456
  transfer.booking_date				Time.mktime(2011,1,1)
  transfer.value_date				Time.mktime(2011,1,1)
  transfer.booking_text				"booking text"
  transfer.reason_for_payment		"reason for payment"
  transfer.recipient				"recipient"
  transfer.recipient_account		456789
  transfer.recipient_bank_number	"4567890"
  transfer.value					98
  transfer.currency					"EUR"
  transfer.info						"info"
  transfer.association :account
end
