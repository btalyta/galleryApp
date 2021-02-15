//
//  GalleryViewControllerTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import XCTest

@testable import GalleryApp

class GalleryViewControllerTests: XCTestCase {
    var sut: GalleryViewController!
    var presenterMock: GalleryPresenterMock!
    var searchController: UISearchController!
    var photosView: PhotosView!

    func test_searchBarSearchButtonClicked_whenThereIsText_callsWantsToSearchsPresenter() {
        setupSUT()
        sut.viewDidLoad()
        searchController.searchBar.text = "kitten"

        searchController.searchBar.delegate?.searchBarSearchButtonClicked?(searchController.searchBar)

        XCTAssertEqual(presenterMock.tag, "kitten")
        XCTAssertTrue(presenterMock.wantsToSearchWasCalled)
    }

    func test_searchBarSearchButtonClicked_whenTextIsEmpty_doesntCallWantsToSearchsPresenter() {
        setupSUT()
        sut.viewDidLoad()

        searchController.searchBar.delegate?.searchBarSearchButtonClicked?(searchController.searchBar)

        XCTAssertNil(presenterMock.tag)
        XCTAssertFalse(presenterMock.wantsToSearchWasCalled)
    }

    func test_bindActions_loadMore_callsPresentLoadMore() {
        setupSUT()
        sut.viewDidLoad()

        photosView.loadMore?()

        XCTAssertTrue(presenterMock.loadMoreWasCalled)
    }

    func setupSUT() {
        photosView = PhotosView(imageDownloader: ImageDownloaderMock())
        presenterMock = GalleryPresenterMock()
        searchController = UISearchController(searchResultsController: nil)
        sut = GalleryViewController(presenter: presenterMock,
                                    searchController: searchController,
                                    contentView: photosView)
        presenterMock.viewController = sut
    }
}
