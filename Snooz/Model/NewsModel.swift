//
//  NewsModel.swift
//  Snooz
//
//  Created by Joss Manger on 9/7/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI
import Combine

class NewsModel : ObservableObject {
    
    @Published var images = [UUID:Image]()
    
    @Published var articles:[Article] = []
    
    private var storage = Set<AnyCancellable>()
    
    func resetData(_ callback:()->Void){
        //resetImages
        images = [:]
        articles = []
        callback()
    }
    
    func loadData(){

        if let url = URL(string: Constants.topLocalHeadlines){
            print(url)
            URLSession.shared.dataTaskPublisher(for: url).map({ response in
                return response.data
            }).decode(type: NewsResponse.self, decoder: JSONDecoder()).tryCatch({ (error) -> AnyPublisher<NewsResponse,Error> in
                print(error)
                return AnyPublisher<NewsResponse,Error>(Empty())
            }).map({ response in
                return response.articles
            }).replaceError(with: []).receive(on: RunLoop.main).assign(to: \.articles, on: self).store(in: &storage)
        } else {
            print("error")
        }
    }
    
    func loadImage(for identifier:UUID){

        guard let article = articles.first(where: { (article) -> Bool in
            article.id == identifier
        }), let urlString = article.imageURL, let url = URL(string:urlString), url.scheme == "https" else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url).map(\.data)
            .compactMap({ data in
                data
            }).map({ data in
                UIImage(data: data)
            })
            .replaceError(with: UIImage(systemName: "xmark"))
            .compactMap({ uiimg in
                uiimg
            })
            .compactMap({ (image) in
                return Image(uiImage: image)
            })
        .receive(on:RunLoop.main)
        .sink{ image in
            self.images[identifier] = image
        }.store(in: &storage)
        
    }
    
    func image(id:UUID)->Image? {
        self.images[id]
    }
    
    #if DEBUG
    convenience init(debug: Bool = true) {
        self.init()
        self.articles = loadTestData()
    }
    #endif
    
}

struct NewsModel_Previews: PreviewProvider {
    static var previews: some View {
        //ForEach(ContentSizeCategory.AllCases){ item in
        ForEach(NewsModel(debug: true).articles){ article in
            NewsItemCell(article: article, image: Image(systemName: "doc.richtext"))
                .previewLayout(.sizeThatFits)
        }
        //}
    }
}
