class AddResourceToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :resource, :string
  end
end
