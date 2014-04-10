require 'spec_helper'

describe 'preview/index.mobile.haml' do


  context 'displays on a Tablet' do

    it 'should render MASlogo' do
      render
      rendered.should have_css("img[src*='MAS_logo_lg.png']")
    end

    it 'check for some css' do
      render
      rendered.should have_css('#page')
      rendered.should have_css('.main-box')
    end
  end


  context 'displays on a Smartphone' do
    before (:each) do
      Capybara.current_driver = :iphone
      page.driver.browser.manage.window.resize_to(100,200) if page.driver.browser.respond_to? 'manage'
    end

    it 'should NOT render MASlogo' do
      render
      puts Capybara.current_driver
      rendered.should_not have_css("img[src*='MAS_logo_lg.png']")

    end

    it 'check for some css' do
      render
      rendered.should have_css('#page')
      rendered.should have_css('.main-box')
    end
  end
end

