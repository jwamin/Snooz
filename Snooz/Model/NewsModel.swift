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
    
    @Published var ordering: Ordering = .alphabetical {
        didSet{
            articles = self.reorder(articles: articles)
        }
    }
    
    private var storage = Set<AnyCancellable>()
    
    func resetData(_ callback:()->Void){
        images = [:]
        articles = []
        callback()
    }
    
    func reorder(articles:[Article]) -> [Article] {
        
        var articles = articles
        
        switch self.ordering{
        case .alphabetical:
            articles.sort {
                $0.title < $1.title
            }
            break
        case .date:
            articles.sort {
                $0.publishedAt < $1.publishedAt
            }
            break
        case .source:
            articles.sort {
                $0.source.name! < $1.source.name!
            }
            break
        }
        
        return articles
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
                return self.reorder(articles: response.articles)
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
    
    convenience init(debug: Bool = true) {
        self.init()
        self.articles = loadTestData()
    }
    
}

struct NewsModel_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(NewsModel(debug: true).articles){ article in
            NewsItemCell(article: article, image: Image(systemName: Constants.MainIconString))
                .previewLayout(.sizeThatFits)
        }
    }
}
