class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :website
      t.string :geography
      t.integer :comments_count

      t.timestamps
    end
  end
end
