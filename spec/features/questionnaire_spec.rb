require 'spec_helper'

describe "Questionnaire"  do
  context 'preview tool' do
    before(:each) do
      QuestionBuilder.build({
        questions: [
          {title: "Do you regularly lay awake in bed at night worrying how you’re going to pay your bills?", order: 1},
          {title: "How often do you feel plagued by worry about your debts?", order: 2}
        ],
        answers: [
          {title: "yes", score: 3, resource:{title: "Example", type: 'url', url: "http://example.com"}},
          {title: "no", score: 1, resource: {title: "Test", type: 'url', url: "http://example.com"}}
        ]
      })
    end

    def answer_question
      @preview = PreviewPage.new
      @question = QuestionnairePage.new

      @preview.load
      @preview.start_questionnaire
      @question.answer_question
    end

    it 'gathers the users scores from answers to questions' do
      answer_question
      Questionnaire.last.score.should_not be_zero
    end

    it 'allows the user to navigate to previous questions' do
      answer_question
      @question.click_previous
      page.should have_content(Question.first.title)
    end

    it 'gives the user a list of resources based on the answers given' do
      answer_question
      Questionnaire.last.resources.should_not be_empty
    end
  end
end
