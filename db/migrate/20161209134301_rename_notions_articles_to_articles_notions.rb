class RenameNotionsArticlesToArticlesNotions < ActiveRecord::Migration
  def change
    rename_table :notions_articles, :articles_notions
  end
end
