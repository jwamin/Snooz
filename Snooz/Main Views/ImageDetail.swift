//
//  ImageDetail.swift
//  Snooz
//
//  Created by Joss Manger on 9/9/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct ImageDetail: View {
  var image:Image
  var title:String
  var source:String
  
  @State var zoomed = false
  
    var body: some View {
      ZStack{
        image
          .resizable()
          .aspectRatio(contentMode: (zoomed ? .fill : .fit))
          .onTapGesture {
            withAnimation(.spring()){
              self.zoomed = !self.zoomed
            }
        }
        VStack{
          Spacer()
          HStack{
          VStack(alignment:.leading){
          Text(title)
            .font(.headline)
            .foregroundColor(.primary)
          Text(source)
            .font(.subheadline)
            .foregroundColor(.secondary)
            }.padding()
            .opacity(self.zoomed ? 0.0 : 1.0)
            Spacer()
          }
        }
        }.navigationBarTitle(title)
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetail(image: Image(systemName: "gear"), title: "My Article", source: "My Source")
    }
}
