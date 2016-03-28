class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :onwer_id
      t.integer :type_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
