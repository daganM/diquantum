class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code
      t.string :int_title

      t.timestamps null: false
    end
  end
end
