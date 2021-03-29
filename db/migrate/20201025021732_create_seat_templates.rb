class CreateSeatTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_templates do |t|
      t.string  :seat_key
      t.integer :number, array: true, default: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      t.string  :seat_type
      t.float   :price, default: 0.0

      t.timestamps
    end
  end
end
