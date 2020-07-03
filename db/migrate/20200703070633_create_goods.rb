class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.text :description

      t.timestamps
    end
  end
end
