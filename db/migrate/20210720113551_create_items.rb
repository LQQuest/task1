class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.float :length
      t.float :width
      t.float :height
      t.float :size
      t.float :weight
      t.timestamps
    end
  end
end
