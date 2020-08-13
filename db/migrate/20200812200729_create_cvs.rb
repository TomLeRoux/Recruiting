class CreateCvs < ActiveRecord::Migration[6.0]
  def change
    create_table :cvs do |t|
      t.integer :userId
    end
  end
end
