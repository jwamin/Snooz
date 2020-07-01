//
//  NewsRow.swift
//  Snooz
//
//  Created by Joss Manger on 6/30/20.
//  Copyright © 2020 Joss Manger. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    let article: Article
    
    @EnvironmentObject var newsModel:NewsModel

    var body: some View {
        NavigationLink(destination:
                        ArticleDetail(article: article)
                        .navigationBarTitle(article.source.name ?? "No source")
        ){
            NewsItemCell(article: article, image: self.newsModel.image(id: article.id))
                .onAppear(){
                    self.newsModel.loadImage(for: self.article.id)
            }
        }
    }
}
struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        return NewsRow(article: testData.articles.first!)
            .environmentObject(testData)
    }
}
