class CreateIntroductions < ActiveRecord::Migration
  def change
    create_table :introductions do |t|
      t.text :text
      t.integer :notion_id

      t.timestamps null: false
    end
  end
end
