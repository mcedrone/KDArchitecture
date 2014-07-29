class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :category_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
