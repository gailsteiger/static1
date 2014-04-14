class Admin::QuestionsController < ApplicationController
  layout 'admin'

  def new
    @question = Question.new
    @question.answers.build
    @resources = Resource.all
    @answers = Answer.all
  end

  def create
    @question = Question.create(params[:question])
    redirect_to root_path, notice: 'Question created'
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Question deleted'
  end

  def edit
    @question = Question.find(params[:id])
    @resources = Resource.all
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    remove_resources
    add_resources
    update_category
    redirect_to root_path, notice: 'Question updated'
  end

  def sort
    @question = Question.find(params[:id])

    @question.update_attributes(row_order_position: params[:ordering][:row_order_position].to_i - 1)

    render nothing: true
  end

  private

  def update_category
    params[:question][:answers_attributes].each do |k, v|
      a = Answer.find(v[:id])
      a.category_id = v[:category_id]
      a.save
    end
  end

  def remove_resources
    params[:question][:answers_attributes].each do |k, v|
      a = Answer.find(v[:id])
      existing = a.resources.map(&:external_id)
      remove = existing - v[:resource_external_ids].split(', ')
      remove.each do |id|
        next if id.blank?
        resource = Resource.where(:external_id => id).first
        next if resource.nil?
        a.resources.delete(resource) if a.resources.include?(resource)
      end
    end
  end

  def add_resources
    params[:question][:answers_attributes].each do |k, v|
      a = Answer.find(v[:id])
      v[:resource_external_ids].split(', ').each do |id|
        next if id.blank?
        resource = Resource.where(:external_id => id).first
        next if resource.nil?
        unless a.resources.include?(resource)
          a.resources << resource
        end
      end
    end
  end
end
