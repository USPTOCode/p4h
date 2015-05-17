# p4h
Patents for Humanity Quiz App

This is a simple quiz program built with the ruby Sinatra web framework and using the USPTO's UI Library: 
http://uspto.github.io/designpatterns/ which uses Bootstrap.

The app is in production on quiz.usptocode.org

Publically accessible data on the 2014 Patents for Humanity contest submissions and winners was scraped to form the basis for the quiz questions.

2014 Patents for Humanity Contest Submissions: https://p4h.skild.com/skild2/p4h/viewEntryVoting.action
2014 Patents for Humanity Contest Winners, celebrated at 2015 ceremony: http://www.uspto.gov/patent/initiatives/patents-humanity/2015-award-ceremony-recipients.html

The app asks five questions, the answers from three of the questions are drawn randomly from the scraped contest entry data, where each answer represents data corresponding to a particular Patents for Humanity submission category. The 2014 categories were Medicine, Nutrition, Sanitation, Household Energy, and Living Standards.

Upon submission, the users responses are tallied and a result as to which submission category they most strongly prefer is given.
