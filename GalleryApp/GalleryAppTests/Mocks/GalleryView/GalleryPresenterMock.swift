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
    var didSelectItemWasCalled = false
    var row: Int?

    func wantsToSearch(text: String) {
        wantsToSearchWasCalled = true
        tag = text
    }

    func loadMore() {
        loadMoreWasCalled = true
    }

    func didSelectItem(row: Int) {
        didSelectItemWasCalled = true
        self.row = row
    }
}
