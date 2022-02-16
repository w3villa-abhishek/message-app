class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :user, :user_id
  end
end
