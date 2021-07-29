class ItemsAddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :price, :float
    add_column :items, :dispatch, :string
    add_column :items, :destination, :string
  end
end
