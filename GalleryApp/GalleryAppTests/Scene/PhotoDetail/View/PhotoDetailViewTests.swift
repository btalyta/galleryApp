//
//  PhotoDetailViewTest.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

import XCTest
import SnapshotTesting

@testable import GalleryApp

class PhotoDetailViewTests: XCTestCase {
    func test_show() {
        let sut = PhotoDetailView()
        sut.show(viewModel: PhotoDetailViewModel(image: ImageMock.createImage(with: .cyan, width: 200, height: 200),
                                                 title: "Color"))
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 512, height: 610)))
    }
}
