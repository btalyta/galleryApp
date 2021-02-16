//
//  PhotoDetailPresenter.swift
//  GalleryApp
//
//  Created by Barbara Souza on 16/02/21.
//

import UIKit

class PhotoDetailPresenter: PhotoDetailPresenterProtocol {
    weak var viewController: PhotoDetailViewControllerProtocol?
    private let imageDownloader: ImageDownloaderProtocol
    private let item: Photo

    init(imageDownloader: ImageDownloaderProtocol = ImageDownloader(),
         item: Photo) {
        self.imageDownloader = imageDownloader
        self.item = item
    }

    func viewDidiLoad() {
        imageDownloader.getPhoto(from: item.id) { [weak self] imageResult in
            guard let self = self else { return }
            self.viewController?.show(viewModel: PhotoDetailViewModel(image: imageResult ?? UIImage(), title: self.item.title))
        }
    }
}
