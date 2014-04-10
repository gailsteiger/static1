require 'spec_helper'

describe 'preview/questionnaires/show.html.haml' do
  before(:each) do

    @questions = [
        {title: "Do you regularly lay awake in bed at night worrying how you\'re going to pay your bills?", order: 1},
        {title: "How often do you feel plagued by worry about your debts?", order: 2}
    ]
    @answers = [
        {title: "yes", score: 3, resource: {title: "Example", type: 'url', url: "http://example.com"}},
        {title: "no", score: 2, resource: {title: "Test", type: 'url', url: "http://example.com"}},
        {title: "maybe", score: 1, resource: {title: "Test", type: 'url', url: "http://example.com"}}
    ]



  end

  it 'questionnaires/show.html.haml' do
    pending
  end

  it 'check for some css' do
    render
    view.content.should have_css('#page')
    view.content.should have_css('h1.title-window')
  end
end