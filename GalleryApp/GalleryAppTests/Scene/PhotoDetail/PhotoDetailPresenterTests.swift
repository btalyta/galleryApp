//
//  PhotoDetailPresenterTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

import XCTest

@testable import GalleryApp

class PhotoDetailPresenterTests: XCTestCase {
    func test_viewDidLoad_callsViewControllerShowViewModel() {
        let viewControllerMock = PhotoDetailViewControllerMock()
        let imageDownloaderMock = ImageDownloaderMock()
        let sut = PhotoDetailPresenter(imageDownloader: imageDownloaderMock, item: SearchResponseMock.makePhoto())
        let imageMock = ImageMock.createImage(with: .brown)
        let expectedModel = PhotoDetailViewModel(image: imageMock, title: "February 6, 2017")
        sut.viewController = viewControllerMock

        imageDownloaderMock.image = imageMock
        sut.viewDidiLoad()

        XCTAssertTrue(viewControllerMock.showWasCalled)
        XCTAssertEqual(viewControllerMock.viewModel, expectedModel)
        XCTAssertTrue(imageDownloaderMock.getPhotoWasCalled)
    }
}
