//
//  Sharing.swift
//  Snooz
//
//  Created by Joss Manger on 9/10/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import UIKit
import SwiftUI

struct ShareSheet : UIViewControllerRepresentable{
  
  let url:URL
  
  
  typealias UIViewControllerType = UIActivityViewController
  
  func makeUIViewController(context: Context) -> UIActivityViewController {
    let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: [])
    activityVC.excludedActivityTypes = []
    return activityVC
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
      
  }

  static func dismantleUIViewController(_ uiViewController: UIActivityViewController, coordinator: ()) {
    
    print("dismantling")
  }
  
  
}
