class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.integer :account_id
      t.integer :booking_account
      t.date :booking_date
      t.date :value_date
      t.string :booking_text
      t.string :reason_for_payment
      t.string :recipient
      t.integer :recipient_account
      t.string :recipient_bank_number
      t.decimal :value
      t.string :currency
      t.string :info

      t.timestamps
    end
    add_index :transfers, :account_id
  end

  def self.down
    drop_table :transfers
  end
end
