class AddCategoryIdToQuestions < ActiveRecord::Migration
  def change
    remove_column :answers, :category_id
    add_column :questions, :category_id, :integer
  end
end
