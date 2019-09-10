//
//  ShareButton.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ShareButton: View {
  let url:URL
  @State private var showShareSheet:Bool = false
    var body: some View {
      Button(action: {
        self.showShareSheet.toggle()
        print(self.showShareSheet)
      }) {
          HStack(alignment:.center){
            Image(systemName: "square.and.arrow.up")
            Text("Share")
          }
        }.sheet(isPresented: $showShareSheet, onDismiss: {
          self.showShareSheet = false
        }) {
          ShareSheet(url: self.url)
          //Text("\(self.url.absoluteString)")
        }
      .padding(.horizontal, 30)
        .padding([.top,.bottom], 15)
        .background(Color.lightGrey)
        .cornerRadius(10)
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
      ShareButton(url: URL(string: "http://www.google.com")!).previewLayout(.sizeThatFits)
    }
}
