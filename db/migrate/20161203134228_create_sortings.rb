class CreateSortings < ActiveRecord::Migration
  def change
    create_table :sortings do |t|

      t.timestamps null: false
    end
  end
end
