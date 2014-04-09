class RemoveResourceFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :resource, :string
  end
end
