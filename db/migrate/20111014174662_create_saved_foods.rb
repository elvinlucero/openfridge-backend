
class CreateSavedFoods < ActiveRecord::Migration
  def self.up
    create_table :saved_foods do |t|
      t.string :desc
      t.integer :offset
      t.references :user

      t.timestamps
    end
  end

  def self.change
    create_table :saved_foods do |t|
      t.string :desc
      t.integer :offset
      t.references :user

      t.timestamps
    end
    add_index :saved_foods, :user

  end

  def self.down
    drop_table :saved_foods
  end
end
