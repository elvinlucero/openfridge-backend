class CreateFridgeFoods < ActiveRecord::Migration
  def self.up
    create_table :fridge_foods do |t|
      t.string :desc
      t.date :expiration
      t.references :user

      t.timestamps
    end
  end

  def self.change
    create_table :fridge_foods do |t|
      t.string :desc
      t.date :expiration
      t.references :user

      t.timestamps
    end
    add_index :fridge_foods, :user

  end

  def self.down
    drop_table :fridge_foods
  end
end
