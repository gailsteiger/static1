class Question < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  has_many :answers
  belongs_to :category
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessible :title, :row_order, :answers_attributes, :category_id, :heading, :row_order_position

  def current_position
    self.class.where("row_order < ?", row_order).count + 1
  end
end
