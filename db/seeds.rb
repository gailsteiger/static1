# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
Resource.delete_all
Answer.delete_all
Result.delete_all
Response.delete_all
AnswerResource.delete_all

#BUILD CATEGORIES
categories = ['Sleep problems and tiredness', 'Worry and stress', 'Anxiety attacks and facing fears', "Doing things that don't help", "Low mood and negative thinking", "Life impact"]
categories.each do |title|
  Category.create!(title: title)
end

questions = [
    {title: "Do you regularly lay awake in bed at night worrying how you’re going to pay your bills?", order: 1},
    {title: "Are you feeling tired or lacking energy because worries about money have got you down?", order: 2},
    {title: "How often do you feel bothered by worry about your debts?", order: 3},
    {title: "Are you having trouble relaxing because of worries about money?", order: 4},
    {title: "Do you feel anxious about answering the phone or opening the post because it might be about your debts?", order: 5},
    {title: "Do you suffer with anxiety or panic attacks when you think about your financial situation?", order: 6},
    {title: "Do you often shop or spend excessively to feel better but have feelings of guilt or regret afterwards?", order: 7},
    {title: "Are you drinking more to help you cope with the stress of debt?", order: 8},
    {title: "Are you feeling low or tearful when you think about your financial situation?", order: 9},
    {title: "Are you having negative or unhelpful thoughts about your finances and your situation?", order: 10},
    {title: "Do you find you’re irritable, easily annoyed or do you lose your temper more often, or more quickly when you get stressed about money?", order: 11},
    {title: "If this questionnaire has highlighted problems, how often have these problems impacted on your day-to-day life? For example, have they made it difficult for you to do your work, take care of things at home or get along with other people?", order: 12}
]

