//
//  GalleryViewControllerDelegateMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

@testable import GalleryApp

final class GalleryViewControllerDelegateMock: GalleryViewControllerDelegate {
    var wantsToShowWasCalled = false
    var item: Photo?

    func wantsToShow(_ item: Photo) {
        wantsToShowWasCalled = true
        self.item = item
    }
}
