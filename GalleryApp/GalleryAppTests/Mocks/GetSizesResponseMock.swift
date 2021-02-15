//
//  GetSizesResponseMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

@testable import GalleryApp

final class GetSizesResponseMock {
    static let value = SizeResponse(sizes: makeSizes())

    static func makeSize() -> Size {
        return Size(label: .largeSquare,
                    width: 512,
                    height: 512,
                    source: "https://live.staticflickr.com/5800/31456463045_5a0af4ddc8_s.jpg",
                    url: "")
    }

    static func makeSizes() -> Sizes {
        return Sizes(size: [makeSize()])
    }
}
