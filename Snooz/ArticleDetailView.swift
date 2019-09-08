//
//  ArticleDetailView.swift
//  Snooz
//
//  Created by Joss Manger on 9/8/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
  
  let article:Article
  @EnvironmentObject var newsModel:NewsModel
  
  var body: some View {
    ZStack{
      VStack {
        newsModel.getImage(id: article.id)
        .resizable(resizingMode: Image.ResizingMode.stretch)
          .aspectRatio(contentMode: .fill)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, idealHeight: 300, maxHeight: 300)
        .background(Color.green)
          .foregroundColor(Color.white)
        Spacer()
      }
    ScrollView(.vertical, showsIndicators: false){
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
          VStack(alignment: .leading, spacing:8){
            Text(article.title)
              .font(.title)
              .fontWeight(.bold)
              .multilineTextAlignment(.leading)
              .lineLimit(.max)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
            Text(article.source.name ?? "No Source")
              .font(.subheadline)
              .fontWeight(.thin)
              .lineLimit(1)
              .padding()
            Text(article.content ?? "No Content")
              .font(.body)
              .lineLimit(10)
            Text(article.publishedAt)
              .font(.footnote)
            Text(article.url.absoluteString)
              .font(.footnote)
              .lineLimit(.max)
          }.lineLimit(nil).padding()
        }
        Button(action: {
          print("oh hello")
        }) {
          HStack(alignment:.center){
            Image(systemName: "square.and.arrow.up")
            Text("Share")
          }
        }
        .padding(.horizontal, 10)
        .padding([.top,.bottom], 5)
        .background(Color.gray)
        .cornerRadius(10)
        Spacer()
      }
      .background(Color.white)
      .padding(.top,300)
      
    }
    .padding(.top)
    }//.edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG

let envobject = NewsModel()

struct ArticleDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleDetailView(article: envobject.articles[0]).environmentObject(envobject)
  }
}

#endif
