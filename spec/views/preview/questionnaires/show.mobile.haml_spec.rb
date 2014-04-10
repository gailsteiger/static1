require 'spec_helper'

describe 'preview/questionnaires/show.mobile.haml' do
  before(:each) do
    Result.create score_min: 0, score_max: 0
    @questionnaire = Questionnaire.create
  end


  it 'check for some css' do
    render
    rendered.should have_css('#page')
    rendered.should have_css('.main-box')
  end

  it 'should have @2x logo' do
    pending
    #render
    #Does not check for css background-image: url
    #rendered.should have_css("img[src*='nhsLogoSm@2x.png']")
  end
end