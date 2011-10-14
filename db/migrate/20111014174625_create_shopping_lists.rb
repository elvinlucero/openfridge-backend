class CreateShoppingLists < ActiveRecord::Migration
  def self.up
    create_table :shopping_lists do |t|
      t.string :desc
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :shopping_lists
  end
end
