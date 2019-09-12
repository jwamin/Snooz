//
//  ContentView.swift
//  SnoozWatch WatchKit Extension
//
//  Created by Joss Manger on 9/12/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var model:NewsModel
  
    var body: some View {
      List(model.articles){ article in
        NavigationLink(destination:
          GeometryReader{ geometry in
            ZStack{
              self.model.image(id: article.id)
              .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .padding()
            Text(article.title)
              .font(.title)
              .padding()
            }
          }
        ){
        HStack{
          self.model.image(id: article.id)
          .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .padding()
          Text(article.title)
            
          .padding()
        }
        }
      }.navigationBarTitle("Snooz")
    }
}

#if DEBUG

let model = NewsModel()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .environmentObject(model)
    }
}

#endif
