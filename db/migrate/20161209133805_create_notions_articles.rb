class CreateNotionsArticles < ActiveRecord::Migration
  def change
    create_table :notions_articles do |t|
      t.references :notion, foreign_key: true
      t.references :article, foreign_key: true
    end
  end
end
