//
//  HeadingImage.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct HeadingImage: View {
  
  var image:Image
  
  var body: some View {
    VStack {
      image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, idealHeight: 300, maxHeight: 300).clipped()
      Spacer()
    }
  }
}

struct HeadingImage_Previews: PreviewProvider {
    static var previews: some View {
      HeadingImage(image: Image("calc"))
    }
}
