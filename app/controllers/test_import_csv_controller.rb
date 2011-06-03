class TestImportCsvController < ApplicationController

  require 'csv'

  def import

  end

  def upload
    csv_file = params[:upload][:csv]

    error_counter = 0
    transfers_from_csv = []

    CSV.new(csv_file.tempfile, {:headers => true, :col_sep => ";"}).each do |row|
      transfer = parse_transfer(row)

      if transfer.invalid?
        error_counter = error_counter + 1
      end

      transfers_from_csv << transfer
    end

    if error_counter > 0
      flash[:error] = "transfer not saved. there were #{error_counter} errors."
    else
      save_transfers(transfers_from_csv)
    end
  end



  def parse_transfer(row)
    value_date = Date.strptime(row[2], "%d.%m.%y")
    booking_date = Date.strptime(row[1] + "." + value_date.year.to_s, "%d.%m.%Y")
      
    Transfer.new(:account_id => 1,
                 :booking_account => row[0],
                 :booking_date => booking_date,
                 :value_date => value_date,
                 :booking_text => row[3],
                 :reason_for_payment => row[4],
                 :recipient => row[5],
                 :recipient_account => row[6],
                 :recipient_bank_number => row[7],
                 :value => row[8],
                 :currency => row[9],
                 :info => row[10])
  end

  def save_transfers(transfers_from_csv)
    transfers_from_csv.each do |transfer| 
      if transfer.save
        flash[:success] = "transfer saved."
      else
        flash[:error] = "transfer not saved."
      end
    end
  end

end
