class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :fan_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
