# Snooz
## Ephemeral SwiftUI News App

### Top headlines from NewsAPI. Zero persistence. 

![Alt text](/shots/IMG_4860.jpg?raw=true "Screenshot")
![Alt text](/shots/IMG_4859.jpg?raw=true "Screenshot")

### Done
* Locale driven news using `Locale.current`
* Dark Mode!
* Detail view with nice view hierarchy
* Animations/transitions for zoom view, pan etc
* Secondary requests for article images with Combine
* (quick) Refresh Control
* Zoom an drag view on image tap (push w/ `NavigationLink`)
* Basic LaunchScreen Storyboard with AutoLayoutConstraints
* Share button to UIKit bridged `UIActivityViewController`
* Image request optimisations

### TODO
* DateFormatter - parse returned date (Use swiftUI inbuilt - if possible)
* update screenshots
* activity indicators for loading images
* Sections / Headers - fix headings so there are distinct
* Implement CoreML / CreateML Classifier from data over time

#### Frameworks Used
`SwiftUI` `Combine`
