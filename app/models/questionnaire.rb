class Questionnaire < ActiveRecord::Base
  has_many :responses
  has_many :answers, through: :responses
  has_many :resources, through: :answers

  attr_accessible :title

  def next_question(current=nil)
    return Question.first if current.nil?
    Question.where(row_order: current + 1).first
  end

  def score
    answers.to_a.sum(&:score)
  end

  def previous_question?(current)
    questions = Question.all
    questions.select {|q| q.row_order < current}.any?
  end

  def previous_question(current)
    Question.where(row_order: current - 1).first
  end

  def grouped_resources
    group = responses.map do |response|
      {question: response.question, category: response.question.category, resources: response.answer.resources}
    end
    return [] if group.empty?

    group.reject! {|r| r[:resources].empty?}
    return [] if group.nil? || group.empty?

    grouped = []
    group.each do |response|
      existing = grouped.select {|r| r.category == response[:category]}
      if existing.any?
        existing.first.resources << response[:resources]
        existing.first.resources.flatten!
      else
        grouped << GroupedResponse.new(response[:question], response[:category], response[:resources])
      end
    end
    grouped
  end
end

class GroupedResponse
  attr_accessor :question, :category, :resources

  def initialize(question, category, resources)
    @question = question
    @category = category
    @resources = resources
  end
end