resources = [
  [
    {title: "Try the Moodzone sleep problems audio guide and learn techniques to help get a good night’s sleep. ", url: "http://www.nhs.uk/Video/Pages/sleep-problems-podcast.aspx", type: "AUDIO", score: 1, external_id: "1-1"},
    {title: "Browse the better sleep section for a comprehensive selection of articles and videos which may help.", url: "http://www.nhs.uk/LiveWell/sleep/Pages/sleep-home.aspx", type: "BROWSE", score: 1, external_id: "1-2"},
    {title: "Read more about insomnia, it’s causes, symptoms and treatment.", url: "http://www.nhs.uk/conditions/Insomnia/Pages/Introduction.aspx", type: "ARTICLE", score: 2, external_id: "1-3"},
    {title: "Try the Moodzone tackle unhelpful thinking audio guide and learn techniques to improve the way you think about things.", type: "AUDIO", score: 2, external_id: "1-4"}
  ],
  [
    {title: "Worry and stress are very common causes of tiredness. Read more about tiredness and get tips on how to combat it.", url: "http://www.nhs.uk/livewell/tiredness-and-fatigue/pages/tiredness-and-fatigue.aspx", type: "BROWSE", score: 1, external_id: "2-1"}
  ],
  [
    {title: "Long term worry can be very harmful. Try the Moodzone fight anxiety audio guide and get an introduction to techniques to bring it under control.", url: "http://www.nhs.uk/Video/Pages/anxiety-podcast.aspx", type: "AUDIO", score: 1, external_id: "3-1"},
    {title: "Facing up to your debts and coming up with a plan should really help you to feel less powerless and more under control. Try the Moodzone practical problem solving audio guide and start feeling better, today.", type: "AUDIO", score: 1, external_id: "3-2"},
    {title: "Try the Moodzone low confidence and assertiveness audio guide for tips to help you feel less hopeless.", url: "http://www.nhs.uk/Video/Pages/low-confidence-and-assertiveness-podcast.aspx", type: "AUDIO", score: 2, external_id: "3-3"}
  ],
  [
    {title: "Try a few simple relaxation techniques and you should find it easier to relax, leaving you able manage your worry, better.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/ways-relieve-stress.aspx", type: "ARTICLE", score: 1, external_id: "4-1"},
    {title: "Not only could socialising help you relax, evidence shows that connecting with others is really important for our mental wellbeing.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/Connect-for-mental-wellbeing.aspx", type: "ARTICLE", score: 1, external_id: "4-2"}
  ],
  [
    {title: "Learn more about anxiety and worry and learn techniques to manage it with the Moodzone anxiety audio guide.", url: "http://www.nhs.uk/Video/Pages/anxiety-podcast.aspx", type: "AUDIO", score: 1, external_id: "9-2"},
    {title: "Try the Moodzone low confidence and assertiveness audio guide for tips to help you rebuild your confidence and face your fears.", url: "http://www.nhs.uk/Video/Pages/low-confidence-and-assertiveness-podcast.aspx", type: "AUDIO", score: 1, external_id: "9-3"},
    {title: "Avoiding things can be a sign of anxiety. Learn 10 strategies for overcoming your fears.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/overcoming-fears.aspx", type: "ARTICLE", score: 2, external_id: "9-1"},
    {title: "Anxiety or worry can trouble us all but an anxiety attack is a sign it is getting out of control. Try the Moodzone anxiety control training audio guide and learn techniques to manage it.", url: "http://www.nhs.uk/Video/Pages/anxiety-control-training-podcast.aspx", type: "AUDIO", score: 2, external_id: "8-1"}
  ],
  [
    {title: "Anxiety or worry can trouble us all but an anxiety attack is a sign it is getting out of control. Try the Moodzone anxiety control training audio guide and learn techniques to manage it.", url: "http://www.nhs.uk/Video/Pages/anxiety-control-training-podcast.aspx", type: "AUDIO", score: 1, external_id: "8-1"},
    {title: "Try the Moodzone coping with panic audio guide. You’ll learn about the vicious circle which should help you manage it better.", url: "http://www.nhs.uk/Video/Pages/panic-attacks-podcast.aspx", type: "AUDIO", score: 1, external_id: "8-2"},
    {title: "VIDEO: Panic attacks: Colin's story", url: "http://www.nhs.uk/conditions/panic-disorder/pages/colins-story.aspx", type: "VIDEO", score: 2, external_id: "8-3"}
  ],
  [
    {title: "Doing things that seem to help in the short term but can backfire later is a common way of coping. Consider changing unhelpful behaviours and try the ‘things you do that mess you up’ module on Living Life to The Full.", url: "http://www.llttf.com/", type: "BROWSE", score: 1, external_id: "10-1"}
  ],
  [
    {title: "Many of us may associate alcohol with relaxation but actually, the side-effects often make us feel worse than we did to start with. Here are 10 stress busters that don’t involve booze.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/reduce-stress.aspx", type: "ARTICLE", score: 1, external_id: "11-1"},
    {title: "Read more about alcohol and its damaging effects.", url: "http://www.nhs.uk/Livewell/alcohol/Pages/Effectsofalcohol.aspx", type: "ARTICLE", score: 1, external_id: "11-2"}
  ],
  [
    {title: "Feeling tearful can be a sign of low mood or depression. Try the Moodzone fight depression audio guide and understand more about feeling depressed and how you can manage it.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/low-mood-and-depression.aspx", type: "AUDIO", score: 1, external_id: "7-1"},
    {title: "Read about some basic techniques that will help you deal with depression.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/dealing-with-depression.aspx", type: "ARTICLE", score: 1, external_id: "7-2"}
  ],
  [
    {title: "Having negative thoughts is pretty common if you’re anxious or depressed. Try the Moodzone tackle unhelpful thinking audio guide and learn techniques to change the way you think about things.", url: "http://www.nhs.uk/Video/Pages/unhelpful-thinking-podcast.aspx", type: "AUDIO", score: 1, external_id: "5-1"}
  ],
  [
    {title: "Anger can be a healthy emotion at times but in times of stress, it can mean you over-react to things. Read more about how to control your anger.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/controlling-anger.aspx", type: "ARTICLE", score: 1, external_id: "6-1"},
    {title: "Read more about why some of us can’t control our anger.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/about-anger.aspx", type: "ARTICLE", score: 1, external_id: "6-2"},
    {title: "VIDEO: anger management", url: "http://www.nhs.uk/Video/Pages/Angermanagement.aspx", type: "VIDEO", score: 2, external_id: "6-3"}
  ],
  [
    {title: "If your money worries are impacting on your life to this degree, it’s time to take action. Talking therapy can really help – and doesn’t have to mean paying for treatment. Read more about self-help therapies you can try.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/Self-help-therapies.aspx", type: "ARTICLE", score: 1, external_id: "12-1"},
    {title: "Read more about accessing free therapy or counselling.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/Free-therapy-or-counselling.aspx", type: "ARTICLE", score: 1, external_id: "12-2"},
    {title: "Learn more about the different types of talking therapy.", url: "http://www.nhs.uk/Conditions/stress-anxiety-depression/Pages/types-of-therapy.aspx", type: "ARTICLE", score: 2, external_id: "12-3"}
  ]
]

