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
  var image:Image?
  
  private let fallbackImage = Image(systemName: "doc.richtext")
  
  private var displayImage: Image {
    image ?? fallbackImage
  }
  
  @EnvironmentObject var newsModel:NewsModel
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false){
      ZStack{
        HeadingImage(image: displayImage)
        NavigationLink(destination:
          ImageDetail(image: displayImage, title: article.title, source: article.source.name ?? "")
        ) {
          HeadingImage(image: displayImage).foregroundColor(Color.clear)
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

struct ArticleDetailView_Previews: PreviewProvider {
  static var previews: some View {
    Group{
      ArticleDetail(article: testData.articles[0]).environmentObject(testData)
      ArticleDetail(article: testData.articles[0])
        .environmentObject(testData)
        .environment(\.colorScheme, .dark)
    }
  }
}

#endif


