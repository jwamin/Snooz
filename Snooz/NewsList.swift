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
          NewsItemCell(article: article)
        }.navigationBarTitle("Snooz").navigationBarHidden(false)
        }
    }
}

struct NewsItemCell: View {

  var article:Article
  @EnvironmentObject var mainModel:NewsModel
  
  func getImage()->UIImage {
    mainModel.images[article.id] ?? UIImage(systemName: "gear")!
  }
  
  var body: some View {
    HStack{
    Image(uiImage: getImage()).frame(width: 40, height: 40).cornerRadius(10)
    Text(article.title)
    }
  }
  
}

struct NewsList_Previews: PreviewProvider {

    static var previews: some View {
      Group {
        NewsList()
        //NewsItemCell(article: TestData().articles[0])
      }.environmentObject(TestData())
    }
}
