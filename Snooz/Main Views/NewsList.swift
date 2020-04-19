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
            NewsItemCell(article: article, image: self.newsModel.image(id: article.id)).onAppear(){
              self.newsModel.loadImage(for: article.id)
            }
          }
        }.navigationBarTitle("Snooz",displayMode: .automatic).navigationBarItems(trailing: Button(action: {
          self.newsModel.loadData()
        }, label: {Image(systemName:"arrow.clockwise")}))
        }
    }
}

#if DEBUG

let testData = NewsModel(debug: true)

struct NewsList_Previews: PreviewProvider {

    static var previews: some View {
      Group {
        NewsList().environmentObject(testData)
        NewsList().environmentObject(testData)
        .environment(\.colorScheme, .dark)
      }
    }
}

#endif
