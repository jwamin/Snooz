//
//  Models.swift
//  Snooz
//
//  Created by Joss Manger on 7/13/20.
//  Copyright © 2020 Joss Manger. All rights reserved.
//

import Foundation

struct ArticleClasificationTrainingModel: Codable {
    let text: String
    let label: String
}

enum NewsClassifications : String {
    case politics
    case technology
    case culture
    case health
    case environment
    case celebrity
    case war
    case finance
}

/*
 Clem Mangerhttps://scikit-learn.org/stable/modules/generated/sklearn.model_selection.RandomizedSearchCV.html
 08:52Clem Manger{'replace_propernouns':[True, False],}
 08:53
 */
/*
enum AltClassifications: NewsClassifications {
    case perpetualWar = .politics
    case riseOfTheMachines = .technology
    case theEndOfCulture = .culture
    case sickness = .health
    case theDyingPlanet = .environment
    case monsters = .celebrity
    case perpetualWar = .war
    case gamblingExploitationAndRacketeering = .finance
}
*/
/*Models*/

struct NewsResponse : Codable{
  let status:String
  let totalResults:Int
  let articles:[Article]
}

struct Article : Codable, Identifiable {
  
  var id:UUID = UUID()
  
  let source:Source
  let author:String?
  let title:String
  let description:String?
  let url:URL
  let imageURL:String?
  let publishedAt:String
  let content:String?
  
  enum CodingKeys : String, CodingKey {
    case source
    case author
    case title
    case description
    case url
    case imageURL = "urlToImage"
    case publishedAt
    case content
  }
  
}

struct Source : Codable {
  let id:String?
  let name:String?
}
