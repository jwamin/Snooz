//
//  ShareButton.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        Button(action: {
          print("oh hello")
        }) {
          HStack(alignment:.center){
            Image(systemName: "square.and.arrow.up")
            Text("Share")
          }
        }
        .padding(.horizontal, 10)
        .padding([.top,.bottom], 5)
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
