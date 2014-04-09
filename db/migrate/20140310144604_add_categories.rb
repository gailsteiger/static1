class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps
    end

    add_column :answers, :category_id, :integer
  end
end
