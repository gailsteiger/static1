require 'spec_helper'

module Preview
  describe QuestionnairesController do
    context 'POST create' do
      it 'creates a new questionnaire' do
        Questionnaire.all.should be_empty
        post :create
        Questionnaire.all.should_not be_empty
      end
    end

    context 'GET show' do
      let(:questionnaire) { Questionnaire.create }
      let(:question) { Question.create(title: 'Test question', order: 1) }

      it 'finds the questionnaire' do
        Questionnaire.should_receive(:find).with('12') { questionnaire }
        get :show, id: 12
        assigns(:questionnaire).should == questionnaire
      end

      it 'assigns the opening question' do
        question.reload
        Questionnaire.stub(:find) { questionnaire }
        get :show, id: 12
        assigns(:question).should == question
      end
    end

    context 'POST continue' do
      let(:questionnaire) { Questionnaire.create }
      let(:question) { Question.create(title: 'Test question', order: 1) }
      let(:answer) { Answer.create(title: 'Test answer', question: question) }

      it 'creates a response for the answer given' do
        Questionnaire.stub(:find) { questionnaire }
        post :continue, questionnaire_id: 12, answer: answer.id
        questionnaire.reload
        questionnaire.responses.should_not be_empty
      end
    end
  end
end
