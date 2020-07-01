//
//  Segmented.swift
//  Snooz
//
//  Created by Joss Manger on 6/30/20.
//  Copyright © 2020 Joss Manger. All rights reserved.
//

import SwiftUI

struct Segmented: View {
    @Binding var ordering: Ordering
    var body: some View {
        HStack{
            ForEach(Ordering.allCases) { ordering in
                Button(action:  {
                    self.ordering = ordering
                }, label: {
                    Text(ordering.displayString)
                }).disabled(ordering == self.ordering)
            }
        }
    }
}

struct Segmented_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        Segmented(ordering: .constant(.date)).previewLayout(.sizeThatFits)
            Segmented(ordering: .constant(.source)).previewLayout(.sizeThatFits)
        }
    }
}
