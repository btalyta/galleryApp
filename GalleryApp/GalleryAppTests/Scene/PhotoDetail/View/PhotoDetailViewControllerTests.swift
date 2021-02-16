//
//  PhotoDetailViewControllerTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

import XCTest

@testable import GalleryApp

class PhotoDetailViewControllerTests: XCTestCase {
    func test_viewDidLoad_callsPresenterViewDidLoad() {
        let presenterMock = PhotoDetailPresenterMock()
        let sut = PhotoDetailViewController(presenter: presenterMock)
        sut.viewDidLoad()

        XCTAssertTrue(presenterMock.viewDidiLoadWasCalled)
    }
}
