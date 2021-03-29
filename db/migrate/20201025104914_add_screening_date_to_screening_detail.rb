class AddScreeningDateToScreeningDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :screening_details, :screening_date, :date
  end
end
