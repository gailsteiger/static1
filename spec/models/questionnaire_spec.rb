require 'spec_helper'

describe Questionnaire do
  context '#next_question' do
    let(:questionnaire) { Questionnaire.create }
    let(:question) { Question.create(title: 'Test question', row_order: 1) }
    let(:next_question) { Question.create(title: 'Test question', row_order: 2) }

    it 'returns the first question when the questionnaire starts' do
      question.reload
      questionnaire.next_question.should == question
    end

    it 'returns the next question if previous question order is given' do
      question.reload
      next_question.reload
      questionnaire.next_question(1).should == next_question
    end

    it 'returns nil if there are no more questions' do
      question.reload
      next_question.reload
      questionnaire.next_question(2).should be_nil
    end
  end

  context '#previous_question?' do
    let(:questionnaire) { Questionnaire.create }
    let(:question) { Question.create(title: 'Test question', row_order: 1) }
    let(:next_question) { Question.create(title: 'Test question', row_order: 2) }

    before(:each) do
      question.reload
      next_question.reload
    end

    it 'returns false if it is the first question' do
      questionnaire.previous_question?(question.row_order).should be_false
    end

    it 'returns true if there is a previous question' do
      questionnaire.previous_question?(next_question.row_order).should be_true
    end
  end

  context '#score' do
    let(:question) { Question.create(title: 'Test question', row_order: 1) }
    let(:answer) { Answer.create(title: 'Yes', score: 4) }
    let(:questionnaire) { Questionnaire.create }

    it 'returns the score for the questionnaire' do
      questionnaire.responses.create(question: question, answer: answer)
      questionnaire.save!
      questionnaire.score.should == 4
    end
  end
end
