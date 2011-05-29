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
