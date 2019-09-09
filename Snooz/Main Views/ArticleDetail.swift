//
//  ArticleDetailView.swift
//  Snooz
//
//  Created by Joss Manger on 9/8/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ArticleDetail: View {
  
  let article:Article
  @EnvironmentObject var newsModel:NewsModel
  
  func image()->Image {
    self.newsModel.getImage(id: self.article.id)
  }
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false){
      ZStack{
        HeadingImage(image: image())
        NavigationLink(destination:
          ImageDetail(image: self.image(), title: article.title, source: article.source.name ?? "")
        ) {
          HeadingImage(image: image()).foregroundColor(Color.clear)
        }
        VStack{
          ZStack{
            VStack{
              HStack{
                Image(systemName: "doc.richtext")
                  .resizable()
                  .aspectRatio(1, contentMode: .fit)
                  .padding()
                  .frame(width: 100, height: 100)
                  .background(Color.white)
                  .cornerRadius(15)
                  .padding()
                Spacer()
              }.offset(y: -100)
              Spacer()
            }
            ArticleBody(article:article)
          }
          ShareButton()
          Spacer()
        }
        .background(Color.white)
          
        .padding(.top,300)
        
        
      }
    }
  }
}

#if DEBUG

let envobject = NewsModel()

struct ArticleDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      ArticleDetail(article: envobject.articles[0]).environmentObject(envobject)
      ArticleDetail(article: envobject.articles[0])
        .environmentObject(envobject)
        .environment(\.colorScheme, .dark)
    }
  }
}

#endif


