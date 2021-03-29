class CreateScreeningDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :screening_details do |t|
      t.belongs_to :movie
      t.belongs_to :screen
      t.belongs_to :time_slot

      t.timestamps
    end
  end
end
