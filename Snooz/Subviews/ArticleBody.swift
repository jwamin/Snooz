//
//  ArticleBody.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ArticleBody: View {
    
    let article:Article
    
    var body: some View {
        VStack(alignment: .leading, spacing:8){
            Text(self.article.title)
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Text(self.article.description ?? "No Source")
                .font(.subheadline)
                .fontWeight(.thin)
                .fixedSize(horizontal: false, vertical: true)
            Text(self.article.source.name ?? "No Source")
                .font(.subheadline)
                .fontWeight(.thin)
            Text(self.article.content ?? "No Content")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
            Text(self.article.publishedAt)
                .font(.footnote)
            Text(self.article.url.absoluteString)
                .font(.footnote)
        }.foregroundColor(.primary).padding()
    }
}

struct ArticleBody_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ArticleBody(article: testData.articles[0]).previewLayout(.sizeThatFits)
            ArticleBody(article: testData.articles[0]).previewLayout(.sizeThatFits).colorScheme(.dark)
        }
    }
}
