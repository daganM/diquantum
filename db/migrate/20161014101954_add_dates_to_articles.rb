class AddDatesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :date_crea, :date
    add_column :articles, :date_modif, :date
  end
end
