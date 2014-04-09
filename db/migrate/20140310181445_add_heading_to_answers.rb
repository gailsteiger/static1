class AddHeadingToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :heading, :string
  end
end
