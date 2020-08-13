class AddUseridMessage < ActiveRecord::Migration[6.0]
    def change
        change_table :messages do |t|
            t.integer :userId 
        end
    end
end
