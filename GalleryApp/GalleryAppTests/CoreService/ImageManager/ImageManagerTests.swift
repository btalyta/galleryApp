//
//  ImageManagerTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import XCTest

@testable import GalleryApp
class ImageManagerTests: XCTestCase {
    func test_download_whenRequestIsSuccessful_itShouldRetunsData_andSaveData() {
        let networkMock = MockNetworking()
        let imageStore = ImageStoreManager()
        let sut = ImageManager(imageStore: imageStore, network: networkMock)

        networkMock.data = ImageMock.createImage(with: .blue).pngData()
        sut.download("success.result", imageUrl: "success.result") { result in
            XCTAssertNotNil(result)
        }
        XCTAssertNotNil(imageStore.getImage("success.result"))
    }

    func test_download_whenRequestFails_itShouldRetunsNil() {
        let networkMock = MockNetworking()
        let sut = ImageManager(imageStore: ImageStoreManager(), network: networkMock)
        networkMock.data = nil
        sut.download("success.error", imageUrl: "success.error") { result in
            XCTAssertNil(result)
        }
    }
}
