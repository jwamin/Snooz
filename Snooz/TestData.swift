//
//  TestData.swift
//  Snooz
//
//  Created by Joss Manger on 9/7/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

class TestData : NewsModel{
  
  override var articles:[Article] {
    didSet{
      print(articles.count)
      self.objectWillChange.send()
      self.loadImages()
    }
  }
  
  override init() {
    super.init()
    
  }
  
  override func loadData() {
    do {
      let strData = data.data(using: .utf8)!
      articles = try JSONDecoder().decode(NewsResponse.self, from: strData).articles
    } catch {
      print("errrror",error)
      articles = []
    }
  }
  
  override func loadImages() {
    print("called")
    for article in articles{
      images[article.id] = UIImage(systemName: "gear")
    }
  }
  
}

let data = """
{\"status\":\"ok\",\"totalResults\":38,\"articles\":[{\"source\":{\"id\":\"cnn\",\"name\":\"CNN\"},\"author\":null,\"title\":\"Hurricane Dorian\'s aftermath in the Bahamas: The latest - CNN\",\"description\":\"At least 30 people in the Bahamas were killed by Hurricane Dorian, and officials expect that number to rise as recovery efforts continue. Follow here for the latest.\",\"url\":\"https://www.cnn.com/us/live-news/bahamas-hurricane-dorian/index.html\",\"urlToImage\":\"https://cdn.cnn.com/cnnnext/dam/assets/190906130208-10-dorian-bahamas-0906-super-tease.jpg\",\"publishedAt\":\"2019-09-07T18:51:00Z\",\"content\":\"More than 1,550 hurricane evacuees are aboard a cruise ship from Freeport in the Bahamas that\'s heading to West Palm Beach in Florida, according to a Facebook post from the Bahamas Paradise Cruise Line. \\r\\nPeople are already waiting at the Port of Palm Beach i… [+1952 chars]\"},{\"source\":{\"id\":\"the-new-york-times\",\"name\":\"The New York Times\"},\"author\":null,\"title\":\"Military Stopover at Scottish Airport Sometimes Includes a Stay at a Trump Resort - The New York Times\",\"description\":\"Questions about the overnight stays emerged after House investigators asked about the surge in stopovers at an airport near the Trump Turnberry golf resort in Scotland.\",\"url\":\"https://www.nytimes.com/2019/09/07/us/politics/military-stopover-trump-turnberry.html\",\"urlToImage\":\"https://static01.nyt.com/images/2019/09/08/us/politics/08dc-turnberry-print1/07dc-turnberry-facebookJumbo.jpg\",\"publishedAt\":\"2019-09-07T18:51:00Z\",\"content\":\"The Trump family bought the Turnberry golf course in 2014. It generated $23.4 million in revenue last year, up by $3 million compared to 2017.\\r\\nA representative for the Trump Organization confirmed Saturday that United States military personnel have occasiona… [+1613 chars]\"},{\"source\":{\"id\":\"fox-news\",\"name\":\"Fox News\"},\"author\":\"New York Post\",\"title\":\"Kevin Hart\'s car was supposedly missing key safety features: report - Fox News\",\"description\":\"Kevin Hart‘s car lacked important safety features which could have prevented many of the injuries he suffered in a car accident earlier this week.\",\"url\":\"https://www.foxnews.com/entertainment/kevin-hart-car-missing-safety-features\",\"urlToImage\":\"https://static.foxnews.com/foxnews.com/content/uploads/2018/09/kevin-hart-smile-reuters660.jpg\",\"publishedAt\":\"2019-09-07T18:35:35Z\",\"content\":\"Kevin Hart‘s car lacked important safety features which could have prevented many of the injuries he suffered in a car accident earlier this week, experts tell TMZ.\\r\\nThe souped up 1970 Plymouth Barracuda Hart was riding in did not have a five-point harness an… [+408 chars]\"},{\"source\":{\"id\":null,\"name\":\"Hollywoodreporter.com\"},\"author\":\"Ariston Anderson\",\"title\":\"Venice Film Festival Awards Revealed - Hollywood Reporter\",\"description\":\"The 76th edition of the Venice Film Festival closed Saturday night with the top prize going to the villain origin story starring Joaquin Phoenix.\",\"url\":\"https://www.hollywoodreporter.com/news/venice-film-festival-awards-revealed-1237684\",\"urlToImage\":\"https://cdn1.thr.com/sites/default/files/2019/09/joker.jpg\",\"publishedAt\":\"2019-09-07T18:35:06Z\",\"content\":\"Todd Phillips\' Joker took home the Golden Lion top prize in Venice on Saturday night, while Roman Polanski won the second place Silver Lion Grand Jury Prize for An Officer and a Spy. \\r\\nUpon receiving the prize, Phillips thanked \\\"Warner Bros. and DC for steppi… [+5546 chars]\"},{\"source\":{\"id\":null,\"name\":\"Youtube.com\"},\"author\":null,\"title\":\"What do protesters in Hong Kong want now? | Inside Story - Al Jazeera English\",\"description\":\"Anger remains despite government withdrawing controversial extradition law Hong Kong\'s \'summer of discontent\' shows no sign of ending, despite Chief Executiv...\",\"url\":\"https://www.youtube.com/watch?v=fBcQ4dh1Hw8\",\"urlToImage\":\"https://i.ytimg.com/vi/fBcQ4dh1Hw8/maxresdefault.jpg\",\"publishedAt\":\"2019-09-07T17:30:00Z\",\"content\":\"Anger remains despite government withdrawing controversial extradition law\\r\\nHong Kong\'s \'summer of discontent\' shows no sign of ending, despite Chief Executive Carrie Lam bowing to months of protest pressure and withdrawing the controversial bill to allow ext… [+796 chars]\"},{\"source\":{\"id\":null,\"name\":\"Pagesix.com\"},\"author\":\"Isabel Vincent, Sara Nathan\",\"title\":\"Royal insiders dish on Prince Harry and Meghan\'s \'summer of hell\' - Page Six\",\"description\":\"“Meghan is clearly calling the shots, but she’s a minor operator who is playing in the big leagues and mucking it up in the most catastrophic fashion…”\",\"url\":\"https://pagesix.com/2019/09/07/royal-insiders-dish-on-prince-harry-and-meghans-summer-of-hell/\",\"urlToImage\":\"https://nyppagesix.files.wordpress.com/2019/07/71719-meghan-markle-prince-harry-main.jpg?quality=90&strip=all&w=1200\",\"publishedAt\":\"2019-09-07T17:26:00Z\",\"content\":\"It’s been a summer of hell for Prince Harry and Meghan Markle, according to one palace insider, and royal watchers say the forecast is grim for the fall.\\r\\n[The couples recent behavior is] a public relations disaster for Buckingham Palace, who are having a har… [+9648 chars]\"},{\"source\":{\"id\":null,\"name\":\"Youtube.com\"},\"author\":null,\"title\":\"The Raiders release Antonio Brown | SportsCenter - ESPN\",\"description\":null,\"url\":\"https://www.youtube.com/watch?v=0bFEg1dn8oo\",\"urlToImage\":null,\"publishedAt\":\"2019-09-07T17:12:42Z\",\"content\":null},{\"source\":{\"id\":\"reuters\",\"name\":\"Reuters\"},\"author\":\"David Morgan\",\"title\":\"U.S. House panel poised to spell out Trump impeachment probe: source - Reuters\",\"description\":\"The Democratic-led U.S. House of Representatives Judiciary Committee, criticized for an unorthodox impeachment probe of President Donald Trump, is poised to vote next week on a resolution to formalize the investigation, a person familiar with the matter said …\",\"url\":\"https://www.reuters.com/article/us-usa-trump-impeachment/us-house-panel-poised-to-spell-out-trump-impeachment-probe-source-idUSKCN1VS0LS\",\"urlToImage\":\"https://s2.reutersmedia.net/resources/r/?m=02&d=20190907&t=2&i=1427318261&w=1200&r=LYNXNPEF860UG\",\"publishedAt\":\"2019-09-07T17:01:00Z\",\"content\":\"WASHINGTON (Reuters) - The Democratic-led U.S. House of Representatives Judiciary Committee, criticized for an unorthodox impeachment probe of President Donald Trump, is poised to vote next week on a resolution to formalize the investigation, a person familia… [+2638 chars]\"},{\"source\":{\"id\":\"the-washington-post\",\"name\":\"The Washington Post\"},\"author\":null,\"title\":\"NOAA’s support of Trump over its own scientists provokes uproar in weather community - The Washington Post\",\"description\":null,\"url\":\"https://www.washingtonpost.com/weather/2019/09/07/noaas-support-president-trump-over-its-own-scientists-provokes-mass-uproar-weather-community/\",\"urlToImage\":null,\"publishedAt\":\"2019-09-07T16:56:07Z\",\"content\":null},{\"source\":{\"id\":null,\"name\":\"Youtube.com\"},\"author\":null,\"title\":\"Kelvin Gastelum Believes He\'s Tougher Fight For Darren Till Than Jorge Masvidal - MMA Fighting - MMAFightingonSBN\",\"description\":\"UFC 242 guest fighter Kelvin Gastelum admitted that he was surprised to be matched with Darren Till, discussed how he feels he\'s a tougher challenge for the ...\",\"url\":\"https://www.youtube.com/watch?v=dxRa134wKaw\",\"urlToImage\":\"https://i.ytimg.com/vi/dxRa134wKaw/maxresdefault.jpg\",\"publishedAt\":\"2019-09-07T16:55:52Z\",\"content\":\"UFC 242 guest fighter Kelvin Gastelum admitted that he was surprised to be matched with Darren Till, discussed how he feels he\'s a tougher challenge for the Liverpudlian than Jorge Masvidal, acknowledged how he needs to be wary of Till\'s left hand and also ga… [+573 chars]\"},{\"source\":{\"id\":\"cnn\",\"name\":\"CNN\"},\"author\":\"Denis Lapin, Olga Pavlova, Bianca Britton and Sarah Dean, CNN\",\"title\":\"Film director Oleg Sentsov and MH17 suspect among those freed in Russia-Ukraine prisoner swap - CNN\",\"description\":\"A man suspected of involvement in the downing of Malaysia Airlines flight MH17 that killed 298 people has been released along with 69 other prisoners from Russia and Ukraine in a long-awaited exchange, according to Ukrainian and Russia state news agencies.\",\"url\":\"https://www.cnn.com/2019/09/07/europe/ukraine-russia-prisoner-swap-intl/index.html\",\"urlToImage\":\"https://cdn.cnn.com/cnnnext/dam/assets/190907160928-volodymyr-tsemakh-super-tease.jpg\",\"publishedAt\":\"2019-09-07T16:50:00Z\",\"content\":\"Kiev, Ukraine and Moscow, Russia (CNN)A man suspected of involvement in the downing of Malaysia Airlines flight MH17 that killed 298 people has been released along with 69 other prisoners from Russia and Ukraine in a long-awaited exchange, according to Ukrain… [+3456 chars]\"},{\"source\":{\"id\":null,\"name\":\"Latimes.com\"},\"author\":\"Kim Christensen, Matt Hamilton\",\"title\":\"California boat fire: The Conception was a \'fire trap\' experts say - Los Angeles Times\",\"description\":\"The Conception, where 34 people were killed in California\'s worst maritime fire in recent history, was a “compliant fire trap,” one expert said.\",\"url\":\"https://www.latimes.com/california/story/2019-09-07/california-boat-fire-design\",\"urlToImage\":\"https://ca-times.brightspotcdn.com/dims4/default/f3e50fa/2147483647/strip/true/crop/3600x1890+0+66/resize/1200x630!/quality/90/?url=https%3A%2F%2Fca-times.brightspotcdn.com%2F34%2Fca%2F30e85450c419c0b416fde819493f%2Fimg-la-photos-1staff-464-2-1-ka5rkch2.jpg\",\"publishedAt\":\"2019-09-07T16:48:00Z\",\"content\":\"A day of diving off Santa Cruz Island ended like countless others aboard the Conception, with dozens of divers asleep in tightly arranged bunks that all but filled the belly of the 75-foot boat.\\r\\nAs always, there were two ways out in case of emergency up a cu… [+8577 chars]\"},{\"source\":{\"id\":\"business-insider\",\"name\":\"Business Insider\"},\"author\":\"Jeremy Berke\",\"title\":\"Timeline of vape-related illnesses and deaths - Business Insider\",\"description\":\"The CDC is investigating at least 450 possible cases of vape-related illnesses in 33 states across the US. The illnesses have led to at least 5 deaths.\",\"url\":\"https://www.businessinsider.com/timeline-of-vape-related-illnesses-and-deaths-2019-9\",\"urlToImage\":\"https://amp.businessinsider.com/images/5d73c9f12e22af42653be6b5-1920-960.jpg\",\"publishedAt\":\"2019-09-07T16:46:36Z\",\"content\":\"The mysterious spate of vaping-related illnesses and deaths continues to grow. \\r\\n On Friday the Center for Disease Control announced that at least 450 possible cases of vape-related illnesses have been reported in 33 states across the US. The illnesses have r… [+1381 chars]\"},{\"source\":{\"id\":null,\"name\":\"Espn.com\"},\"author\":null,\"title\":\"Team USA upset with Antetokounmpos after foul - ESPN\",\"description\":\"Jaylen Brown and Giannis Antetokounmpo exchanged words after Team USA\'s victory over Greece in the FIBA World Cup, and referees and coaches came to break up the confrontation.\",\"url\":\"https://www.espn.com/nba/story/_/id/27559570/team-usa-upset-antetokounmpos-foul\",\"urlToImage\":\"https://a1.espncdn.com/combiner/i?img=%2Fphoto%2F2019%2F0907%2Fr594715_1296x729_16%2D9.jpg\",\"publishedAt\":\"2019-09-07T15:57:38Z\",\"content\":\"SHENZHEN, China -- Giannis Antetokounmpo and his brother Thanasis Antetokounmpo had to be separated from members of Team USA after a controversial foul triggered emotions at the FIBA World Cup on Saturday night.\\r\\nWith 1:43 left and the U.S. on the way to a 69… [+1540 chars]\"},{\"source\":{\"id\":\"the-washington-post\",\"name\":\"The Washington Post\"},\"author\":\"Kayla Epstein\",\"title\":\"Hiker killed after falling 500 feet from Half Dome cables in Yosemite - The Washington Post\",\"description\":\"Danielle Burnett, 29, fell while ascending the cables leading to Half Dome\'s summit.\",\"url\":\"https://www.washingtonpost.com/sports/2019/09/07/hiker-killed-after-falling-feet-half-dome-cables-yosemite/\",\"urlToImage\":\"https://www.washingtonpost.com/resizer/N5dNfXKHgkrtxUt-u1RDhOoR7NM=/1484x0/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/BYYBK3GQZII6TJRABKIWK3L5WY.jpg\",\"publishedAt\":\"2019-09-07T15:35:33Z\",\"content\":\"The iconic Half Dome in Yosemite National Park has loomed large in the national imagination since American settlers began exploring the park in the middle of the 19th-century. Every year, thousands of hikers seek to summit the 4,800-foot, crescent-shaped gran… [+2335 chars]\"},{\"source\":{\"id\":null,\"name\":\"Ufc.com\"},\"author\":null,\"title\":\"UFC 242 Results - The Official Website of the Ultimate Fighting Championship\",\"description\":null,\"url\":\"https://www.ufc.com/news/ufc-242-results\",\"urlToImage\":\"https://dmxg5wxfqgb4u.cloudfront.net/styles/card/s3/2019-09/khabib-poirier-242-hero.jpg?tAJE5CEvzQT31RSSr42F9j.BlMAWLjzA&amp;h=d1cb525d&amp;itok=sYI9X8k-\",\"publishedAt\":\"2019-09-07T15:29:31Z\",\"content\":\"In action for the first time since May 2016, Russian featherweight Zubaira Tukhugov held off a spirited charge from British newcomer Lerone Murphy, with the result being a three-round draw.\\r\\nScores were 29-28, 28-29 and 28-28.\\r\\nSearching for a right hand earl… [+710 chars]\"},{\"source\":{\"id\":null,\"name\":\"Qz.com\"},\"author\":\"Ephrat Livni\",\"title\":\"Squirrels rely on the original twitter to know they are safe - Quartz\",\"description\":\"Humans may consider eavesdropping rude, but squirrels would beg to differ.\",\"url\":\"https://qz.com/1704609/squirrels-rely-on-the-original-twitter-to-know-they-are-safe/\",\"urlToImage\":\"https://cms.qz.com/wp-content/uploads/2019/09/birds.squirrels.jpeg?quality=75&strip=all&w=1400\",\"publishedAt\":\"2019-09-07T14:56:00Z\",\"content\":\"Long before humans adopted social media and a 24-hour news cycle, some creatures were already tuning in to tweets.\\r\\nA new study in the journal Plos One, by researchers from Oberlin University in Ohio, tested the hypothesis that birds act as community informan… [+2463 chars]\"},{\"source\":{\"id\":null,\"name\":\"Bbc.com\"},\"author\":\"https://www.facebook.com/bbcnews\",\"title\":\"Typhoon Lingling: North Korea on alert as storm threatens crops - BBC News\",\"description\":\"There are fears that storm Lingling could damage crops in a country already suffering food shortages.\",\"url\":\"https://www.bbc.com/news/world-asia-49621405\",\"urlToImage\":\"https://ichef.bbci.co.uk/images/ic/1024x576/p07mrfll.jpg\",\"publishedAt\":\"2019-09-07T14:14:53Z\",\"content\":\"Media captionTyphoon Lingling has arrived in North Korea, after battering the South\\r\\nNorth Korean leader Kim Jong-un has chaired an emergency meeting of government officials as a powerful typhoon began to batter the country.\\r\\nTyphoon Lingling has caused wides… [+1827 chars]\"},{\"source\":{\"id\":null,\"name\":\"Birthmoviesdeath.com\"},\"author\":\"Abby Olcese\",\"title\":\"TIFF 2019 Review: Armando Iannucci Takes On Dickens With THE PERSONAL HISTORY OF DAVID COPPERFIELD - Birth.Movies.Death.\",\"description\":\"The VEEP and DEATH OF STALIN creator brings a modern touch to a beloved classic.\",\"url\":\"https://birthmoviesdeath.com/2019/09/07/tiff-2019-review-armando-iannucci-takes-on-dickens-with-the-personal-histor\",\"urlToImage\":\"https://s3.birthmoviesdeath.com/images/made/d_copp_1050_591_81_s_c1.jpg\",\"publishedAt\":\"2019-09-07T13:22:00Z\",\"content\":\"If you didn’t already know Armando Iannucci was behind The Personal History of David Copperfield, you’d be forgiven for thinking someone else had made it. The film represents a significant change for the creator of Veep and In the Loop. It is a much kinder fi… [+5022 chars]\"},{\"source\":{\"id\":null,\"name\":\"Macrumors.com\"},\"author\":\"MacRumors Staff\",\"title\":\"Top Stories: Apple\'s iPhone Event and Last-Minute Rumors, Free Apple Watch Screen Repairs, and More - MacRumors\",\"description\":\"It\'s almost here: Apple\'s annual iPhone event! We\'ve been hearing rumors about the 2019 iPhones essentially since the 2018 models were...\",\"url\":\"https://www.macrumors.com/2019/09/07/top-stories-iphone-what-to-expect/\",\"urlToImage\":\"https://cdn.macrumors.com/article-new/2019/09/What-to-Expect-Social-Graphic.jpg?retina\",\"publishedAt\":\"2019-09-07T13:00:00Z\",\"content\":\"It\'s almost here: Apple\'s annual iPhone event! We\'ve been hearing rumors about the 2019 iPhones essentially since the 2018 models were announced, and we\'re finally about to see what Apple has to show off. We expect plenty more announcements beyond the new iPh… [+4918 chars]\"}]}
"""
