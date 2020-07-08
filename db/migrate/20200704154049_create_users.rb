class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :auth_sch_id
      t.integer :room_number

      t.timestamps
    end
  end
end
