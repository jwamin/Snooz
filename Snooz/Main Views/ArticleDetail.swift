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
    
    static let fallbackImage = Image(systemName: Constants.MainIconString)
    
    var overrideImage: Image?
    
    private var displayImage: Image {
        overrideImage ?? (newsModel.image(id: article.id) ?? Self.fallbackImage)
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
                                Image(systemName: Constants.MainIconString)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
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
                }
                
                .padding(.top,300)
                
                
            }
        }
    }
}

#if DEBUG

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = testData.articles[0]
        let image = Image("test")
        
        return Group{
            ArticleDetail(article: article,overrideImage: image).environmentObject(testData).previewDevice(PreviewDevice(stringLiteral: "iPhone SE 2"))
            ArticleDetail(article: article).previewDevice(PreviewDevice(stringLiteral: "iPhone 11 Pro"))
                .environmentObject(testData)
                .environment(\.colorScheme, .dark)
        }
    }
}

#endif


