class CreateQuestionnaire < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.timestamps
    end
  end
end
