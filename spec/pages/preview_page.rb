class PreviewPage < SitePrism::Page
  set_url "/preview"

  element :start, 'a.start-button'

  def start_questionnaire
    start.click
  end
end
