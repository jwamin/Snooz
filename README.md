# Snooz
## Ephemeral SwiftUI News App

### Top headlines from NewsAPI. Zero persistence. 

![Alt text](/shots/IMG_4860.jpg?raw=true "Screenshot")
![Alt text](/shots/IMG_4859.jpg?raw=true "Screenshot")

### Done
* Locale driven news using `Locale.current`
* Detail view with nice view hierarchy
* Secondary requests for article images
* (quick) Refresh Control
* Zoom view on image tap (push w/ `NavigationLink`)
* Basic LaunchScreen Storyboard with AutoLayoutConstraints
* Share button to UIKit bridged `UIActivityViewController`
* Image request optimisations

### TODO
* Dark mode fix. `@Environment var colorScheme: ColorScheme`
* DateFormatter
* Animations/transitions for zoom view, pan etc
* Further Image request optimisations - optimize `onAppear`?
* Sources

#### Frameworks Used
`SwiftUI` `Combine`
