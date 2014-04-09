module ApplicationHelper
  def pointer_score_for(questionnaire)
    return 12 if questionnaire.score == 0
    return 35 if questionnaire.score == 1
    return 45 if questionnaire.score == 2
    return 55 if questionnaire.score == 3
    return 65 if questionnaire.score == 4
    85
  end
end
