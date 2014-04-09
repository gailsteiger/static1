class CreateAnswerResources < ActiveRecord::Migration
  def change
    create_table :answer_resources do |t|
      t.integer :answer_id
      t.integer :resource_id
      t.timestamps
    end

    remove_column :resources, :answer_id
  end
end
