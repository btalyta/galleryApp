//
//  GalleryProtocols.swift
//  GalleryApp
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

protocol GalleryRepositoryProtocol {
    func resquestPhotos(tags: String, page: Int, completion: @escaping ((Result<Photos, APIError>) -> Void))
}

protocol GalleryPresenterProtocol: class {
    var viewController: GalleryViewControllerProtocol? { get set}
    func wantsToSearch(text: String)
    func loadMore()
    func didSelectItem(row: Int)
}

protocol GalleryViewControllerProtocol: class {
    func showError(message: String)
    func show(viewModel: PhotosViewModel)
    func wantsToShow(_ item: Photo)
}

protocol GalleryViewControllerDelegate: class {
    func wantsToShow(_ item: Photo)
}

