class CreateSinks < ActiveRecord::Migration
  def change
    create_table :sinks do |t|
      t.string :name
      t.string :codename
      t.float :demand_quantity

      t.timestamps
    end
  end
end
