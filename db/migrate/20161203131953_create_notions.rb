class CreateNotions < ActiveRecord::Migration
  def change
    create_table :notions do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
