class ChangeColumnBodyOnCritic < ActiveRecord::Migration[6.0]
  def up
    change_column :critics, :body, :text
  end
 
  def down
    change_column :critics, :body, :string
  end
end
