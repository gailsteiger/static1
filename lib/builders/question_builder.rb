class QuestionBuilder
  def self.build(params)
    new(params).build
  end

  def initialize(params)
    @questions = params[:questions]
    @answers = params[:answers]
  end

  def build
    @questions.each do |question|
      question = build_question(question)
      build_answers_for(question)
    end
  end

  def build_question(question)
    Question.create!(title: question[:title], row_order: question[:order])
  end

  def build_answers_for(question)
    @answers.each do |answer|
      Answer.create!(
        title: answer[:title],
        question: question,
        score: answer[:score],
        resources: [Resource.new(
          title: answer[:resource][:title],
          url: answer[:resource][:url],
          resource_type: answer[:resource][:type]
        )]
      )
    end
  end
end
