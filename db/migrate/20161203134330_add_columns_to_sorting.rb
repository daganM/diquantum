class AddColumnsToSorting < ActiveRecord::Migration
  def change
    add_column :sortings, :notion_id, :integer
    add_column :sortings, :article_id, :integer
  end
end
