class AddContentUsers < ActiveRecord::Migration[6.0]
    def change
        change_table :users do |t|
            t.text :description 
        end
      end
    end
