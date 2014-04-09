class AddScoreToResources < ActiveRecord::Migration
  def change
    add_column :resources, :score, :integer, default: 0
  end
end
