class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :body
      t.text :intro
      t.integer :score_min
      t.integer :score_max
      t.timestamps
    end
  end
end
