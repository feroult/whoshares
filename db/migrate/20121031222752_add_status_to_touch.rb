class AddStatusToTouch < ActiveRecord::Migration
  def up
    add_column :touches, :status, :string
    Touch.update_all(:status => :never)
  end
  
  def down
    remove_column :touches, :status, :string
  end
end
