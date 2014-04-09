class QuestionnairePage < SitePrism::Page
  set_url "/preview/questionnaire{/questionnaire_id}"
  elements :answers, "input[name='answer']"
  element :submit, ".submit-question"
  element :previous, ".previous-question"

  def answer_question
    page.all(:css, '[name=answer]').first.set(true)
    submit.click
  end

  def click_previous
    previous.click
  end
end
