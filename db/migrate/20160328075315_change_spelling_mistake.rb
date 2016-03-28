class ChangeSpellingMistake < ActiveRecord::Migration
  def change
	rename_column :tickets, :onwer_id, :owner_id
  end
end
