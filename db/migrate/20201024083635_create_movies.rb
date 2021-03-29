class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string  :name
      t.string  :description
      t.string  :certificate
      t.integer :duration
      t.string  :star_cast
      t.date    :release_date

      t.timestamps
    end
  end
end
