class AdminController < ApplicationController
  layout 'admin'

  def dashboard
    @questions = Question.rank(:row_order).all
    @resources = Resource.all
    @results = Result.all
  end

end
