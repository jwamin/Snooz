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
        NavigationView {
            VStack{
            Segmented(ordering:$newsModel.ordering).fixedSize().padding()
            List(newsModel.articles){ article in
                if self.newsModel.ordering == .source {
                    Section(header: Text(article.source.name ?? "Unknown Source")) {
                        NewsRow(article: article)
                    }
                } else {
                    NewsRow(article: article)
                }
            }.navigationBarTitle("Snooz",displayMode: .automatic)
            .navigationBarItems(trailing: Button(action: {
                self.newsModel.resetData {
                    withAnimation{
                        self.newsModel.loadData()
                    }
                }
            }, label: {
                Image(systemName:"arrow.clockwise")}
            ))
            }
            
            
            GeometryReader { proxy in
                VStack(spacing:8){
                    Image(systemName: Constants.MainIconString)
                        .resizable().aspectRatio(contentMode: .fit).padding()
                        .frame(width: proxy.size.width * 0.5, height: proxy.size.width * 0.5, alignment: .center)
                    Text("Snooz").font(.largeTitle).bold()
                    Text("Select An Article").font(.subheadline)
                }
            }
            
        }
    }
}

let testData = NewsModel(debug: true)

struct NewsList_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            NewsList().environmentObject(testData)
            NewsList().environmentObject(testData)
                .environment(\.colorScheme, .dark)
        }
    }
}

