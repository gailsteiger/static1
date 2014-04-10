require 'spec_helper'

describe 'preview/questionnaires/show.html.haml' do
  before(:each) do
    Result.create score_min: 0, score_max: 0
    @questionnaire = Questionnaire.create
  end


  it 'check for some css' do
    render
    rendered.should have_css('#page')
    rendered.should have_css('h1.title-window')
  end
end