//
//  SearchResponseMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

@testable import GalleryApp

final class SearchResponseMock {
    static let value =  SearchResponse(photos: makePhotos())

    static func makePhoto() -> Photo {
        return Photo(id: "50943112551", title: "February 6, 2017")
    }

    static func makePhotos(page: Int = 1,
                           pages: Int = 10,
                           perpage: Int = 3) -> Photos {
        return Photos(page: page,
                      pages: pages,
                      perpage: perpage,
                      photo: [makePhoto(), makePhoto(), makePhoto()])

    }
}
