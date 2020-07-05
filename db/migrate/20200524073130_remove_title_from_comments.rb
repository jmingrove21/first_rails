class RemoveTitleFromComments < ActiveRecord::Migration[6.0]
  def change

    remove_column :comments, :title, :string #if table_exists?(:comments) && column_exists?(:comments, :title)
  end
end
