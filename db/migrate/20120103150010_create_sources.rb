class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :codename
      t.float :supply_quantity

      t.timestamps
    end
  end
end
