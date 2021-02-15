//
//  PhotoCellTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import XCTest
import SnapshotTesting

@testable import GalleryApp

class PhotoCellTests: XCTestCase {
    func test_defaultAppearance() {
        let sut = PhotoCell()
        sut.show(ImageMock.createImage(with: .purple, width: 200, height: 200))
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 210, height: 210)))
    }
}
