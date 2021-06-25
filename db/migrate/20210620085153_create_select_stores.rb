class CreateSelectStores < ActiveRecord::Migration[6.1]
  def change
    create_table :select_stores do |t|
      t.string :user_id
      t.string :store_id
      t.string :name
      t.string :logo
      t.string :url
      t.timestamps
    end
  end
end
