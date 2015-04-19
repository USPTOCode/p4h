// Id = $Id$
// URL = $URL$
//


//get basic include function:
// /js/head.js here
// Id = $Id: head.js 3687 2013-10-23 21:16:07Z agockel $
// URL = $URL: https://dev-wmb-svn.etc.uspto.gov/repos/live/assets-content/trunk/common/html/js/head.js $
// mostly form uspto_head_1.js

function include(file)
{
  var script  = document.createElement('script');
  script.src  = file;
  script.type = 'text/javascript';
  script.defer = true;
 
  document.getElementsByTagName('head').item(0).appendChild(script);
}
 




// AIS specific settings

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','__gaTracker');



__gaTracker('create', 
   'UA-56653675-4',{
                      'name':'patternLibrary',
                      'siteSpeedSampleRate':1,
                      'visitorCookieTimeout':15552000000
                     });
__gaTracker('require', 'linkid', 'linkid.js');
__gaTracker('set', '_anonymizeIp', true);
__gaTracker('patternLibrary.send', 'pageview');


