class CreateAccountsArticles < ActiveRecord::Migration
  def change
    create_table :accounts_articles do |t|
      t.references :account, foreign_key: true
      t.references :article, foreign_key: true
    end
  end
end
