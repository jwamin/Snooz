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
  
  var load:Bool
  
  @Published var images = [UUID:Image]() {
    didSet{
      print(images)
      self.objectWillChange.send()
    }
  }
  
  private func getImage(id:UUID)-> Image? {
    
    return self.images[id]
    
  }
  
  func image(id:UUID)->Image {
    if let image = self.getImage(id: id){
      return image
    } else {
      return Image(systemName: "doc.richtext")
    }
  }
  
  var articles:[Article] = [] {
    didSet{
      print(articles.count)
      self.objectWillChange.send()
      if load {
        self.loadImages()
      }
    }
  }
  
  var cancellable:AnyCancellable?
  
  init(load:Bool = true) {
    print("hello world")
    self.load = load
    if load {
      self.loadData()
    }
  }
  
  var anyCancellables = [AnyCancellable]()
  
  func loadImages(){
    for article in articles{
      if !images.keys.contains(article.id), let imageurl = URL(string: article.imageURL ?? ""), imageurl.scheme == "https"{
        //load image into memory
        anyCancellables += [URLSession.shared.dataTaskPublisher(for: imageurl).map({ response in
          Image(uiImage:UIImage(data: response.data)!)
        }).assertNoFailure()
          .receive(on:RunLoop.main)
          .sink{ image in
            self.images[article.id] = image
          }]
      }
    }
  }
  
  func loadData(){
    //resetImages
    images = [:]
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
  
  #if DEBUG
  
  convenience init() {
    self.init(load:false)
    self.articles = loadTestData()
  }
  
  #endif
  
}

struct NewsModel_Previews: PreviewProvider {
  static var previews: some View {
    //ForEach(ContentSizeCategory.AllCases){ item in
    ForEach(NewsModel().articles){ article in
      NewsItemCell(article: article, image: Image(systemName: "doc.richtext"))
        .previewLayout(.sizeThatFits)
    }
  //}
}
}
