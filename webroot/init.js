; jQuery(function($) {

  populateElement('#search', 'Search BMJ Group site');

  /* Latest from BMJ.com widget displaying drug related headlines */
  /*var widget1 = new widget({
    widget:       "feeds-widget1",
    url:          "http://feeds.bmj.com/bmjj/jobs/cardiology",
    track:        "w_heart_careers",
    widget_title: "Latest Cardiology jobs",
    style:        "bmjjournals",
    num_items:    "5"
  });*/
/*
  var heartwidget1 = new widget({
    widget:       "journal-widget",
    url:          "http://heart.bmj.com/cgi/collection/rss?coll_alias=education_in_heart",
    jurl:         "http://group.bmj.com/feed2json/indexc.php",
    track:        "w_heart_education",
    widget_title: "Latest from Education in Heart",
    style:        "bmjjournals",
    num_items:    "4"
  });
*/
  var panel1 = new tabbedwidget({
    widget:       "panel-1",
    url:          "http://heart.bmj.com/rss/ahead.xml",
    track:        "w_heart_ahead_tab",
    widget_title: "Online first",
    style:        "bmjjournals",
    num_items:    "20"
  });

  var panel2 = new tabbedwidget({
    widget:       "panel-2",
    url:          "http://heart.bmj.com/rss/current.xml",
    track:        "w_heart_current_tab",
    widget_title: "Current issue",
    style:        "bmjjournals",
    num_items:    "20"
  });

  var panel3 = new tabbedwidget({
    widget:       "panel-3",
    url:          "http://heart.bmj.com/rss/mfr.xml",
     'description' : "The list below shows the most frequently read articles last month, of those  " +
      "published in the last 12 months. ",
    track:        "w_heart_top10_tab",
    widget_title: "Top ten articles last month",
    style:        "bmjjournals",
    num_items:    "10"
  });

  var panel4 = new tabbedwidget({
    widget:       "panel-4",
    url:          "http://feeds.feedburner.com/heart/blogs",
    track:        "w_heart_blog_tab",
    widget_title: "Heart Blog",
    style:        "bmjjournals",
    num_items:    "20"
  });

  var panel5 = new tabbedwidget({
    widget:       "panel-5",
    url:          "http://podcasts.bmj.com/heart/feed/",
    track:        "w_heart_podcasts_tab",
    widget_title: "Podcasts",
    style:        "bmjjournals",
    num_items:    "20"
  });

  var panel6 = new tabbedwidget({
    widget:       "panel-6",
    url:          "http://casereports.bmj.com/cgi/collection/rss?coll_alias=cardiovascular_medicine",
    track:        "w_casereports_current_tab",
    widget_title: "Current issue",
    style:        "bmjjournals",
    num_items:    "20"
  });

var panel7 = new tabbedwidget(
{
  'widget'  :  "panel-7",
  'url'  :  "http://group.bmj.com/feeds/bmjj/open/bmj-heart-open.xml",
 'description' : "This list contains<a href='http://heart.bmj.com/site/about/guidelines.xhtml#open'> Open Access </a>  articles from Heart and relevant articles from <a href='http://bmjopen.bmj.com'>BMJ Open</a>. All are freely accessible.",

  'track'  :  "w_heart_open_tab",
  'widget_title'  :  "Open access",
  'style'  :  "bmjjournals",
  'num_items':  "20"
});
  
  var panel8 = new tabbedwidget({
    widget:       "panel-8",
    url:          "http://heart.bmj.com/cgi/collection/rss?coll_alias=education_in_heart",
    track:        "w_heart_education_tab",
    widget_title: "Education in Heart",
    style:        "bmjjournals",
    num_items:    "10"
  });

  $("#tabbed-widget").tabs();

  var sidepanel1 = new tabbedwidget({
    widget:       "sidepanel1",
    url:          "http://heart.bmj.com/cgi/collection/rss?coll_alias=education_in_heart",
    jurl:         "http://group.bmj.com/feed2json/indexc.php",
    track:        "w_heart_education_sidetab",
    style:        "bmjjournals",
    num_items:    "4",
    num_columns:  1
  });

  var sidepanel2 = new tabbedwidget({
    widget:       "sidepanel2",
    url:          "http://openheart.bmj.com/rss/current.xml",
    track:        "w_openheart_sidetab",
    style:        "bmjjournals",
    num_items:    "4",
    num_columns:  1
  });

  var sidepanel3 = new tabbedwidget({
    widget:       "sidepanel3",
    url:          "http://heart.bmj.com/rss/ahead.xml",
    track:        "w_heart_ahead_sidetab",
    style:        "bmjjournals",
    num_items:    "4",
    num_columns:  1
  });

  $("#tabbed-side-widget").tabs();

  /* $.getScript("http://journals.bmj.com/site/js/jquery.bmj.noty.js", function() { podcast_notify(); }); */
  
});