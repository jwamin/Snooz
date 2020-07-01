//
//  DataStructures.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import Foundation

enum Ordering: Int, CaseIterable, Identifiable {

    case date
    case source
    case alphabetical
    
    var id:Int {
        return self.rawValue
    }

    var displayString: String {
        switch self {
        case .alphabetical:
            return "Az"
        case .date:
            return "By Date"
        case .source:
            return  "By Source"
        }
    }
}

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
