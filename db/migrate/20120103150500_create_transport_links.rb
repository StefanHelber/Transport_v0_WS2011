class CreateTransportLinks < ActiveRecord::Migration
  def change
    create_table :transport_links do |t|
      t.integer :source_id
      t.integer :sink_id
      t.float :unit_cost
      t.float :transport_quantity

      t.timestamps
    end
  end
end
