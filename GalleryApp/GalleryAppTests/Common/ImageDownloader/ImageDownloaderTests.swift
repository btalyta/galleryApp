//
//  ImageDownloaderTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import Foundation
import XCTest

@testable import GalleryApp

class ImageDownloaderTests: XCTestCase {
    func test_getPhoto_whenRequestIsSuccessful_callsImageManagerDownload_andReuturnsImage() {
        let networkMock = MockNetworking()
        let imageStore = ImageStoreManager()
        let imageManagerMock = ImageManagerMock()
        let sut = ImageDownloader(network: networkMock,
                                  imageStore: imageStore,
                                  imageManager: imageManagerMock)
        networkMock.result = GetSizesResponseMock.value
        imageManagerMock.image = ImageMock.createImage(with: .cyan)

        sut.getPhoto(from: "1234567AA") { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.isKind(of: UIImage.self), true)
            XCTAssertEqual(imageManagerMock.downloadCalledCount, 1)
        }
    }

    func test_getPhoto_whenRequestFails_returnsNil() {
        let networkMock = MockNetworking()
        let imageStore = ImageStoreManager()
        let imageManagerMock = ImageManagerMock()
        let sut = ImageDownloader(network: networkMock,
                                  imageStore: imageStore,
                                  imageManager: imageManagerMock)
        networkMock.result = nil
        imageManagerMock.image = nil

        sut.getPhoto(from: "1234567AA") { result in
            XCTAssertNil(result)
            XCTAssertEqual(imageManagerMock.downloadCalledCount, 0)
        }
    }
}

