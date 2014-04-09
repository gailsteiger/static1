class Admin::ResultsController < ApplicationController
  layout 'admin'

  def new
    @result = Result.new
  end

  def create
    @result = Result.create(params[:result])
    redirect_to root_path, notice: 'Result created'
  end

  def edit
    @result = Result.find(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    @result.update_attributes(params[:result])
    redirect_to root_path, notice: 'Result updated'
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    redirect_to root_path, notice: 'Result successfully remove'
  end
end
