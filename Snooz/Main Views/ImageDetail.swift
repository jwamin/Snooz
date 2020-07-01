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
    @State var picOffset: CGPoint = .zero
    @State var zoomed = false
    
    var body: some View {
        ZStack {
            ZStack{
                image
                    .resizable()
                    .aspectRatio(contentMode: (zoomed ? .fill : .fit))
                    .offset(x: picOffset.x, y: picOffset.y)
                    .onTapGesture {
                        withAnimation(.spring()){
                            self.zoomed = !self.zoomed
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { (move) in
                                if zoomed {
                                    self.picOffset = CGPoint(x: move.translation.width, y: move.translation.height)
                                }
                            }.onEnded { (ended) in
                                if zoomed {
                                    withAnimation(.spring()){
                                        self.picOffset = .zero
                                    }
                                }
                            }
                    )
                if !zoomed {
                    VStack{
                        HStack{
                            VStack(alignment:.leading){
                                Text(title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(source)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }.padding()
                            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .bottomLeading)
                            .transition(.opacity)
                        }
                    }.transition(.opacity)
                }
            }.navigationBarTitle(title,displayMode: zoomed ? .inline : .large)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageDetail(image: Image("test"), title: "My Article", source: "My Source")
            ImageDetail(image: Image("test"), title: "My Article", source: "My Source").colorScheme(.dark)
        }
    }
}
