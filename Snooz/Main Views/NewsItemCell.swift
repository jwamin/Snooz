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
  
  private let fallbackImage = Image(systemName: "doc.richtext")
  
  private var displayImage: Image {
    image?.resizable() ?? fallbackImage
  }
  
  var body: some View {
    HStack{
      displayImage
        .aspectRatio(1, contentMode: .fit)
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

struct NewsItemCell_Previews: PreviewProvider {
    static var previews: some View {
          NewsItemCell(article: testData.articles[0],image: testData.image(id: testData.articles[0].id))
    }
}

#endif
