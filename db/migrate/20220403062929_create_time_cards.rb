class CreateTimeCards < ActiveRecord::Migration[5.1]
  def change
    create_table :time_cards do |t|
      t.integer :year, limit: 2, null: false
      t.integer :month, limit: 1, null: false
      t.integer :day, limit: 1, null: false
      t.datetime :in_at
      t.datetime :out_at

      t.references :user, foreign_key: true
      
      t.timestamps
    end

    add_index :time_cards, [:user_id, :year, :month, :day], unique: true
  end
end
