//
//  ContentView.swift
//  Snooz
//
//  Created by Joss Manger on 9/7/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct NewsList: View {
  
  @EnvironmentObject var newsModel:NewsModel
  
    var body: some View {
      NavigationView{
        List(newsModel.articles){ article in
          NavigationLink(destination: 
            ArticleDetail(article: article)
              .navigationBarTitle(article.source.name ?? "No source")
          ){
            NewsItemCell(article: article, image: self.newsModel.image(id: article.id))
          }
        }.navigationBarTitle("Snooz",displayMode: .automatic).navigationBarItems(trailing: Button(action: {
          self.newsModel.loadData()
        }, label: {Image(systemName:"arrow.clockwise")}))
        }
    }
}

struct NewsItemCell: View {

  var article:Article
  var image:Image
  
  var body: some View {
    HStack{
      image
      .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: 50, height: 50)
        .cornerRadius(10)
      VStack(alignment: .leading){
        Text(article.title)
          .fixedSize(horizontal: false, vertical:true)
        Text("from \(article.source.name ?? "" )")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      
    }
  }
  
}

#if DEBUG

let testData = NewsModel()

struct NewsList_Previews: PreviewProvider {

    static var previews: some View {
      Group {
        NewsList().environmentObject(testData)
        NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id))
      }
    }
}

#endif
