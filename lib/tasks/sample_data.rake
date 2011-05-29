require 'faker'

namespace :db do

  ## Usage: rake db:populate
  desc "Fill database with sample data"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke

    admin = User.create!(:name => "Example User", :email => "example@example.org",
                         :password => "foobar", :password_confirmation => "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.org"
      password = "password"
      User.create!(:name => name, :email => email,
                   :password => password, :password_confirmation => password)
    end

    User.all(:limit => 3).each do |user|
      5.times do |n|
        user.accounts.create!(:name => "Account #{n}",
                              :bank_number => "12345678",
                              :account_number => 123456)
      end
      
    end
  end		
end

