class AddContentTopics < ActiveRecord::Migration[6.0]
  def change
    change_table :topics do |t|
        t.text :description 
    end
  end
end
