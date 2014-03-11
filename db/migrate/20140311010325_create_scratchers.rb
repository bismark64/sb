class CreateScratchers < ActiveRecord::Migration
  def change
    create_table :scratchers do |t|

      t.timestamps
    end
  end
end
