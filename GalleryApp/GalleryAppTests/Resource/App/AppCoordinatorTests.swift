//
//  AppCoordinatorTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//


import XCTest

@testable import GalleryApp

class AppCoordinatorTests: XCTestCase {
    var sut: AppCoordinator!
    var window: UIWindow!

    func test_start_showsSearchViewController() {
        setupSUT()

        sut.start()
        let controller = sut.navigationController.viewControllers.first

        XCTAssertEqual(controller?.isKind(of: GalleryViewController.self), true)
    }

    func test_searchBarSearchButtonClicked_showPhotoDetailView() {
        setupSUT()

        sut.wantsToShow(SearchResponseMock.makePhoto())
        let controller = sut.navigationController.viewControllers.first

        XCTAssertEqual(controller?.isKind(of: PhotoDetailViewController.self), true)
    }

    func setupSUT() {
        window = UIWindow()
        sut = AppCoordinator(window: window, navigationController: UINavigationController())
    }
}
