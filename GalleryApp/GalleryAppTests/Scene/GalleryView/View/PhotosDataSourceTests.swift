//
//  PhotosDataSourceTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import XCTest

@testable import GalleryApp

class PhotosDataSourceTests: XCTestCase {
    var sut: PhotosDataSource!
    var items: [Photo]!
    var collection: UICollectionView!
    var imageDownloaderMock: ImageDownloaderMock!
    let index = IndexPath(row: 0, section: 0)

    func test_numberOfItemsInSection_returnsCorrectValue() {
        setupSUT()
        let result = sut.collectionView(collection, numberOfItemsInSection: 0)
        XCTAssertEqual(result, 3)
    }

    func test_cellForItemAt_returnsCellOfTypePhotoCell_andCallsImageDownloader() {
        setupSUT()

        let result = sut.collectionView(collection, cellForItemAt: index)

        XCTAssertEqual(result.isKind(of: PhotoCell.self), true)
        XCTAssertTrue(imageDownloaderMock.getPhotoWasCalled)
    }

    func test_didSelectItemAt_callsDidTapItem() {
        setupSUT()
        var resultIndex: Int?
        var didTapItemWasCalled = false

        sut.didTapItem = { index in
            resultIndex = index
            didTapItemWasCalled = true
        }

        sut.collectionView(collection, didSelectItemAt: index)

        XCTAssertEqual(resultIndex, 0)
        XCTAssertTrue(didTapItemWasCalled)
    }

    func test_willDisplay_andHasMoreIsTrue_andIsLoadingIsFalse_callsLoadMore() {
        setupSUT()
        var didTapItemCalled = false


        sut.loadMore = {
            didTapItemCalled = true
        }

        sut.collectionView(collection, willDisplay: PhotoCell(), forItemAt: IndexPath(row: 5, section: 0))

        XCTAssertTrue(didTapItemCalled)
    }

    func test_willDisplay_andHasMoreIsFalse_andIsLoadingIsFalse_doesntCallLoadMore() {
        setupSUT()
        var didTapItemCalled = false


        sut.loadMore = {
            didTapItemCalled = true
        }

        sut.update(items: [], hasMore: false, isLoading: false)
        sut.collectionView(collection, willDisplay: PhotoCell(), forItemAt: IndexPath(row: 5, section: 0))

        XCTAssertFalse(didTapItemCalled)
    }

    func test_willDisplay_andHasMoreIsTrue_andIsLoadingIsTrue_doesntCallLoadMore() {
        setupSUT()
        var didTapItemCalled = false


        sut.loadMore = {
            didTapItemCalled = true
        }

        sut.update(items: [], hasMore: true, isLoading: true)
        sut.collectionView(collection, willDisplay: PhotoCell(), forItemAt: IndexPath(row: 5, section: 0))

        XCTAssertFalse(didTapItemCalled)
    }

    func setupSUT() {
        items = [SearchResponseMock.makePhoto(),
                 SearchResponseMock.makePhoto(),
                 SearchResponseMock.makePhoto()]
        imageDownloaderMock = ImageDownloaderMock()
        sut = PhotosDataSource(imageDownloader: imageDownloaderMock, items: items)
        let layout = UICollectionViewFlowLayout()
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collection.dataSource = sut
    }
}
