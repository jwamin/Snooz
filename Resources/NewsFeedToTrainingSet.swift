#!/usr/bin/swift
//
//  NewsFeedToTrainingSet.swift
//  Snooz
//
//  Created by Joss Manger on 7/4/20.
//  Copyright © 2020 Joss Manger. All rights reserved.
//

import Foundation

/*
 1. Get Array of files in "out" directory matching news-headlines-**.json
 2. Convert to format:
 [
     {
         "text": "{description}",
         "label": "{classification}"
     }, {
 ...
 ]
 output in one file
 
 */

struct ArticleClasificationTrainingModel: Codable {
    let text: String
    let label: String
}

/*Models*/

struct NewsResponse : Codable{
  let status:String
  let totalResults:Int
  let articles:[Article]
}

struct Article : Codable, Identifiable {
  
  var id:UUID = UUID()
  
  let source:Source
  let author:String?
  let title:String
  let description:String?
  let url:URL
  let imageURL:String?
  let publishedAt:String
  let content:String?
  
  enum CodingKeys : String, CodingKey {
    case source
    case author
    case title
    case description
    case url
    case imageURL = "urlToImage"
    case publishedAt
    case content
  }
  
}

struct Source : Codable {
  let id:String?
  let name:String?
}




/* Implementation */

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}


func main(){
    
    var assembledModels = [ArticleClasificationTrainingModel]()
    
    let urlForCurrentDirectory = URL(fileURLWithPath: "./out", isDirectory: true)
    
    do {
    let content = try FileManager.default.contentsOfDirectory(at: urlForCurrentDirectory, includingPropertiesForKeys: [], options: [.skipsHiddenFiles])
    
    let jsonDecoder = JSONDecoder()
    
    for jsonFileUrl in content {
        
        do {
            print(FileManager.default.isReadableFile(atPath: jsonFileUrl.absoluteString))
            let jsonData = try Data(contentsOf: jsonFileUrl)
            let response = try jsonDecoder.decode(NewsResponse.self, from: jsonData)
            assembledModels += processResponse(response: response)
        } catch {
            print("failure for \(jsonFileUrl)")
            continue
        }
        
    }
    } catch {
        fatalError("unable to load json files, contents of directory failure: \(error.localizedDescription)")
    }
    //write back to file
    
    let data = try? JSONEncoder().encode(assembledModels)
    
    guard let outputString = data?.prettyPrintedJSONString, let prettyData = String(outputString).data(using:.utf8) else {
        print("unable to save file")
        return
    }
    
    FileManager.default.createFile(atPath: "./training-data.json", contents: prettyData, attributes: nil)

}

func processResponse(response: NewsResponse) -> [ArticleClasificationTrainingModel] {
    var returnArray = Array<ArticleClasificationTrainingModel>()
    for article in response.articles{
        guard let description = article.description, !description.isEmpty  else {
            print("failed to get description for \(article.id)")
            continue
        }
        let classificationData = ArticleClasificationTrainingModel(text: description, label: "")
        returnArray.append(classificationData)
    }
    
    return returnArray
}

main()
