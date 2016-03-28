class AddDefaultToSoldAmount < ActiveRecord::Migration
  def change
  	change_column :ticket_types, :sold_amount, :integer, :default => 0
  end
end
