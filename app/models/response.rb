class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer

  validates :answer, presence: true
  validates :question, presence: true

  attr_accessible :question, :answer
end
