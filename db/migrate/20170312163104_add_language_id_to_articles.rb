class AddLanguageIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :language_id, :integer
  end
end
