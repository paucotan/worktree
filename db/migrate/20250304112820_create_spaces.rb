class CreateSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :price_per_hour
      t.integer :price_per_day
      t.integer :capacity
      t.boolean :availability_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
