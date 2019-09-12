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
          Text("hello world")
        ){
        HStack{
          self.model.image(id: article.id)
          Text(article.title)
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
