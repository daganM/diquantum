class AddIntroductionIdInNotion < ActiveRecord::Migration
  def change
    add_column :notions, :introduction_id, :integer
  end
end
