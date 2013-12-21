Then(/^the page should be titled "(.*?)"$/) do |title|
  page.source.should have_title title
end

When(/^the page should have a ([^"]*) tag for "([^"]*)"$/) do |tag, content|
  page.should have_selector("#{tag}[name='#{content}']", visible: false)
end

When(/^the page should include ([^"]*) for ([^"]*)$/) do |tag, content|
  case tag
    when 'script'then
      case content
       when 'Google Analytics' then page.should have_xpath("//script[text()[contains(.,'GoogleAnalyticsObject')]]", visible: false)
      end
    when 'css' then page.should have_xpath("//link[contains(@href, '#{content}')]", visible: false)
    when 'js' then page.should have_xpath("//script[contains(@src, '#{content}')]", visible: false)

  end
end