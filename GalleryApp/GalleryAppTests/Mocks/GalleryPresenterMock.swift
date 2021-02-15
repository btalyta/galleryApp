//
//  GalleryPresenterMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

@testable import GalleryApp

final class GalleryPresenterMock: GalleryPresenterProtocol {
    var viewController: GalleryViewControllerProtocol?
    var wantsToSearchWasCalled = false
    var tag: String?
    var loadMoreWasCalled = false

    func wantsToSearch(text: String) {
        wantsToSearchWasCalled = true
        tag = text
    }

    func loadMore() {
        loadMoreWasCalled = true
    }


}
