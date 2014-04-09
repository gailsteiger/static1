class AnswerResource < ActiveRecord::Base
  belongs_to :answer
  belongs_to :resource

  attr_accessible :answer, :resource
end
