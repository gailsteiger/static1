class ChangeOrderToRowOrderInQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :order
    add_column :questions, :row_order, :integer, default: 0
  end
end
