class AddHeadingToQuestions < ActiveRecord::Migration
  def change
    remove_column :answers, :heading
    add_column :questions, :heading, :string
  end
end