headings = [
  "Tackling your sleep problems", "Feeling tired and lacking energy", "Worry and anxiety", "Relaxation", "Managing your anxiety", "Anxiety attacks", "Doing things that don’t help", "Using alcohol to cope", "Feeling emotional", "Negative thinking", "Dealing with irritability and anger", "Getting help to manage your worry"
]

#BUILD QUESTIONS
questions.each_with_index do |question, index|
  q = Question.create(title: question[:title], row_order: question[:order] - 1, heading: headings[index])
  ["None of the time", "Some of the time", "All of the time"].each_with_index do |answer_title, score|
    q.answers << Answer.new(title: answer_title, score: score)
  end

  question_resources = resources[index]
  question_resources.each do |resource|
    r = Resource.where(external_id: resource[:external_id])
    r = Resource.new(title: resource[:title], url: resource[:url], resource_type: resource[:type], external_id: resource[:external_id]) unless r.present?
    answers = q.answers.where("score >= ?", resource[:score])
    answers.each do |answer|
      answer.resources << r
    end
  end
end

Question.all.order("row_order ASC").in_groups_of(2).each_with_index do |question_group, index|
  question_group.each do |question|
    question.category_id = Category.where(title: categories[index]).first.id
    question.save!
  end
end

#Build Results

Result.create(
  body: "It's great that you¹re not feeling too worried but the
  fact you opted to take this test, does suggest you have some financial problems. It may be time to address those issues before they get out of control and start impacting on other areas of your life.",
  intro: "The Money Advice Service is a great place to start. The online money health check and budget planner can help you assess your expenditure over a month and give you advice on how to tackle any overspending:",
  score_min: 0,
  score_max: 0
)

Result.create(
  body: "It’s clear that your financial situation is bothering you and affecting your life and the way you feel to some degree. Taking charge and being proactive with your finances will really help you feel better and more in control. In addition, there are lots of ways you can help yourself and start managing the way you’re feeling",
  intro: "Here are some helpful resources to help you with the things you are struggling with most:",
  score_min: 1,
  score_max: 4
)

Result.create(
  body: "You seem to have big worries around your finances which are really affecting you. You need to take these problems seriously. 
  First, you need to address the money problems themselves. Taking charge and being proactive with your finances will really help you feel better and more in control. And the good news is that the Money Advice Service is here to help. 
  Second, you need to address how you are coping with these problems and the way you are feeling. There is lots of information and advice available below but if things are getting out of hand and you feel you can’t cope, try your GP or search for services near you.",
  intro: "Here are some helpful resources to help you with the things you are struggling with most:",
  score_min: 5,
  score_max: 9999
)

Resource.create(title: "Use the Money Advice Service's budget planner", url: "https://www.moneyadviceservice.org.uk/en/tools/budget-planner", resource_type: "MAS", score: 0)
Resource.create(title: "Money Health Check", url: "https://www.moneyadviceservice.org.uk/en/tools/health-check", resource_type: "MAS", score: 0)
Resource.create(title: "Beginner's guide to managing your money", url: "https://www.moneyadviceservice.org.uk/en/articles/beginners-guide-to-managing-your-money", resource_type: "MAS", score: 0)

Resource.create(title: "Use the Money Advice Service's budget planner", url: "https://www.moneyadviceservice.org.uk/en/tools/budget-planner", resource_type: "MAS", score: 4)
Resource.create(title: "Beginner's guide to managing your money", url: "https://www.moneyadviceservice.org.uk/en/articles/beginners-guide-to-managing-your-money", resource_type: "MAS", score: 4)
Resource.create(title: "Money Advice Service Debt test", url: "https://www.moneyadviceservice.org.uk/en/tools/debt-test", resource_type: "MAS", score: 4)

Resource.create(title: "Where to go to get free debt advice", url: "https://www.moneyadviceservice.org.uk/en/articles/where-to-go-to-get-free-debt-advice", resource_type: "MAS", score: 5)
Resource.create(title: "Request a call back from the StepChange debt charity", url: "http://www.stepchange.org/Contactus/Requestacallback.aspx", resource_type: "MAS", score: 5)
Resource.create(title: "Call the National Debtline", url: "http://www.nationaldebtline.co.uk/", resource_type: "MAS", score: 5)
