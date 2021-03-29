class CreateJoinTableScreenSeatTemplates < ActiveRecord::Migration[5.2]
  def change
    create_join_table :screens, :seat_templates do |t|
      t.index [:screen_id, :seat_template_id]
      t.index [:seat_template_id, :screen_id]
    end
  end
end
