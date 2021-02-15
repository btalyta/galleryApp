//
//  PhotosViewTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import XCTest
import SnapshotTesting

@testable import GalleryApp

class PhotosViewTests: XCTestCase {
    func test_show_whenIsLoadingIsFalse() {
        let imageDownloaderMock = ImageDownloaderMock()
        let sut = PhotosView(imageDownloader: imageDownloaderMock)
        imageDownloaderMock.image = ImageMock.createImage(with: .systemPink, width: 200, height: 200)

        sut.show(viewModel: PhotosViewModel(photos: [SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto()],
                                            hasMore: false, isLoading: false))

        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 512, height: 610)))
    }

    func test_show_whenIsLoadingIsTrue() {
        let imageDownloaderMock = ImageDownloaderMock()
        let sut = PhotosView(imageDownloader: imageDownloaderMock)
        imageDownloaderMock.image = ImageMock.createImage(with: .systemPink, width: 200, height: 200)

        sut.show(viewModel: PhotosViewModel(photos: [SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto(),
                                                     SearchResponseMock.makePhoto()],
                                            hasMore: false, isLoading: true))

        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 512, height: 610)))
    }
}
