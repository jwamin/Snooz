//
//  HostingController.swift
//  SnoozWatch WatchKit Extension
//
//  Created by Joss Manger on 9/12/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<AnyView> {
    override var body: AnyView {
      return AnyView(ContentView().environmentObject(NewsModel(load:true)))
    }
}
