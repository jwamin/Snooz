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
    ScrollView(.vertical, showsIndicators: false){
    VStack{
      Image(uiImage: newsModel.getImage(id: article.id))
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, idealHeight: 300, maxHeight: 300)
        .padding()
        .background(Color.green)
        .foregroundColor(Color.white)
        .clipped()
      VStack(alignment: .leading, spacing:8){
      Text(article.title)
        .font(.title)
        .fontWeight(.bold)
        .lineLimit(.max)
        .truncationMode(.head)
        .padding(0)
      Text(article.source.name ?? "No Source")
        .font(.subheadline)
        .fontWeight(.thin)
      Text(article.content ?? "No Content")
        .font(.body)
        .lineLimit(.max)
      Text(article.publishedAt)
        .font(.footnote)
      Text(article.url.absoluteString)
        .font(.footnote)
        .lineLimit(.max)
        }.lineLimit(0)
        .padding()
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
    }.edgesIgnoringSafeArea(.all)
      .multilineTextAlignment(.leading)
      .navigationBarTitle("titlef",displayMode: .inline)
    }
  }
}

struct ArticleDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleDetailView(article: TestData().articles[0]).environmentObject(TestData())
  }
}
