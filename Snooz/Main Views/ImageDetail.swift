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
    var titleDisplay: NavigationBarItem.TitleDisplayMode {
        (self.zoomed ? .inline : .large)
    }
    var body: some View {
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
                    .clipped()
                    .gesture(
                        DragGesture()
                            .onChanged { (move) in
                                if self.zoomed {
                                    self.picOffset = CGPoint(x: move.translation.width, y: move.translation.height)
                                }
                            }.onEnded { (ended) in
                                if self.zoomed {
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
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center).clipped().navigationBarTitle(title).clipped().edgesIgnoringSafeArea(.all) //.navigationBarTitle(title,displayMode: zoomed ? .inline : .large) for some reason busted on iOS13
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
