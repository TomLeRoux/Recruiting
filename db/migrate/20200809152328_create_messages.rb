class CreateMessages < ActiveRecord::Migration[6.0]
    def change
        create_table :messages do |t|
            t.integer :topicId
            t.text :content
            t.string :owner
            t.timestamps
        end
    end
end
