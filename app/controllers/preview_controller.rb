class PreviewController < ApplicationController
  after_action :allow_iframe

  def index
    @question = Question.rank(:row_order).first
  end

  private
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
