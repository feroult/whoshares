class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.string :touch
      t.string :from

      t.timestamps
    end
  end
end
