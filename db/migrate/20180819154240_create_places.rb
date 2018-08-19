class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :lat
      t.float :lng
      t.integer :owner_id
      t.string :city

      t.timestamps
    end
  end
end
