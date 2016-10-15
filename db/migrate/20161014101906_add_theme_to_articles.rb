class AddThemeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :theme, :string
  end
end
