## GalleryApp

GalleryApp GalleryApp is an app that shows photos according to the searched tag.

### Architecture

The architecture used do build app was MVP with Coordinators. Each view was built using view code and your attributes cannot access by others class.

#### Coordinator
The coordinator is responsible for managing the navigation flow in the app. 

#### ViewControllers
The presentation of views is managed by the ViewController.

#### Presenters
The data manipulation, user actions and requests are responsibilities the Presenter.

#### Repository
The repository is responsible for connecting the presenter to the network layer, sending the necessary data for resquest and making small treatments of the response received before returning it to the presenter 

### Libraries
- [NetworkingModule](https://github.com/btalyta/networkingModule): library for making API requests. 

### Tests
For the test, the XCTest and the following libraries were used 
- [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing): for the preview unit tests 

### Installation:

It requires iOS 13 and Xcode 11.
The snapshot test was recorded on iPhone 11 (ios 14.2) 
