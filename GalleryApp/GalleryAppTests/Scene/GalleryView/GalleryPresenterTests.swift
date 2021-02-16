//
//  GalleryPresenterTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule
import XCTest

@testable import GalleryApp

class GalleryPresenterTests: XCTestCase {
    var sut: GalleryPresenter!
    var viewControllerMock: GalleryViewControllerMock!
    var repositoryMock: GalleryRepositoryMock!

    func test_wantsToSearch_whenRequestFails_callsViewControllerShowError() {
        setupSUT()
        repositoryMock.result = nil

        sut.wantsToSearch(text: "kitten")

        XCTAssertTrue(viewControllerMock.showErrorWasCalled)
        XCTAssertEqual(viewControllerMock.message, "Could not connect to the server.")
        XCTAssertEqual(repositoryMock.resquestPhotosCount, 1)
        XCTAssertEqual(repositoryMock.page, 1)
        XCTAssertEqual(repositoryMock.tags, "kitten")
    }

    func test_wantsToSearch_whenRequestIsSuccessful_callsViewControllerShowViewModel() {
        setupSUT()
        repositoryMock.result = SearchResponseMock.value.photos
        let expectedViewModel = PhotosViewModel(photos: SearchResponseMock.value.photos.photo,
                                                hasMore: true,
                                                isLoading: false)

        sut.wantsToSearch(text: "kitten")

        XCTAssertEqual(repositoryMock.resquestPhotosCount, 1)
        XCTAssertEqual(repositoryMock.page, 1)
        XCTAssertEqual(repositoryMock.tags, "kitten")
        XCTAssertEqual(viewControllerMock.viewModel, expectedViewModel)
        XCTAssertTrue(viewControllerMock.showWasCalled)
    }

    func test_loadMore_whenTagIsEmpty() {
        setupSUT()
        repositoryMock.result = SearchResponseMock.value.photos

        sut.loadMore()

        XCTAssertEqual(repositoryMock.resquestPhotosCount, 0)
        XCTAssertNil(repositoryMock.page)
        XCTAssertNil(repositoryMock.tags)
    }

    func test_loadMore_whenTagIsNotEmpty_andRequestIsSuccessful_callsViewControllerShowViewModel() {
        setupSUT()
        repositoryMock.result = SearchResponseMock.value.photos
        var expectedViewModel = PhotosViewModel(photos: SearchResponseMock.value.photos.photo,
                                                hasMore: true,
                                                isLoading: false)
        expectedViewModel.photos.append(contentsOf: SearchResponseMock.value.photos.photo)

        sut.wantsToSearch(text: "kitten")
        sut.loadMore()

        XCTAssertEqual(repositoryMock.resquestPhotosCount, 2)
        XCTAssertEqual(repositoryMock.page, 2)
        XCTAssertEqual(repositoryMock.tags, "kitten")
        XCTAssertEqual(viewControllerMock.viewModel, expectedViewModel)
        XCTAssertTrue(viewControllerMock.showWasCalled)
    }

    func test_loadMore_whenTagIsNotEmpty_andRequestFails_itShouldCorrectPage() {
        setupSUT()
        repositoryMock.result = SearchResponseMock.value.photos

        sut.wantsToSearch(text: "kitten")
        repositoryMock.result = nil
        sut.loadMore()
        repositoryMock.result = SearchResponseMock.value.photos
        sut.loadMore()

        XCTAssertEqual(repositoryMock.resquestPhotosCount, 3)
        XCTAssertEqual(repositoryMock.page, 2)
        XCTAssertEqual(repositoryMock.tags, "kitten")
    }

    func test_loadMore_whenTagIsNotEmpty_andIsLastPage_doesntResquestPhotos() {
        setupSUT()
        repositoryMock.result = SearchResponseMock.makePhotos(pages: 1)

        sut.wantsToSearch(text: "kitten")
        sut.loadMore()

        XCTAssertEqual(repositoryMock.resquestPhotosCount, 1)
        XCTAssertEqual(repositoryMock.page, 1)
        XCTAssertEqual(repositoryMock.tags, "kitten")
    }

    func test_didSelectItem_callsViewControllerWantsToShow() {
        setupSUT()
        let expectedItem = Photo(id: "50943112551", title: "February 6, 2017")
        repositoryMock.result = SearchResponseMock.value.photos
        sut.wantsToSearch(text: "kitten")
        
        sut.didSelectItem(row: 0)

        XCTAssertTrue(viewControllerMock.wantsToShowWasCalled)
        XCTAssertEqual(viewControllerMock.item, expectedItem)
    }

    func setupSUT() {
        viewControllerMock = GalleryViewControllerMock()
        repositoryMock = GalleryRepositoryMock()
        sut = GalleryPresenter(repository: repositoryMock)
        sut.viewController = viewControllerMock
    }
}
