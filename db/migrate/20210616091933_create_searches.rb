class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :place
      t.string :budget
      t.string :style
      t.string :age
      t.string :personality
      t.string :color
      t.string :number 
      t.string :sleep
      t.string :season
      
      t.timestamps
    end
  end
end
