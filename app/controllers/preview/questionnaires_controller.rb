class Preview::QuestionnairesController < ApplicationController
  after_action :allow_iframe
  respond_to :html, :js

  def create
    @questionnaire = Questionnaire.create
    redirect_to preview_questionnaire_path(@questionnaire)
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
    @question = @questionnaire.next_question
  end

  def email
    #if MAS::Mailer::Validator.valid?(params[:email])
        #MAS::Mailer::EmailVisionMessage.new(params[:email], "template-unique-id", "template-unique-token", {}).deliver
    #end

    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @question = nil
    @email = true
    render :show
  end

  def continue
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    answer = Answer.find_by_id(params[:answer])
    if @questionnaire.responses.map(&:question).flatten.include?(answer.question)
      question_response = @questionnaire.responses.select{|r| r.question == answer.question}.first
      question_response.update_attributes(answer: answer)
    else
      @questionnaire.responses.create(answer: answer, question: answer.question)
    end
    @question = @questionnaire.next_question(answer.question.row_order)
    respond_to do |format|
      format.html { render :show }
      format.js
      format.mobile { render :show }
    end
  end

  def previous
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @question = @questionnaire.previous_question(params[:current].to_i)
    @response = @questionnaire.responses.select{|r| r.question == @question}.first
    if @response.present?
      @answer = @question.answers.select {|a| a.title == @response.answer.title}.first
    end
    respond_to do |format|
      format.html { render :show }
      format.js
      format.mobile { render :show }
    end
  end

  private
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
