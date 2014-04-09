class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :resources, :through => :answer_resources
  has_many :answer_resources

  attr_accessible :title, :score, :question, :resources, :resource_ids

  def resource_external_ids
    resources.map(&:external_id).uniq.join(', ')
  end
end
