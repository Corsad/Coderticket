class AddSoldAmountToTicketType < ActiveRecord::Migration
  def change
    add_column :ticket_types, :sold_amount, :integer
  end
end
