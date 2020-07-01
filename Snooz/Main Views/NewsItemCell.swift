//
//  NewsItemCell.swift
//  Snooz
//
//  Created by Joss Manger on 4/19/20.
//  Copyright © 2020 Joss Manger. All rights reserved.
//

import SwiftUI

struct NewsItemCell: View {

  var article:Article
  var image:Image?
  
  private let fallbackImage = Image(systemName: Constants.MainIconString)
  
  private var displayImage: some View {
    image?.resizable().aspectRatio(contentMode: .fill) ?? fallbackImage.resizable().aspectRatio(contentMode: .fit)
  }
  
  var body: some View {
    HStack{
      displayImage
        .frame(width: 50, height: 50)
        .cornerRadius(10)
      VStack(alignment: .leading){
        Text(article.title)
            .bold()
          .fixedSize(horizontal: false, vertical:true)
        Text("from \(article.source.name ?? "" )")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      
    }
  }
  
}

#if DEBUG

struct NewsItemCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id)).previewLayout(.sizeThatFits)
            NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id)).previewLayout(.sizeThatFits).colorScheme(.dark)
            NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id)).previewLayout(.sizeThatFits)
            NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id)).previewLayout(.sizeThatFits).colorScheme(.dark)
        }
    }
}

#endif
