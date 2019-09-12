//
//  Constants.swift
//  Snooz
//
//  Created by Joss Manger on 9/7/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import SwiftUI

struct Constants {
  static let API_KEY = "510332d2557240f496c74ee5687e547e"
  static let topLocalHeadlines = "https://newsapi.org/v2/top-headlines?country=\(Locale.current.regionCode!.lowercased())&apiKey=510332d2557240f496c74ee5687e547e"
}

#if os(iOS)
extension Color {
  static let lightGrey = Color.init(UIColor.systemGray5)
}
#endif
