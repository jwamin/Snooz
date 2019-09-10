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
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false){
      ZStack{
        HeadingImage(image: newsModel.image(id:article.id))
        NavigationLink(destination:
          ImageDetail(image: newsModel.image(id: self.article.id), title: article.title, source: article.source.name ?? "")
        ) {
          HeadingImage(image: newsModel.image(id:self.article.id)).foregroundColor(Color.clear)
        }
        VStack{
          ZStack{
            VStack{
              HStack{
                Image(systemName: "doc.richtext")
                  .resizable()
                  .aspectRatio(0.8, contentMode: .fit)
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
          ShareButton(url: article.url)
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


