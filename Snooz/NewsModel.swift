//
//  NewsModel.swift
//  Snooz
//
//  Created by Joss Manger on 9/7/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI
import Combine

class NewsModel : ObservableObject {
  
  var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
  
  var images = [UUID:UIImage]() {
    didSet{
      print(images)
      self.objectWillChange.send()
    }
  }
  
  var articles:[Article] = [] {
    didSet{
      print(articles.count)
      self.objectWillChange.send()
      self.loadImages()
    }
  }
  
  var cancellable:AnyCancellable?
  
  init() {
    print("hello world")
    self.loadData()
  }
  
  func loadImages(){
    for article in articles{
      if !images.keys.contains(article.id), let imageurl = article.imageURL, imageurl.scheme == "https"{
        //load image into memory
        _ = URLSession.shared.dataTaskPublisher(for: imageurl).map({ response in
          UIImage(data: response.data)
        }).assertNoFailure().receive(on:RunLoop.main).sink{ image in
          self.images[article.id] = image
        }
      }
    }
  }
  
  func loadData(){
    if let url = URL(string: Constants.topLocalHeadlines){
      print(url)
      cancellable = URLSession.shared.dataTaskPublisher(for: url).map({ response in
        return response.data
      }).decode(type: NewsResponse.self, decoder: JSONDecoder()).tryCatch({ (error) -> AnyPublisher<NewsResponse,Error> in
        print(error)
        return AnyPublisher<NewsResponse,Error>(Empty())
      }).map({ response in
        return response.articles
      }).replaceError(with: []).receive(on: RunLoop.main).assign(to: \.articles, on: self)
    } else {
      print("error")
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
  let imageURL:URL?
  let publishedAt:String //for now
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
