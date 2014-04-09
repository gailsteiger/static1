class AddExternalIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :external_id, :string
  end
end
