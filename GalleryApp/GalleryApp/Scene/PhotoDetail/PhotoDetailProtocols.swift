//
//  PhotoDetailProtocols.swift
//  GalleryApp
//
//  Created by Barbara Souza on 16/02/21.
//

import Foundation

protocol PhotoDetailViewControllerProtocol: class {
    func show(viewModel: PhotoDetailViewModel)
}

protocol PhotoDetailPresenterProtocol: class {
    var viewController: PhotoDetailViewControllerProtocol? { get set}
    func viewDidiLoad()
}
