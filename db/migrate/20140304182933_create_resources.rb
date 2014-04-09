class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :title
      t.string :resource_type
      t.integer :answer_id
    end
  end
end
