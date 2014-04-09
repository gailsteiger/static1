class Resource < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  has_many :answers, :through => :answer_resources
  has_many :answer_resources
  has_many :questions, :through => :answers
  attr_accessible :url, :title, :resource_type, :score, :external_id

  def short_title
    truncate(title, length: 50)
  end
end
