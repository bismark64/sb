class CreateScratchers < ActiveRecord::Migration
  def change
    create_table :scratchers do |t|
      t.string :name
      t.string :size
      t.string :color
      t.string :cost

      t.timestamps
    end
  end
end
